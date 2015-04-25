module HerePlaces
  class Category < HerePlaces::Base
    def places(payload)
      call_api(path, payload)
    end

    private

    def path
      @_path ||= HerePlaces::API_PREFIX + '/' + 'categories' + '/' + 'places'
    end
  end
end
