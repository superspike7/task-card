class CategoriesController < ApplicationController
  def index
  end

  def new
    @category = Category.new
  end

  def create
    @category= Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.turbo_stream { flash.now[:success] = "Category Successfully Created!" }
        format.html { redirect_to root_url, flash[:success] = "Category Successfully Created!" }
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
