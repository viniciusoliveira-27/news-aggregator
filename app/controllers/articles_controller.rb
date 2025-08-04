class ArticlesController < ApplicationController
  def index
    base_articles = current_user.articles

    if params[:tag].present?

      @saved_articles = base_articles.joins(:tags).where(tags: { name: params[:tag] })

      @filtered_by_tag = params[:tag]
    else
      @saved_articles = base_articles.order(created_at: :desc)
    end

    @saved_articles = @saved_articles.includes(:tags).order(created_at: :desc)

    @user_tags = Tag.joins(:articles).where(articles: { user_id: current_user.id }).distinct.order(:name)
  end

  def create
    @api_article_data = article_params.to_h

    @article = current_user.articles.new(article_params)

    respond_to do |format|
      if @article.save
        format.turbo_stream
        format.html { redirect_to search_path(query: params.dig(:article, :query)), notice: "Artigo salvo!" }
      else
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
