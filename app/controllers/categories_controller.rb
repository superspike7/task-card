class CategoriesController < ApplicationController
  def index
  end

  def new
    @category = Category.new
  end

  def create
    @category= Category.new(category_params)

    respond_to do |format|
      if @post.save
        # format.turbo_stream { render turbo_stream: turbo_stream.prepend('posts', partial: 'posts/post', locals: {post: @post}) }
        format.html { redirect_to root_url, flash[:sucess] = "Category Successfully Created!" }
        # format.json { render :show, status: :created, location: @post }
      else
        # format.html { render :new, status: :unprocessable_entity }
        # format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def category_params
      params.require(:category).permit(:name)
    end
end
