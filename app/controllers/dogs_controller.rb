class DogsController < ApplicationController

  def index
    @dogs = Dog.all
    render template: "dogs/index"
  end

  def show 
    @dogs = Dog.find_by(id: params["id"])
    render template: "dogs/show"
  end

  def create
    @dogs = Dog.new(
      name: params[:name],
      breed: params[:breed],
      age: params[:age],
    )
    if @dogs.save
      render template: "dogs/show"
    else
      render json: {errors: @dogs.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    @dogs = Dog.find_by(id: params[:id])
    @dogs.name = params[:name] || @dogs.name
    @dogs.breed = params[:breed] || @dogs.breed
    @dogs.age = params[:age] || @dogs.age
    @dogs.save
    render template: "dogs/show"
  end

  def destroy 
    @dogs = Dog.find_by(id: params["id"])
    if @dogs
      @dogs.destroy
      render json: {message: "dog has been removed"}
    else
      render json: {message: "dog not found"}, status: :not_found
    end
  end
end
