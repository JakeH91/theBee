class CommentsController < ApplicationController

	def create
		@product = Product.find(params[:product_id])
		@comment = @product.comment.new(comment_params)
		@comment.user = current_user
		@comment.save
		redirect_to product_path(@product)
	end

	def destroy
	end

end
