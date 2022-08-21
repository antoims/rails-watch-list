class BookmarksController < ApplicationController
  before_action :set_list, only: %i[new create]
  # before_action :set_bookmark, only: %i[destroy]
  def new
    # donner l'id de la list
    # faire un bookmark
    @bookmark = Bookmark.new
    # donner la liste des films pour la collection
    # @movies = Movie.all
  end

  def create
    @bookmark = Bookmark.new(bookmarks_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render 'new', status: :unprocessable_entity
    end
  end
  # def create
  #   @review = Review.new(review_params)
  #   @review.restaurant = @restaurant
  #   if @review.save
  #     redirect_to restaurant_path(@restaurant)
  #   else
  #     render 'restaurants/show', status: :unprocessable_entity
  #   end
  # end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    list = @bookmark.list
    @bookmark.destroy
    redirect_to list_path(list), status: :see_other
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def bookmarks_params
    params.require(:bookmark).permit(:comment, :movie_id, :list_id, :photo)
  end

end
