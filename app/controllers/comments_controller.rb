class CommentsController < ApplicationController
  
  def destroy
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])
    @comment = @post.comments.find(params[:id])

    authorize @comment
    if @comment.destroy
      flash[:notice] = "Comment was removed."
      redirect_to [@topic, @post]
    else
      flash[:error] = "Comment couldn't be deleted.  Try again."
      redirect_to [@topic, @post]
    end
  end

  # def show
  #   @comment = Comment.find(params[:id])
  #   @post = Post.find(params[:post_id])
  #   @comment = Comment.new
  # end

  # def new
  #   @topic = Topic.find(params[:topic_id])
  #   @post = Post.find(params[:post_id])
  #   @comment = Comment.new
  #   authorize @comment
  # end

  def create
    @post = Post.find(params[:post_id])
    @topic = Topic.find(params[:topic_id])
    @comment = current_user.comments.build(comment_params)
    @comment.post = @post
    authorize @comment
    
    if @comment.save
      flash[:notice] = "Post was saved."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the comment.  Please try again."
      render :new
    end
  end

private

  def comment_params
    params.require(:comment).permit(:body , :post_id)
  end
end