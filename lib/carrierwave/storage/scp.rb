module CarrierWave
  module Storage
    class SCP < Abstract

      def store!(file)
        f = CarrierWave::Storage::SCP::File.new(uploader, self, uploader.store_path)
        f.store(file)
        f
      end

      def retrieve!(identifier)
        CarrierWave::Storage::SCP::File.new(uploader, self, uploader.store_path(identifier))
      end

      class File 
        attr_reader :path

        def extension
          path.split('.').last
        end

        def initialize(uploader, base, path)
          @uploader, @base, @path = uploader, base, path
        end

        def read
          file
        end

        def size
          file.length
        end

        def store(new_file)
          Net::SSH.start(@uploader.scp_host, @uploader.scp_user, @uploader.scp_options) do |session|
            new_dir = path.split('/')
            new_dir.delete(new_dir[-1])
            new_dir = new_dir.join('/')
            session.exec! "mkdir -p #{@uploader.scp_folder}/#{new_dir}"
            session.scp.upload! new_file.path, "#{@uploader.scp_folder}/#{path}", :recursive => true
          end
        end

        def exists?
          size ? true : false
        end

        def content_type
          @content_type 
        end

        def content_type=(new_content_type)
          @content_type = new_content_type
        end

        def delete
          Net::SSH.start(@uploader.scp_host, @uploader.scp_user, @uploader.scp_options) do |session|
            session.exec! "rm #{@uploader.scp_folder}/#{path}"
          end
        rescue
        end
      private

        def file
          remote_file = nil
          Net::SSH.start(@uploader.scp_host, @uploader.scp_user, @uploader.scp_options) do |session|
            remote_file = session.scp.download!("#{@uploader.scp_folder}/#{path}", nil)
          end
          remote_file
          #@file ||= open("scp://#{@uploader.scp_user}:#{@uploader.scp_options[:password]}@#{@uploader.scp_host}#{@uploader.scp_folder}/#{path}", options)
        end

      end #end File
    end #end SCP
  end
end
