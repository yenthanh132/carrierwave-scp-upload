require 'spec_helper'

describe CarrierWave::Uploader::Base do
  it 'defines scp specific storage options' do
    described_class.should respond_to(:scp_host)
    described_class.should respond_to(:scp_user)
    described_class.should respond_to(:scp_passwd)
    described_class.should respond_to(:scp_folder)
  end

  it 'inserts scp as a known storage engine' do
    described_class.configure do |config|
      config.storage_engines.should have_key(:scp)
    end
  end
end
