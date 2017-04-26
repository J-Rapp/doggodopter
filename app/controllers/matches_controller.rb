class MatchesController < ApplicationController
  def create
    @match = Match.create(match_params)
  end

  private

  def match_params
    params.require(:match).permit(:selected)
  end
end
