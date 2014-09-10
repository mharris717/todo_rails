class TodosController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    render json: Todo.all
  end
  def create
    todo = Todo.create! params[:todo].permit(:name,:completed)
    render json: todo
  end
  def update
    todo = Todo.find(params[:id])
    todo.update_attributes! params[:todo].permit(:name,:completed)
    render json: todo
  end
end
