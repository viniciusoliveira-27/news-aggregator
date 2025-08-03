class ArticleTagsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_article

  def create
    tag_names = params[:article][:tag_list].split(",").map(&:strip).reject(&:blank?)

    new_tags = tag_names.map do |name|
      Tag.find_or_create_by(name: name.downcase)
    end

    @article.tags << new_tags
    @article.tags.reload

    redirect_to articles_path, notice: "Tags atualizadas com sucesso!"
  end

  private

  def set_article
    @article = current_user.articles.find(params[:article_id])
  end
end
