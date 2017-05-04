require 'carrierwave'
require 'uri/open-scp'
require 'net/scp'
require 'carrierwave/storage/scp'
require 'carrierwave-scp-upload/version'

class CarrierWave::Uploader::Base
  add_config :scp_host
  add_config :scp_user
  add_config :scp_options
  add_config :scp_folder

  configure do |config|
    config.storage_engines[:scp] = "CarrierWave::Storage::SCP"
  end
end
