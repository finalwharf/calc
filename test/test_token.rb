require_relative '../calc/token'
require 'test/unit'

class TestToken < Test::Unit::TestCase
  def test_integer
    t = Token.new('1')

    assert_equal(1, t.value)
    assert_equal('1', t.original_value)

    assert(t.is_operand?)
  end

  def test_float
    t = Token.new('3.1')

    assert_equal(3.1, t.value)
    assert_equal('3.1', t.original_value)

    assert(t.is_operand?)
  end

  def test_plus_operator
    t = Token.new('+')

    assert_equal('+', t.value)
    assert_equal('+', t.original_value)

    assert(t.is_operator?)
  end

  def test_division_operator
    t = Token.new('/')

    assert_equal('/', t.value)
    assert_equal('/', t.original_value)

    assert(t.is_operator?)
  end

  def test_invalid_operators
    assert_raises(Exception){ Token.new('%') }
    assert_raises(Exception){ Token.new('{') }
  end
end
