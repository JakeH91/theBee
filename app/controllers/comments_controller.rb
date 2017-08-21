class CommentsController < ApplicationController

	load_and_authorize_resource
	
	def create
		@product = Product.find(params[:product_id])
		@comment = @product.comments.new(comment_params)
		@user = current_user
		@comment.user = current_user
		respond_to do |format|
			if @comment.save
				format.html { redirect_to @product, notice: 'Review was created successfully.' }
				format.json { render :show, status: :created, location: @product }
				format.js
			else
				format.html { redirect_to @product, notice: 'Review was not saved successfully.' }
				format.json { render json: @comment.errors, status: :unprocessable_entity }
			end			
		end
	end

	def edit
		authorize! :update, Comment
	end

	def destroy
		authorize! :destroy, Comment
		@comment = Comment.find(params[:id])
		product = @comment.product
		@comment.destroy
		redirect_to product
	end

	private
		def comment_params
			params.require(:comment).permit(:user_id, :body, :rating)
		end

end
