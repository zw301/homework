# class Stack
#     def initialize
#       # create ivar to store stack here!
#       @stack = []
#     end
#
#     def add(el)
#       # adds an element to the stack
#       @stack << el
#     end
#
#     def remove
#       # removes one element from the stack
#       @stack.pop
#     end
#
#     def show
#       # return a copy of the stack
#       @stack.dup
#     end
#   end

class Stack
  def initialize
    @stack = []
  end

  def add(el)
    stack << el
    self
  end

  def remove
    stack.pop
  end

  def size
    stack.size
  end

  def show
    stack.dup
  end

  private
  attr_reader :stack
end

  if __FILE__ == $PROGRAM_NAME
    s = Stack.new

    s.add(1)
    s.add(2)
    p s.show
    s.remove
    p s.show

    p s.stack
  end
