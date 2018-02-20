class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1, @name2 = name1, name2

    @cups = Array.new(14) {[]}

    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    self.cups.each_with_index do |cup, i|
      if i == 6 || i == 13
        next
      else
         self.cups[i] = [:stone, :stone, :stone, :stone]
        # 4.times {cup << :stone}
      end
    end
  end

  # def [](pos)
  #   @cups[pos]
  # end
  #
  # def []=(pos, val)
  #   @cups[pos] = val
  # end


  def valid_move?(start_pos)
    # raise "Invalid starting cup" if start_pos < 1 || start_pos > 12
    raise "Invalid starting cup" if start_pos < 0 || start_pos > 13
    raise "Invalid starting cup" if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    # return if valid_move?(start_pos)
    #empties the selected cup
    stones = self.cups[start_pos]
    self.cups[start_pos] = []


    cur_pos = start_pos
    until stones.empty?
      cur_pos += 1

      if cur_pos == 14
        cur_pos = 0
      end

      if cur_pos == 6
        self.cups[cur_pos] += [stones.pop] if current_player_name == @name1
      elsif cur_pos == 13
        self.cups[cur_pos] += [stones.pop] if current_player_name == @name2
      else
        self.cups[cur_pos] += [stones.pop]
      end
    end

    render
    next_turn(cur_pos)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif self.cups[ending_cup_idx].length == 1
      :switch
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    self.cups[0..5].all? {|arr| arr.empty? } ||
      self.cups[7..12].all? {|arr| arr.empty? }
  end

  def winner
    if self.cups[6] == self.cups[13]
      return :draw
    elsif self.cups[6].length > self.cups[13].length
      return @name1
    else
      return @name2
    end
  end
end
