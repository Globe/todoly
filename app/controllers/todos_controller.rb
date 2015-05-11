class TodosController < ApplicationController

  def index
    @todos = Todo.all
    render json: {
      todos: @todos
    }
  end

  def create
    @todo = Todo.new(todo_params)
    @todo.status = "pending"
    @todo.save
    render json: {
      todo: @todo,
      status: "success"
    }
  end

  private

  def todo_params
    params.require(:todo).permit(:description,
                              :status
                              )
  end

end
