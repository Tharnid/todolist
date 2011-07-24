class TasksController < ApplicationController
  
  respond_to :html, :xml, :js
  
  def create
  
    @list = List.find(params[:list_id])
    @task = @list.tasks.new(params[:task])
    if @task.save
      flash[:notice] = "Task created!!!"
      redirect_to list_url(@list)
    else
      flash[:error] = "Could not add the task!!!"
      redirect_to list_url(@list)
    end
    
  end
  
end
