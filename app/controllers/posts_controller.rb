class PostsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index_paged
    page = (params[:page] || 1).to_i
    todos = Post.page(page).per(2)
    render json: todos, meta: {
      current_page: todos.current_page,
      next_page: todos.next_page,
      prev_page: todos.prev_page,
      total_pages: todos.total_pages,
      total_count: todos.total_count
    }
  end

  def index
    render json: Post.all
  end
  
  def create
    todo = Post.create! params[:todo].permit(:name,:completed)
    render json: todo
  end
  def update
    todo = Post.find(params[:id])
    todo.update_attributes! params[:todo].permit(:name,:completed)
    render json: todo
  end
end
