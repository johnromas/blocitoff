class ListsController < ApplicationController
  def new
    @list = List.new
  end

  def index
    @lists = List.all
  end

  def edit
    @list = List.find(params[:id])
  end

  def show
    @list = List.find(params[:id])
    @todos = @list.todos
  end

  def create
    @list = List.new(list_params)
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
