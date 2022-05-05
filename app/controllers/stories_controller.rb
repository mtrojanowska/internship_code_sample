class StoriesController < ApplicationController
before_action :authenticate_writer!, only: [:create, :update, :destroy]
before_action :find_story, except: [:new, :index, :create]
  def new
    @story = Story.new
  end
  def index
    @stories = Story.all
  end

  def show
    @writer = @story.writer
    @comment = Comment.new(story_id: params[:story_id])
  end

  def create
    @story = Story.new(story_params)
      if @story.save
        redirect_to @story
      else
        render 'new'
      end
  end

  def edit
  end

  def update
    if @story.update(story_params)
      redirect_to @story
    else
      render 'edit'
    end
  end

  def destroy
    @story.destroy
    redirect_to stories_path
  end

  private

  def find_story
    @story = Story.find(params[:id])
  end

  def story_params
    params.require(:story).permit(:title, :content, :image, :writer_id, category_ids:[])
  end
end
