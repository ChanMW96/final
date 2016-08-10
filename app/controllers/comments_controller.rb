class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.save
    redirect_to request.referer
  end

  def update
  	@comment = Comment.find(params[:comment_id])
  end

  def comment_params
#    params[:comment][:comment]=params[:comment][:comment][:msg]
    params[:com][:user_id]=params[:com][:user_id].to_i
    params[:com][:project_id]=params[:com][:project_id].to_i
    params[:com][:user_type]=params[:com][:user_type].to_i
  	params.require(:com).permit(:comment,:user_id,:user_type,:project_id)
  end
end
