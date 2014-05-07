class SearchController < ApplicationController
  require 'rottentomatoes'
  include RottenTomatoes

  def lookup

    Rotten.api_key = RT_KEY
    movies = RottenMovie.find(:title => params[:q], :limit => 50)
    movie_collection = movies.collect{|movie| {title: CGI.escapeHTML(movie.title), description: CGI.escapeHTML(movie.synopsis), image: movie.posters.thumbnail.html_safe, year: movie.year}}
    render :json => {:status => "200"}.merge(options: movie_collection)
  end
end
