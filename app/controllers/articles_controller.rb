class ArticlesController < ApplicationController
  def index
    @saved_articles = current_user.articles.order(created_at: :desc)
  end

  def create
    @article = current_user.articles.new(article_params)

    if @article.save
      redirect_to search_path(query: params[:article][:query]), notice: "Artigo salvo!"
    else
      redirect_to search_path(query: params[:article][:query]), alert: "Não foi possível salvar o artigo."
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
