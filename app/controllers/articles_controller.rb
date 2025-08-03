class ArticlesController < ApplicationController
  def index
    @saved_articles = current_user.articles.order(created_at: :desc)
  end

  def create
    # Guardamos os dados que vieram do formulário para usar na resposta turbo
    @api_article_data = article_params.to_h

    @article = current_user.articles.new(article_params)

    respond_to do |format|
      if @article.save
        # A resposta TURBO_STREAM vai renderizar o arquivo create.turbo_stream.erb
        format.turbo_stream
        # A resposta HTML (fallback) continua redirecionando
        format.html { redirect_to search_path(query: params.dig(:article, :query)), notice: "Artigo salvo!" }
      else
        # Em caso de falha, não fazemos nada via turbo, apenas redirecionamos no HTML
        format.html { redirect_to search_path(query: params.dig(:article, :query)), alert: "Não foi possível salvar o artigo." }
      end
    end
  end


  def article_params
    params.require(:article).permit(:title, :url, :source_name)
  end


def destroy
  @article = current_user.articles.find(params[:id])
  @article.destroy

  respond_to do |format|
    format.html { redirect_to articles_path, notice: "Artigo removido." }
    format.turbo_stream
  end
end
end
