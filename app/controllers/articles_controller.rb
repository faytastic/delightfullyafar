class ArticlesController < ApplicationController
	load_and_authorize_resource param_method: :article_params

	def index
		@articles = Article.all
	end

	def show
		@article = Article.find(params[:id])
		@attachment = @article.attachments.build
		@attachments = @article.attachments.all
	end

	def new
		@article = Article.new
	end

	def create
		@article = current_user.articles.build(article_params)
		if @article.save
			flash[:notice] = "Posted!"
			redirect_to @article
		else
			flash[:alert] = "No good."
			redirect_to :back
		end
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])

		if @article.update(article_params)
			flash[:notice] = "Edited"
			redirect_to @article
		else
			flash[:alert] = "No good."
			redirect_to :back
		end
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy
		flash[:notice] = "Deleted"
		redirect_to root_url
	end

	private

	def article_params
		params.require(:article).permit(:title, :content, :address, :public, :picture, :remote_picture_url, :tag_list )
	end

end
