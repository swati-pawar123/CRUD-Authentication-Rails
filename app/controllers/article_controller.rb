

class ArticleController < ApplicationController
  before_action :authenticate_customer!#internal method
  #if customer is not logged in-->display the login page
  def home
  end


  #Read operation
  #-->read all articles(index)#/article
  #-->read particular article(show)#/article/id

  def show
    #byebug
    @article=Article.find(params[:id])#params[:id]=2
  end  


  def index
    @articles=Article.paginate(page: params[:page], per_page: 3)
  end

  #Create operation(inserting the data)
  #-->new
  #-->create


  def new
    @article=Article.new

  end
  
  
  def create
    #byebug
    @article=Article.new(params.require(:article).permit(:title,:description,:user_id))
    @article.save()
    redirect_to article_index_path
  
  end


  #Update operation:
  #-->edit
  #-->update

  def edit
    @article=Article.find(params[:id])#title=django,description=middleware

  end


  def update
    @article=Article.find(params[:id])#old title and old description
    @article.update(params.require(:article).permit(:title,:description))#new title and new desc
    @article.save()
    redirect_to article_index_path

    #olddata.update(newdata)
  end  


  def destroy
    @article=Article.find(params[:id])
    @article.delete()
    redirect_to article_index_path

  end  






















end
