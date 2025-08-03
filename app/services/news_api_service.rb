require "httparty"

class NewsApiService
  include HTTParty
  base_uri "https://newsapi.org/v2"

  def initialize(api_key)
    @options = { query: { apiKey: api_key } }
  end

  def search(query)
    return [] if query.blank?

    search_options = @options.merge(query: @options[:query].merge({ q: query }))
    self.class.get("/everything", search_options)
  end
end
