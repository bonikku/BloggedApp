class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]
  before_action :require_user, except: %i[show index]
  before_action :require_same_user, only: %i[edit update destroy]

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      flash[:notice] = 'The article has been created'
      redirect_to @article
    else
      render 'new'
    end
  end

  def show; end

  def index
    @articles = Article.reorder("created_at ASC").paginate(page: params[:page], per_page: 5)

  end

  def search
    if params[:search].blank?
      redirect_to articles_path
    else
      @parameter = params[:search].downcase
      @articles = Article.all.where("lower(title) LIKE :search OR lower(description) LIKE :search", search: "%#{@parameter}%")
    end
  end

  def edit; end

  def update
    if @article.update(article_params)
      flash[:notice] = 'Article has been updated'
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  # Whitelist params
  def article_params
    params.require(:article).permit(:title, :description, category_ids: [])
  end

  def require_same_user
    if current_user != @article.user && !current_user.admin?
      flash[:alert] = 'You can only edit or delete your own article'
      redirect_to @article
    end
  end
end
