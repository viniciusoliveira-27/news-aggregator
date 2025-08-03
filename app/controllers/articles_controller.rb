class ArticlesController < ApplicationController
  def index
    # Começamos com a base da consulta: os artigos do usuário atual
    base_articles = current_user.articles

    # Verificamos se o parâmetro 'tag' foi passado na URL (ex: /articles?tag=ruby)
    if params[:tag].present?
      # Se o parâmetro existe, aplicamos o filtro.
      # Usamos `joins` para conectar com a tabela de tags
      # e `where` para filtrar pelo nome da tag.
      @saved_articles = base_articles.joins(:tags).where(tags: { name: params[:tag] })

      # Guardamos o nome da tag para exibir na view
      @filtered_by_tag = params[:tag]
    else
      # Se não há filtro, carregamos todos os artigos salvos
      @saved_articles = base_articles.order(created_at: :desc)
    end

    # IMPORTANTE: Independentemente do filtro, usamos .includes(:tags) no final
    # para evitar N+1 queries na hora de renderizar as tags na view.
    @saved_articles = @saved_articles.includes(:tags).order(created_at: :desc)

    # (Bônus) Vamos também buscar todas as tags únicas do usuário para exibir uma "nuvem de tags"
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
