require './lib/connect_four.rb'

describe ConnectFour do
  describe '#add_piece' do
    it 'Add a single piece' do
      board = ConnectFour.new
      board.add_piece(0)
      result_state = Array.new(42)
      result_state[0] = 'R'
      expect(board.state).to eql(result_state)
    end

    it 'Add a multiple pieces' do
      board = ConnectFour.new
      board.add_piece(0)
      board.add_piece(1)
      board.add_piece(0)
      result_state = Array.new(42)
      result_state[0] = 'R'
      result_state[1] = 'Y'
      result_state[7] = 'R'
      expect(board.state).to eql(result_state)
    end
  end

  describe '#switch_player' do
    it 'switch player once' do
      board = ConnectFour.new
      board.switch_player
      expect(board.current_player).to eql('Y')
    end

    it 'switch player twice' do
      board = ConnectFour.new
      board.switch_player
      board.switch_player
      expect(board.current_player).to eql('R')
    end

    it 'switch player after adding piece' do
      board = ConnectFour.new
      board.add_piece(0)
      expect(board.current_player).to eql('Y')
    end
  end

  describe '#check_row' do
    it 'neither player has four in a row' do
      board = ConnectFour.new
      board.add_piece(0)
      board.add_piece(6)
      board.add_piece(0)
      expect(board.check_rows).to eql(false)
    end

    it 'four in a row' do
      board = ConnectFour.new
      board.add_piece(0)
      board.add_piece(6)
      board.add_piece(1)
      board.add_piece(6)
      board.add_piece(2)
      board.add_piece(6)
      board.add_piece(3)
      expect(board.check_rows).to eql(true)
    end
  end

  describe '#check_cols' do
    it 'neither player has four in a column' do
      board = ConnectFour.new
      board.add_piece(0)
      board.add_piece(6)
      board.add_piece(0)
      expect(board.check_cols).to eql(false)
    end

    it 'four in a column' do
      board = ConnectFour.new
      board.add_piece(0)
      board.add_piece(6)
      board.add_piece(0)
      board.add_piece(6)
      board.add_piece(0)
      board.add_piece(6)
      board.add_piece(0)
      expect(board.check_cols).to eql(true)
    end
  end

  describe '#check_diag' do
    it 'neither player has four in a diagonal' do
      board = ConnectFour.new
      board.add_piece(0)
      board.add_piece(6)
      board.add_piece(0)
      expect(board.check_diag).to eql(false)
    end

    it 'four in a diagonal' do
      board = ConnectFour.new
      board.add_piece(0)
      board.add_piece(1)
      board.add_piece(1)
      board.add_piece(2)
      board.add_piece(3)
      board.add_piece(2)
      board.add_piece(2)
      board.add_piece(3)
      board.add_piece(4)
      board.add_piece(3)
      board.add_piece(3)
      expect(board.check_diag).to eql(true)
    end
  end

  describe '#game_over' do
    it 'full board' do
      board = ConnectFour.new
      player = 'R'
      (0...6).each do |row|
        player = player == 'R' ? 'Y' : 'R'
        (0...7).each do |col|
          board.state[row * 7 + col] = player unless col == 3
        end
      end
      board.add_piece(3)
      board.add_piece(3)
      board.add_piece(3)
      board.add_piece(3)
      board.add_piece(3)
      board.add_piece(3)
      expect(board.game_over?).to eql(true)
    end
  end
end