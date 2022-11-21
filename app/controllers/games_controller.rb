class GamesController < ApplicationController
  def new
    @letters = 10.times.map {[*'a'..'z'].sample}
    params[:score] =  @letters
  end

  def score
    require "json"
    require "open-uri"

    url = "https://wagon-dictionary.herokuapp.com/#{params[:score]}"
    user_serialized = URI.open(url).read
    @user = JSON.parse(user_serialized)


    if @letters == @user
      "congratulation #{@letters} is a valid word"
    elsif @letters != @user
      "sorry but #{@letters} does not seem to be a valid english word"
    end
  end
end
