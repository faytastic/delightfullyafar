class AttachmentsController < ApplicationController
load_and_authorize_resource :article
load_and_authorize_resource :through => :article, param_method: :attachments_params

	def create
		@article = Article.find (params[:article_id])
		@attachment = @article.attachments.create(attachments_params)
		if @attachment.save
			flash[:notice] = "Added."
			redirect_to @article
		else
			flash[:alert] = "No Good."
			redirect_to :back
		end
	end

	def destroy
		@article = Article.find(params[:article_id])
		@attachment = @article.attachments.find(params[:id])
		@attachment.destroy
		redirect_to @article
	end

	private

	def attachments_params
		params.require(:attachment).permit(:picture, :remote_picture_url )
	end


end
