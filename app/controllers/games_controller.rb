class GamesController < ApplicationController
  before_action only: %i[create show]

  def create
    guest = User.first
    game = guest.games.create
    redirect_to(game)
  end

  def show
    @game = Game.find(params[:id])
    # authorize @game
    @word = Words::RandomWord.new.call
  end
end
