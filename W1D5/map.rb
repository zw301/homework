class Map

  def initialize
    @map = Array.new(0) {[]}
  end

  def assign(key, value)
    #create a new key-value pair or update the value for a pre-existing key
    if has_key?(key)
      @map.each do |pair|
        if pair[0] == key
          pair[1] = value
        end
      end
    else
      @map << [key, value]
    end
  end

  def has_key?(key)
    @map.each do |pair|
      return true if pair[0] == key
    end
    false
  end

  def lookup(key)
    if has_key?(key)
      @map.each do |pair|
        return pair[1] if pair[0] == key
      end
    end
    nil
  end

  def remove(key)
    if has_key?(key)
      @map.each_with_index do |pair, idx|
        @map.slice!(idx) if pair[0] == key
      end
    end
    nil
  end

  def show
    deep_copy2(@map)
  end

  def deep_copy(arr)
    result = []

    arr.each do |el|
      if el.is_a?(Array)
        result << deep_copy(el)
      else
        result << el
      end
    end

    result
  end

  def deep_copy2(arr)
    arr.map {|el| el.is_a?(Array) ? deep_copy2(el) : el }
  end
end


if __FILE__ == $PROGRAM_NAME
  map = Map.new

  map.assign("a", 1)
  map.assign("b", 2)
  map.assign("c", 3)
  p map.show

  p map.lookup("b")

  map.assign("a", 9)
  p map.lookup("a")

  map.remove("c")
  p map.show

end
