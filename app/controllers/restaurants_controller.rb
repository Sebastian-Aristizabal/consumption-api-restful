class RestaurantsController < ApplicationController
  require 'rest-client'
  require 'json'

  def index
    result = RestClient.get("http://localhost:3001/api/v1/restaurants")
    @restaurants = JSON.parse(result)
  end

  def show
    result = RestClient.get("http://localhost:3001/api/v1/restaurants/#{params[:id]}")
    @restaurant = JSON.parse(result)
  end


  # def new

  # end

  def create
    result = RestClient.post("http://localhost:3001/api/v1/restaurants", { 'name' => params["name"], 'description' => params["description"], 'address' => params["address"], 'city' => params["city"], 'photo_url' => params["photo_url"] }.to_json, {content_type: :json, accept: :json} )

    if result.code == 201
      redirect_to restaurants_path
    else
      render "/restaurants/new", status: :unprocessable_entity
    end

  end

  # end

  # def edit
  # end

  # def update
  # end

  # def destroy
  # end
end
