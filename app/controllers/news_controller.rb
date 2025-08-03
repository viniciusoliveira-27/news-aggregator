class NewsController < ApplicationController
   # Não exige login para a página de busca
   # skip_before_action :authenticate_user!, only: [ :search ]

   def search
    @articles = []
    if params[:query].present?
      api_key = ENV["NEWS_API_KEY"]
      service = NewsApiService.new(api_key)
      response = service.search(params[:query])

      if response.success? && response.parsed_response["articles"]
        @articles = response.parsed_response["articles"]
      else
        flash.now[:alert] = "Não foi possível buscar as notícias. Verifique o termo ou tente mais tarde."
      end
    end
  end
end
