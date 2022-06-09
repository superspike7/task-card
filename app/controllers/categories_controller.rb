class CategoriesController < ApplicationController
  def index
    @categories = Category.ordered
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def edit
    @category = Category.find(params[:id])
  end

  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.turbo_stream { flash.now[:success] = 'Category Successfully Created!' }
        format.html { redirect_to root_url, flash[:success] = 'Category Successfully Created!' }
        # format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        # format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update 
    @category = Category.find(params[:id])
    
    respond_to do |format|
      if @category.update(category_params)
        format.turbo_stream { flash.now[:success] = 'Category Successfully Updated!' }
        format.html { redirect_to root_url, flash[:success] = 'Category Successfully Updated!' }
        # format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        # format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @category = Category.find(params[:id])
    
    respond_to do |format|
      if @category.destroy
        format.turbo_stream { flash.now[:success] = 'Category Successfully Deleted!' }
        format.html { redirect_to root_url, flash[:success] = 'Category Successfully Deleted!' }
      end
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
