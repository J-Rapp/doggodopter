class MatchesController < ApplicationController
  def create
    p params
    @match = Match.create(match_params)
  end

  private

  def match_params
    params.require(:match).permit(:selected, :user_id, :dog_id)
  end
end
