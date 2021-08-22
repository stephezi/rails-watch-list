class BookmarksController < ApplicationController

  def new
    @bookmark = BookmarksController.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def destroy
    @bookmark = Bookmarks.find(params[:id])
    @bookmark.destroy
  end
end

private

def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
