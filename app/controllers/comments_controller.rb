class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    post_comments = @post.comments
    new_comment = params[:comment].permit(:body)
    @comment = post_comments.create!(new_comment.merge(user: current_user))
    redirect_to post_path(@post)
  end

end
