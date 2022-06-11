class TasksController < ApplicationController
  def show
    @task = Task.find(params[:id])
  end

  def new
    @category = Category.find(params[:category_id])
    @task = @category.tasks.build
  end

  def edit 
    @task = Task.find(params[:id])
  end

  def create
    @category = Category.find(params[:category_id])
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
    @task = Task.find(params[:id])
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

  private

  def task_params
    params.require(:task).permit(:title, :description)
  end
end
