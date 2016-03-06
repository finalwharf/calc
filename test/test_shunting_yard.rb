require_relative '../calc/shunting_yard'
require 'test/unit'

class TestShuntingYard < Test::Unit::TestCase
  def test_simple_expression
    infix_notation   = '1 + 2 * 3'
    postfix_notation = '1 2 3 * +'

    result = ShuntingYard.infixToPostfix(infix_notation)
    assert_equal(postfix_notation, result)
  end

  def test_parenthesised_expression
    infix_notation   = '(1 + 2) * 3'
    postfix_notation = '1 2 + 3 *'

    result = ShuntingYard.infixToPostfix(infix_notation)
    assert_equal(postfix_notation, result)
  end

  def test_complex_expression
    infix_notation   = '3.1 + 4 * 2 / ( 1 - 5 ) ^ 2 ^ 3'
    postfix_notation = '3.1 4 2 * 1 5 - 2 3 ^ ^ / +'

    result = ShuntingYard.infixToPostfix(infix_notation)
    assert_equal(postfix_notation, result)
  end

  def test_should_pop_operator
    assert(!ShuntingYard.should_pop_operator('*', '-'))
    assert(ShuntingYard.should_pop_operator('-', '*'))
  end
end
