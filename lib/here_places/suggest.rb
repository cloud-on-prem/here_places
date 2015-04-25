module HerePlaces
  class Suggest < HerePlaces::Base
    def suggest(data)
      call_api(path, data)
    end

    private

    def path
      @_path ||= HerePlaces::API_PREFIX + '/' + 'suggest'
    end
  end
end
