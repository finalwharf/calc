require_relative 'token'
require_relative 'simple_stack'
require_relative 'shunting_yard'

class Calc
  # param expression - a regular algebraic (infix) expression
  def eval(expression)
    postfix_expression = ShuntingYard.infixToPostfix(expression)
    tokens = postfix_expression.split

    evaluation_stack = SimpleStack.new

    tokens.each do |t|
      token = Token.new(t)
      if token.is_operand?
        evaluation_stack.push(token.value)
      elsif token.is_operator?
        value_a = evaluation_stack.pop
        value_b = evaluation_stack.pop

        method = ShuntingYard::OPERATORS[token.value][:method]

        result = value_b.send(method, value_a)
        evaluation_stack.push(result)
      end
    end

    evaluation_stack.pop
  end
end
