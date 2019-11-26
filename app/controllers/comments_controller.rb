class CommentsController < ApplicationController
  before_action :find_commentable, only: :create

  def new
    @comment = Comment.find_by id: params[:comment_id]
    @reply = Comment.new
  end

  def create
    @commentable.comments.build comment_params
    if @commentable.save
      flash[:success] = t ".success"
    else
      flash[:danger] = t ".fail"
    end
    if params[:vehicle_id]
      redirect_to @commentable
    elsif params[:comment_id]
      redirect_to @commentable.commentable
    end
  end

  private

  def comment_params
    params.require(:comment).permit Comment::COMMENT_PARAMS
  end

  def find_commentable
    if params[:comment_id]
      @commentable = Comment.find_by id: params[:comment_id]
    elsif params[:vehicle_id]
      @commentable = Vehicle.find_by id: params[:vehicle_id]
    end
  end
end
