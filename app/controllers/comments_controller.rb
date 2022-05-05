class CommentsController < ApplicationController
before_action :find_story, only: [:create, :update, :destroy]
before_action :find_comment, only: [:show, :update, :destroy]
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.story_id = @story.id
        if !@comment.save
        render 'stories/show'
     else
        redirect_to story_path(@story)
      end
  end

  def update
    @comment.update(comment_params)
      if @comment.save
        redirect_to story_path(@story)
      else
        render 'edit'
      end
  end

  def destroy
    @comment.destroy
    redirect_to @comment.story
  end



  private

   def find_story
     @story = Story.find(params[:story_id])
   end

   def find_comment
     @comment = Comment.find(params[:id])
   end

   def comment_params
     params.require(:comment).permit(:content, :writer_id)
   end
end
