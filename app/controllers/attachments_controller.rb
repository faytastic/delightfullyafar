class AttachmentsController < ApplicationController

	def create
	end

	def destroy
	end

	private

	def attachments_params
		params.require(:attachment).permit(:picture, :remote_picture_url )
	end


end
