module HerePlaces
  class APIError < StandardError
    attr_accessor :status, :error_message
    
    def initialize(error)
      self.status = error["status"].to_i rescue 500
      self.error_message = error["error_message"] || 'Unknown Error'
    end
  end
end