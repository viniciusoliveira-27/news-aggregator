class NewsController < ApplicationController
  before_action :authenticate_user!, except: [ :search ]

  ITEMS_PER_PAGE = 10


  def search
    if params[:query].blank?
      @articles = []
      @pagy = nil
      return
    end

    api_key = ENV["NEWS_API_KEY"]
    service = NewsApiService.new(api_key)
    response = service.search(params[:query])

    if response.success? && response.parsed_response["articles"].present?
      @articles = response.parsed_response["articles"]

      total_results = response.parsed_response["totalResults"]


      @pagy = Pagy.new(count: total_results, page: params[:page], items: ITEMS_PER_PAGE)

    else
      @articles = []
      @pagy = nil
      flash.now[:alert] = "Não foi possível buscar as notícias ou não há resultados para '#{params[:query]}'."
    end
  end
end
