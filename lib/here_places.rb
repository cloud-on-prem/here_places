require "faraday"
require "json"
require_relative './here_places/base'
require_relative './here_places/category'
require_relative './here_places/discover'
require_relative './here_places/error'
require_relative './here_places/place'
require_relative './here_places/suggest'

# /discover/search?q=...&[at=...]
# /discover/explore?[cat=...]&[(at|in)=...]
# /discover/here?[at=...]
# /places/{placeId}
# /suggest?q=...&[at=...]
# /categories/places?[at=...]