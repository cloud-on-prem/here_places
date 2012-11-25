module HerePlaces
  class Base
    @@base_url = 'http://places.nlp.nokia.com/'
    @@api_prefix = 'places/v1/'

    def initialize(app_id, app_code)
      @app_id = app_id
      @app_code = app_code
      setup()
    end
    
    def setup
      @conn = Faraday.new(:url => @@base_url) do |faraday|
        faraday.request  :url_encoded
        faraday.response :logger
        faraday.adapter  Faraday.default_adapter
      end
    end

    def api(url, data={})
      result = @conn.get do |req|
        req.url url
        req.params['app_id'] = @app_id
        req.params['app_code'] = @app_code
        data.each do |key,value|
          req.params[key] = value
        end
      end
      
      parsed_result = JSON.parse(result.body)
      if parsed_result["status"]
        raise HerePlaces::APIError.new(parsed_result), parsed_result['message']
      else
        parsed_result
      end
    end
  end
end