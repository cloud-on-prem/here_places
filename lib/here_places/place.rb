module HerePlaces
  class Place < HerePlaces::Base
    @@resource = 'places'

    def places(id)
      url = @@api_prefix + '/' + @@resource + '/' + id.to_s
      api(url)
    end
  end
end