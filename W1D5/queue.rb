# class Queue
#   def initialize
#     @queue = []
#   end
#
#   def enqueue(el)
#     @queue << el
#   end
#
#   def dequeue
#     @queue.shift
#   end
#
#   def show
#     @queue.dup
#   end
#
# end

class Queue
  def initialize
    @queue = []
  end

  def enqueue(el)
    queue << el
    self
  end

  def dequeue
    queue.shift
  end

  def show
    queue.dup
  end

  private
  attr_reader :queue
end


if __FILE__ == $PROGRAM_NAME
  q = Queue.new

  q.enqueue(10)
  q.enqueue(20)
  p q.show
  q.dequeue
  p q.show
end
