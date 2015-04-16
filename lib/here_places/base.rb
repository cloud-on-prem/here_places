module HerePlaces
  class Base
    @@base_url = 'http://places.nlp.nokia.com/'
    @@api_prefix = 'places/v1'

    attr_reader :conn

    def initialize(log=false)
      @log = log
      setup
    end
    
    def setup
      @conn = Faraday.new(:url => @@base_url) do |faraday|
        faraday.request  :url_encoded
        faraday.response :logger if @log
        faraday.adapter  Faraday.default_adapter
      end
    end

    def api(url_fragment, data={})
      result = @conn.get do |req|
        req.url url_fragment
        req.params['app_code'] = HerePlaces.app_code
        req.params['app_id']   = HerePlaces.app_id
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