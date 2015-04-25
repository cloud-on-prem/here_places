module HerePlaces
  class Discover < HerePlaces::Base
    %w(search explore here).each do |meth|
      define_method(meth) do |payload|
        call_api(path(meth), payload)
      end
    end

    private

    def path(meth)
      HerePlaces::API_PREFIX + '/' + 'discover' + '/' + meth
    end
  end
end
