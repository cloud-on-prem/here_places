module HerePlaces
  class Category < HerePlaces::Base
    @@resource = 'categories'

    def places(data)
      url = @@api_prefix + '/' + @@resource + '/' + 'places'
      api(url, data)
    end
  end
end