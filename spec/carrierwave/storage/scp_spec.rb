require 'spec_helper'
require 'carrierwave-scp'

class ScpUploader < CarrierWave::Uploader::Base
  storage :scp
end

describe CarrierWave::Storage::SCP do
  before do
    CarrierWave.configure do |config|
      config.scp_host = "localhost"
      config.scp_user = "test"
      config.scp_passwd = "test"
      config.scp_folder = "/home/test"
    end

    @file = CarrierWave::SanitizedFile.new(file_path('test.jpg'))
    ScpUploader.stub!(:store_path).and_return('uploads/test.jpg')
    @storage = CarrierWave::Storage::SCP.new(ScpUploader)
  end

  it "store the file" do
    @stored = @storage.store!(@file)
  end
end
