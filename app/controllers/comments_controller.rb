class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to @post, notice: "Comment was succcessfully created."
    else
      redirect_to @post, notice: "Unable to create comment."
    end
  end

  def update
    @comment = Comment.find(params[:id])
    @post = Post.find(@comment.post_id)

    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @post, notice: "Comment was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    @post = Post.find(@comment.post_id)

    @comment.destroy
    flash[:success] = "Comment was successfully deleted."
    redirect_to @post
  end

  def recover
    @comment = Comment.only_deleted.find(params[:comment_id])
    @comment.recover
    @post = Post.find(@comment.post_id)

    respond_to do |format|
        format.html { redirect_to @post, notice: "Comment was successfully recovered." }
    end
  end

  private
  
  def comment_params
    params.require(:comment).permit(:text, :post_id, :user_id)
  end
end