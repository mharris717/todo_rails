class TodosController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index_paged
    puts params.inspect
    page = (params[:page] || 1).to_i
    per_page = params[:per_page] || 10
    
    todos = Todo.page(page).per(per_page)
    render json: todos, meta: {
      current_page: todos.current_page,
      next_page: todos.next_page,
      prev_page: todos.prev_page,
      total_pages: todos.total_pages,
      total_count: todos.total_count
    }
  end

  def index_plain
    render json: Todo.all
  end

  def index
    index_paged
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
