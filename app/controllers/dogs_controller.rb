class DogsController < ApplicationController

  def index
    @dogs = Dog.all
    render template: "dogs/index"
  end
end
