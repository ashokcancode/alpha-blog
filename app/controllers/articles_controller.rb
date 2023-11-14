class ArticlesController < ApplicationController
    before_action :find, only: [:show, :edit, :update, :destroy]
    def show 
    end
    def index 
        @articles=Article.all
    end
    def new
        @article = Article.new
    end
    def create 
        @article = Article.new(params.require(:article).permit(:title,:description))
       if @article.save
        flash[:notice] = "article was created"
         redirect_to @article
       else
         render 'new' ,status: :unprocessable_entity
       end
    end
    def edit 

    end
    def update 
    
        if @article.update(params.require(:article).permit(:title,:description))
         flash[:notice] = "article was updated"
          redirect_to @article
        else
          render 'edit' ,status: :unprocessable_entity
        end
    end
    def destroy
        
        @article.destroy
        redirect_to articles_path
    end
    private
    def find
        @article=Article.find(params[:id])
    end
end