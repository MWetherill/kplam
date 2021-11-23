class PagesController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  before_action :set_project, only: %i[ show edit update destroy ]
  def index
    @projects = Project.all.order(updated_at: :desc).first(4)
    @posts = Post.all.order(updated_at: :desc).first(4)
  end

  def custom_action
    p 'hello world'
    @title = Project.all.first.title
    # redirect_to root_url, notice: 'custom action successful'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :description, :user_id)
    end
    
    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:title, :description, :user_id)
    end

end
