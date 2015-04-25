module HerePlaces
  class Base
    attr_reader :conn

    def initialize(log=false)
      @log = log
    end

    protected

    def call_api(url_fragment, payload={})
      result = connection.get do |req|
        req.url url_fragment
        req.params['app_code'] = HerePlaces.app_code
        req.params['app_id']   = HerePlaces.app_id
        payload.each do |key,value|
          req.params[key] = value
        end
      end

      parsed_result = JSON.parse(result.body)

      if result.status.to_i != 200
        raise HerePlaces::APIError.new(parsed_result), parsed_result['message']
      else
        parsed_result
      end
    end

    private

    attr_reader :log

    def connection
      @_connection ||= Faraday.new(:url => BASE_URL) do |faraday|
        faraday.request  :url_encoded
        faraday.response :logger if log
        faraday.adapter  Faraday.default_adapter
      end
    end
  end
end
