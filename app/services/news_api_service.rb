require "httparty"

class NewsApiService
  include HTTParty
  base_uri "https://newsapi.org/v2"

  def initialize(api_key)
    @options = { query: { apiKey: api_key } }
  end

  def search(keyword, page: 1, per_page: 10)
    query_params = {
      q: keyword,
      language: "pt", # Ou qualquer outra preferência
      sortBy: "publishedAt",
      page: page,
      pageSize: per_page
    }

    # Mescla os parâmetros da busca com as opções default (que contém a chave da API)
    self.class.get("/everything", @options.deep_merge({ query: query_params }))
  end
end
