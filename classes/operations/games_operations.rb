require_relative 'author_operations'
require_relative '../structure/game'
require_relative '../../module/data_operations'
require_relative '../../module/populate_games'
require_relative '../../module/games/game_creation'

class GamesOperations
  include DataOperations
  include PopulateGames
  include GameCreation

  def initialize
    @games = populate_games
    @authors = AuthorOperations.new
  end

  def add_game
    new_game, author = create_game
    game_parsed_to_author = new_game.to_hash.select! { |k, _| %w[id item_type].include?(k) }
    updated_authors = fetch_data('authors').map do |stored_author|
      stored_author['items'].push(game_parsed_to_author) if author.id == stored_author['id']
      stored_author
    end
    rewrite_data('authors', updated_authors)

    game_stored_in_games = new_game.to_hash.reject! { |k, _| k == 'item_type' }
    game_stored_in_games['author'] = author.to_hash.reject! { |k, _| k == 'items' }

    update_data('games', game_stored_in_games)
    @games << new_game
    puts 'Game created successfully!'
  end

  def list_all_games
    if @games.empty?
      puts 'No games available'
    else
      puts '___________Your Games___________'
    end
    @games.map(&:to_hash).each_with_index do |game, index|
      puts "
      id: #{game['id']}
      last_played_at: #{game['last_played_at']}"
      if index == @games.size - 1
        puts ''
        puts '________________END________________'
      else
        puts '______________________________________________'
      end
    end
  end
end
