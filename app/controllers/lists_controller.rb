class ListsController < ApplicationController
  def new
    @list = List.new
    authorize @list
  end

  def index
    @lists = current_user.lists
  end

  def edit
    @list = List.find(params[:id])
  end

  def show
    @list = List.find(params[:id])
    @todos = @list.todos
  end

  def create
    @list = current_user.lists.build(list_params)
    @list.save
    redirect_to @list, notice: 'Your new List was created successfully!'
  end

  def destroy
    @list = List.find(params[:id])
    name = @list.name

    if @list.destroy
      flash[:notice] = "\"#{name}\" was deleted successfully."
      redirect_to lists_path
    else
      flash[:error] = "There was an error deleting the list."
      render :show
    end
  end

  private 

  def list_params
    params.require(:list).permit(:name)
  end
end
