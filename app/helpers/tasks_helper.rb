module TasksHelper
  def dynamic_url
   @category != nil ?  [@category, @task] : task_path 
  end
end
