class CategoriesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    if user_signed_in?
      @categories = current_user.categories
    else
      redirect_to home_path
    end
  end

  def show
    @category = current_user.categories.find(params[:id])
  end

  def new
    @category = current_user.categories.new
  end

  def edit
    @category = current_user.categories.find(params[:id])
  end

  def create
    @category = current_user.categories.new(category_params)

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
    @category = current_user.categories.find(params[:id])

    # @category.switch_position(category_params[:position])
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
    @category = current_user.categories.find(params[:id])

    respond_to do |format|
      if @category.destroy
        format.turbo_stream { flash.now[:success] = 'Category Successfully Deleted!' }
        format.html { redirect_to root_url, flash[:success] = 'Category Successfully Deleted!' }
      end
    end
  end

  def today
    @today = current_user.categories.find_or_create_by(name: 'To Do')
    @done = current_user.categories.find_or_create_by(name: 'Done')
    @tasks = @today.tasks
  end

  def move
    @category = current_user.categories.find(params[:id])
    @category.insert_at(params[:position].to_i)
    head :ok
  end

  private

  def category_params
    params.require(:category).permit(:name, :position)
  end
end
