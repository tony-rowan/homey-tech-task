class CommentsController < ApplicationController
  before_action :require_logged_in

  def new
    @comment = Comment.new(project: Project.find(params[:project]))
  end

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      redirect_to @comment.project
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :project_id).merge(user: Current.user)
  end
end
