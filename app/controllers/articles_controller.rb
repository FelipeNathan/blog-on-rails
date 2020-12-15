class ArticlesController < ApplicationController
    include ArticlesHelper
    before_action :find_article, only: [:edit, :show, :update, :destroy]

    def index
        @articles = Article.all
    end

    def create
        @article = Article.new(article_params)
        @article.save

        flash.notice = "Article '#{@article.title}' Created!"

        redirect_to article_path(@article)
    end

    def new
        @article = Article.new
    end

    def edit
    end

    def show
        @comment = Comment.new
    end

    def update
        @article.update(article_params)
        
        flash.notice = "Article '#{@article.title}' Updated!"
        
        redirect_to article_path(@article)
    end

    def destroy
        @article.destroy

        flash.notice = "Article '#{@article.title}' Deleted!"

        redirect_to articles_path
    end
end
