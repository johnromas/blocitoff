class ListsController < ApplicationController
  def new
  end

  def index
  end

  def edit
  end

  def show
    @list = List.find(params[:id])
  end

  def create
    @list = List.new(list_params)
    @list.save
    redirect_to @list, notice: 'Your new List was created successfully!'
  end

  private 

  def list_params
    params.require(:list).permit(:name)
  end
end
