require_relative '../calc/simple_stack'
require 'test/unit'

class TestSimpleStack < Test::Unit::TestCase
  def setup
    @stack = SimpleStack.new
  end

  def test_create_empty_stack
    assert_equal(0, @stack.size)
    assert(@stack.empty?)
  end

  def test_interface
    @stack.push(1)
    @stack.push(2)

    assert_equal(2, @stack.size)
    assert_equal(2, @stack.peek)

    assert_equal(2, @stack.pop)
    assert_equal(1, @stack.pop)

    assert_equal(0, @stack.size)
    assert(@stack.empty?)
  end

  def teardown
    @stack = nil
  end
end
