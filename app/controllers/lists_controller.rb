class ListsController < ApplicationController
  
  respond_to :html, :xml, :js
  
  def index
  
    respond_with(@lists = List.all)
  
  end
  
  def new
  
    @list = List.new
  
  end
  
  def create
    
    @list = List.new(params[:list])
      if @list.save
        flash[:notice] = "Your Todo has been saved!!!"
        # redirect_to list_url(@list)
        respond_with(@list, :location => list_url(@list))
      else
        flash[:error] = "Your Todo could not be saved!!!"
        redirect_to new_list_url
      end
  end
  
  def show
    
    @list = List.find(params[:id])
    @task = @list.tasks.new
    # respond_with
    
  end
  
  def edit
    
    @list = List.find(params[:id])
    
  end
  
  def update
    
    @list = List.find(params[:id])
    if @list.update_attributes(params[:list])
      flash[:notice] = "List has been updated!!!"
      # redirect_to list_path(@list)
      respond_with(@list, :location => list_url(@list))
    else
        flash[:error] = "Could not update list!!"
        redirect_to edit_list_url(@list)
      end
  end
  
  def destroy
    
    @list = List.find(params[:id])
    if @list.destroy
      flash[:notice] = "List deleted!!!"
      redirect_to lists_url
    else
        flash[:error] = "Could not delete list!!"
        redirect_to lists_url
      end
  end
      
end
