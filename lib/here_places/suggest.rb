module HerePlaces
  class Suggest < HerePlaces::Base
    @@resource = 'suggest'

    def suggest(data)
      url = @@api_prefix + '/' + @@resource
      api(url, data)
    end
  end
end