require_relative '../calc/shunting_yard'
require 'test/unit'

class TestSimpleQueue < Test::Unit::TestCase
  def setup
    @queue = SimpleQueue.new
  end

  def test_create_empty_queue
    assert_equal(@queue.size, 0)
    assert(@queue.empty?)
  end

  def test_interface
   @queue.add(1)
   @queue.add(2)

   assert_equal(2, @queue.size)
   assert_equal(1, @queue.peek)

   assert_equal(1, @queue.poll)
   assert_equal(2, @queue.poll)

   assert_equal(0, @queue.size)
   assert(@queue.empty?)
  end

  def test_queue_destruction
    @queue.add('a')
    @queue.add('b')

    assert_equal(2, @queue.size)

    @queue.empty!

    assert_equal(0, @queue.size)
    assert(@queue.empty?)
  end

  def test_exception_handling
    assert_raises(EmptyQueueError){ @queue.element }
    assert_raises(EmptyQueueError){ @queue.remove }
  end

  def test_to_a
    array = [1, 2, 3];
    array.each { |e| @queue.add(e) }
    result = @queue.to_a
    assert_equal(array, result)
  end

  def teardown
    @queue = nil
  end
end
