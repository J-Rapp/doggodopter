class DogsController < ApplicationController
  def index
    @dogs = Dogs.all
  end

  def destroy
  end
end
