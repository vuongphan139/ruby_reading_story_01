class CommentsController < ApplicationController
  before_action :correct_user, only: %i(destroy)

  def new
    @story_id = params[:story_id]
    @parent_id = params[:parent_id]
    @comment = Comment.new
  end

  def create
    create_comment

    if @comment.save
      flash[:success] = t "comment_created"
    else
      @feed_items = current_user.feed.page params[:page]
    end
    @comments = @comment.story.comments.child_comments(Settings.comment_parent_id)
                        .order_desc.page(params[:page]).per Settings.comment_items_page
    respond_to do |format|
      format.html{redirect_to story_path @story}
      format.js
    end
  end

  def destroy
    @story = Story.find_by id: @comment.story.id
    @comment.user_id = current_user.id

    if @comment.destroy
      flash[:success] = t "comment_deleted"
      redirect_to request.referrer || root_url
    else
      flash[:danger] = t "comment_not_deleted"
      redirect_to root_url
    end
  end

  private

  def comment_params
    params.require(:comment).permit :content, :parent_id
  end

  def correct_user
    @comment = current_user.comments.find_by id: params[:id]
    redirect_to root_url unless @comment
  end

  def create_comment
    @comment = Story.find_by(id: params[:story_id]).comments.build comment_params
    @comment.user_id = current_user.id
    @comment.parent_id = @parent_id if @parent_id = params[:parent_id]
  end
end
