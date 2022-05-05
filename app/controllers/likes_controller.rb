class LikesController < ApplicationController

  def create
    @like = current_writer.likes.new(like_params)
    @likeable = @like.likeable
      if !@like.save
        flash[:notice] = @like.errors.full_messages
      else
        if @like.likeable_type == "Story"
           redirect_to @likeable
        else
          redirect_to @likeable.story
        end
      end
  end

  def destroy
    @like = current_writer.likes.find(params[:id])
    @likeable = @like.likeable
    @like.destroy
      if @like.likeable_type == "Story"
        redirect_to @likeable
      else
        redirect_to @likeable.story
      end
  end


  private

  def like_params
    params.require(:like).permit(:likeable_id, :likeable_type)
  end
end
