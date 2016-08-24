CarrierWave.configure do |config|
  config.fog_credentials = {
    provider:              'AWS',                                         # required
    aws_access_key_id:     'AKIAJV2XUZSETJ7TYBZA',                        # required
    aws_secret_access_key: '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',    # required
    region:                'ap-northeast-2',                              # 서울
    endpoint:              'http://s3.ap-northeast-2.amazonaws.com'       # 서울
  }
  config.fog_directory  = 'guerillart-ssu'                            # required
  config.fog_public     = true                                        # optional, defaults to true
  config.fog_attributes = { } # optional, defaults to {}
end
