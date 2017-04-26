class DogsController < ApplicationController
  def index
    @dogs = Dog.all
  end

  def destroy
  end
end
