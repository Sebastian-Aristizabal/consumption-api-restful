class RestaurantsController < ApplicationController
  require 'rest-client'
  require 'json'

  def index
    #endpoint: http://localhost:3001/api/v1/characters
    @result = RestClient.get("http://localhost:3001/api/v1/restaurants")
    @restaurants = JSON.parse(@result)
  end

  # def show
  #   result = RestClient.get("http://localhost:3001/api/v1/characters/#{params[:id]}")
  #   @character = JSON.parse(result)
  #   raise
  # end


  # def new

  # end

  # def create
  #   result = RestClient.post("http://localhost:3001/api/v1/characters", { 'name' => params["name"], 'actor' => params["actor"] }.to_json, {content_type: :json, accept: :json} )

  #   if result.code == 201
  #     redirect_to characters_path #esto es lo mismo que "/characters"
  #   else
  #     render "/characters/new", status: :unprocessable_entity
  #   end

  # end

  # def edit
  # end

  # def update
  # end

  # def destroy
  # end
end
