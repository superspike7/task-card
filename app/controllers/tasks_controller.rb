class TasksController < ApplicationController
  def show
    @task = current_user.tasks.find(params[:id])
  end

  def new
    @category = current_user.categories.find(params[:category_id])
    @task = @category.tasks.build
  end

  def edit 
    @task = current_user.tasks.find(params[:id])
  end

  def create
    @category = current_user.categories.find(params[:category_id])
    @task = @category.tasks.build(task_params)

    respond_to do |format|
      if @task.save
        format.turbo_stream { flash.now[:success] = 'Task Successfully Created!' }
        format.html { redirect_to root_url, flash[:success] = 'Task Successfully Created!' }
        # format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        # format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update 
    @task = current_user.tasks.find(params[:id])
    @category = @task.category
    
    respond_to do |format|
      if @task.update(task_params)
        format.turbo_stream { flash.now[:success] = 'Task Successfully Updated!' }
        format.html { redirect_to root_url, flash[:success] = 'Task Successfully Updated!' }
        # format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        # format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @task = current_user.tasks.find(params[:id])
    
    respond_to do |format|
      if @task.destroy
        format.turbo_stream { flash.now[:success] = 'Task Successfully Deleted!' }
        format.html { redirect_to root_url, flash[:success] = 'Task Successfully Deleted!' }
      end
    end
  end


  private

  def task_params
    params.require(:task).permit(:title, :description, :category_id)
  end
end
