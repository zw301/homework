class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until @game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence

    unless @game_over
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
    @seq.each do |color|
      puts color
      sleep(1)
    end
    system("clear")
  end

  def require_sequence
    puts "Type the color one by one in newlines:"
    @seq.each do |color|
      if color != gets.chomp
        @game_over = true
        # game_over_message
        break
      end
    end
    system("clear")
  end

  def add_random_color
    color = COLORS.sample
    @seq << color
  end

  def round_success_message
    puts "You win this round. Try next:"
  end

  def game_over_message
    puts "Game Over"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end

if __FILE__ == $PROGRAM_NAME
  game = Simon.new
  game.play
end
