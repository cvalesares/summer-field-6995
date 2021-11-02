class MoviesController < ApplicationController

  def show
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    @movie.actors.new(actor_params)
    
    redirect_to "/movies/#{@movie.id}"
  end

  private
    def actor_params
      result = {name: params[:name],
        age: params[:age]}
    end
end
