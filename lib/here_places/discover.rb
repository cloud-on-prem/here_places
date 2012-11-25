module HerePlaces
  class Discover < HerePlaces::Base
    @@resource = 'discover'
    %w(search explore here).each do |meth|
      define_method(meth) do |data|
        url = @@api_prefix + '/' + @@resource + '/' + meth
        api(url, data)
      end
    end
  end
end