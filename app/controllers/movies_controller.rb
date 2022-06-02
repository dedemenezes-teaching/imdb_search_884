class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    # @movies = Movie.where(title: params[:query]) if params[:query].present?
    # @movies = Movie.where('title iLIKE ?', "%#{params[:query]}%") if params[:query].present?
    # sql_query = "movies.title iLIKE :query OR
    #              movies.synopsis iLIKE :query OR
    #              directors.first_name iLIKE :query OR
    #              directors.last_name iLIKE :query"
    # @movies = Movie.joins(:director).where(sql_query, query: "%#{params[:query]}%") if params[:query].present?

    # dog
    # characters order
    # dog, dogs, dogville, hotdog

    # FULL SEARCH
    # jump
    # jumping, jumped, jumps
    # christopher nolan
    sql_query = "movies.title @@ :query OR
                 movies.synopsis @@ :query OR
                 directors.first_name @@ :query OR
                 directors.last_name @@ :query"
    @movies = Movie.joins(:director).where(sql_query, query: "%#{params[:query]}%") if params[:query].present?

  end
end
