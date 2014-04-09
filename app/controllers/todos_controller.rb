class TodosController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @todo = Todo.new
  end

  
  def edit
    @todo = Todo.find(params[:id])
  end

  def create
    @list = List.find(params[:list_id])
    @todo = Todo.new(params.require(:todo).permit(:desc))
    @todo.list = @list

 
    if @todo.save
      redirect_to [@list], notice: "Todo was saved successfully."
    else
      flash[:error] = "There was an error saving the todo. Please try again."
      render :new
    end
  end

  private

    def todo_params
      params.require(:todo).permit(:desc)
    end

end
