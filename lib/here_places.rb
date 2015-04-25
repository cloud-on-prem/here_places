require "faraday"
require "json"
require_relative './here_places/base'
require_relative './here_places/category'
require_relative './here_places/discover'
require_relative './here_places/error'
require_relative './here_places/suggest'

# /discover/search?q=...&[at=...]
# /discover/explore?[cat=...]&[(at|in)=...]
# /discover/here?[at=...]
# /places/{placeId}
# /suggest?q=...&[at=...]
# /categories/places?[at=...]

module HerePlaces
  BASE_URL = 'http://places.nlp.nokia.com/'.freeze
  API_PREFIX = 'places/v1'.freeze

  def self.set_keys(app_id, app_code)
    @app_id = app_id
    @app_code = app_code
  end

  def self.app_id
    @app_id
  end

  def self.app_code
    @app_code
  end
end
