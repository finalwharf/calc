# A simple implementation of a stack
class SimpleStack
  def initialize
    @store = []
  end

  # Add an element at the top of the stack
  def push(element)
    @store.push(element)
  end

  # Retrieves and removes the top ot the stack
  def pop
    @store.pop
  end

  # Returns the size of the stack
  def size
    @store.size
  end

  # Retrieves but does not remove the top ot the stack
  def peek
    @store.last
  end

  def display
    puts '<top of stack>'
    @store.reverse.each do |element|
      puts element
    end
    puts '<base of stack>', '==========='
  end

  def empty?
    @store.empty?
  end

  def to_a
    @store.clone
  end
end
