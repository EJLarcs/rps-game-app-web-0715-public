require 'pry'
require_relative 'config/environment'

class GameApp < Sinatra::Base
  get '/rps/:play' do
    game = RPSGame.new(params['play'].to_sym)
    @play_type = game.play_type
    @computer_play_type = game.computer_play
    @game_status = game.game_status
    erb :rps_game
  end

end
