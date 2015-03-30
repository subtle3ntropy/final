class ArticlesController < ApplicationController
  before_action :authenticate_admin!, only: [:new, :edit, :update, :create, :destroy]

  before_action :set_article, only: [:edit, :update, :show, :destroy, :crop ]
  def index
    @articles = Article.all
  end
  
  def articlecrop
    @article = set_article
  end

  def crop

  end

  def articlecroppost
     @article= Article.find(params[:id])
     binding.pry
    if @article.update(article_params)
     binding.pry 
     redirect_to article_path(@article)
    else                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
      redirect_to root_path
    end
  end

  def edit

  end

  def new
    @article = Article.new
  end

  def show
    @user = User.all
    @comment = Comment.new

  end

  def create
    @article = Article.create(article_params)
    if @article.save
      redirect_to crop_article_path(@article)
    else
      render :new
    end
  end

  def update
    @article= Article.find(params[:id])
    if @article.update(article_params)
      # binding.pry
      redirect_to article_path(@article)
    end
  end 

  def destroy
  end

  private

  def set_article 
    @article= Article.find(params[:id])
  end

  def article_params 
    params.require(:article).permit(:name, :description, :main_image, :main_image_original_w, :main_image_original_h, :main_image_box_w, :main_image_crop_x, :main_image_crop_y, :main_image_crop_w, :main_image_crop_h, :main_image_aspect)
  end

  def user_params
  params.require(:user).permit(:avatar)
  end

end
