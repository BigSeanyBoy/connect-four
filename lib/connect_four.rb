# frozen_string_literal: true

# Connect Four
class ConnectFour
  attr_accessor :state, :current_player

  def initialize
    @state = Array.new(42)
    @current_player = 'R'
  end

  def add_piece(col)
    (0...6).each do |row|
      if @state[row * 7 + col].nil?
        @state[row * 7 + col] = @current_player
        switch_player
        break
      end
      puts 'That column is full...' if row == 6
    end
  end

  def switch_player
    @current_player = @current_player == 'R' ? 'Y' : 'R'
  end

  def check_rows
    (0...6).each do |row|
      (0...4).each do |col|
        player = @state[row * 7 + col]
        next if player.nil?

        (1...4).each do |i|
          break unless player == @state[row * 7 + col + i]
          return true if i == 3
        end
      end
    end
    false
  end

  def check_cols
    (0...7).each do |col|
      (0...3).each do |row|
        player = @state[row * 7 + col]
        next if player.nil?

        (1...4).each do |i|
          break unless player == @state[(row + i) * 7 + col]
          return true if i == 3
        end
      end
    end
    false
  end

  def check_diag
    (0...3).each do |row|
      (0...4).each do |col|
        player = @state[row * 7 + col]
        next if player.nil?

        (1...4).each do |i|
          break unless player == @state[(row + i) * 7 + col + i]
          return true if i == 3
        end
      end
    end
    false
  end

  def game_over?
    check_rows || check_diag || check_cols || !@state.include?(nil)
  end

  def print_board
    puts
    (0...6).to_a.reverse.each do |row|
      (0...7).each do |col|
        symbol = @state[row * 7 + col] ? @state[row * 7 + col] : '_'
        print "| #{symbol} "
      end
      print "|\n"
    end
    print "-----------------------------\n"
    print "  0   1   2   3   4   5   6 \n"
  end
end