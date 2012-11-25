require "spec_helper"

describe HerePlaces::Config do
  it 'Gets and Sets APP Key and APP Code' do
    app_id = "APP_ID"
    app_code = "APP_CODE"
    HerePlaces::Config.app_id = app_id
    HerePlaces::Config.app_code = app_code
    HerePlaces::Config.app_id.should eql(app_id)
    HerePlaces::Config.app_code.should eql(app_code)
  end
end