require_relative '../calc/calc'
require 'test/unit'

class TestCalc < Test::Unit::TestCase
  def setup
    @calc = Calc.new
  end

  def test_simple_addition
    expression = '1 + 2'
    result = @calc.eval(expression)
    assert_equal(3, result)
  end

  def test_aaddition_and_multiplication
    expression = '1 + 2 * 3'
    result = @calc.eval(expression)
    assert_equal(7, result)
  end

  def test_parentheses
    expression = '(1 + 2) * 3'
    result = @calc.eval(expression)
    assert_equal(9, result)
  end

  def test_parentheses_and_exponent
    expression = '2 ^ 8 * (2 + 2)'
    result = @calc.eval(expression)
    assert_equal(1024, result)
  end

  def test_parentheses_exponent_and_miltiplication
    expression = '(3 + 8) ^ 5 + 3 * (12 * 4)'
    result = @calc.eval(expression)
    assert_equal(161195, result)
  end

  def teardown
    @calc = nil
  end
end
