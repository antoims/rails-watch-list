class BookmarksController < ApplicationController
  before_action :set_list, only: %i[new create]
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
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def bookmarks_params
    params.require(:bookmark).permit(:comment, :movie_id, :list_id)
  end

end
