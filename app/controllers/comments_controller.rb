class CommentsController < ApplicationController
  def show
   # @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    @comment = Comment.find(params[:comment_id])
  end

  def new
    #@topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    @comment = Comment.new
    authorize! :create, Comment, message: "You need to be a member to create a comment."
  end

  #def edit
    #@topic = Topic.find(params[:topic_id])
   # @post = Post.find(params[:id])
    #@comment = Comment.find(params[:comment_id])
    #authorize! :edit, @post, message: "You need to own the comment to edit it."
  #end

  def create
    #@topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    @comment = current_user.comment.build(params[:comment])
    @comment.post = @post

    authorize! :create, @comment, message: "You need to be signed up to do that."
    if @comment.save
      flash[:notice] = "Comment was saved."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the comment. Please try again."
      render :new
    end
  end

  #def update
   # @topic = Topic.find(params[:topic_id])
    #@post = Post.find(params[:id])
    #authorize! :update, @post, message: "You need to own the post to edit it."
    #if @post.update_attributes(params[:post])
     # flash[:notice] = "Post was updated."
     # redirect_to [@topic, @post]
    #else
     # flash[:error] = "There was an error saving the post. Please try again."
      #render :new
    #end
  #end
end