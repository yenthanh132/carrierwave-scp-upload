# CarrierWave SCP Upload

Custom upload plugin for [CarrierWave](https://github.com/jnicklas/carrierwave/) using SCP method
NOTE that the workers server need connection permission to the storage server using private key.
## Gem

    gem install carrierwave-scp-upload

## Configuration

```ruby
CarrierWave.configure do |config|
  config.storage = :scp
  config.scp_host = "<host ip>"
  config.scp_user = "<username>"
  config.scp_options = { :password=> "<password>" }
  config.scp_folder = "/var/folder"
end
```
