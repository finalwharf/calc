require_relative 'blank'
require_relative 'simple_stack'
require_relative 'simple_queue'

# Implementation of the ShuntingYard algorithm
# https://en.wikipedia.org/wiki/Shunting-yard_algorithm
class ShuntingYard
  NUMERIC_REGEX = /[0-9\.]/
  OPERATOR_REGEX = /[\^\*\/\+\-]/

  OPERATORS = {
      '^' => { :priority => 3, :method=> :**, :assoc => :right },
      '*' => { :priority => 2, :method=> :*,  :assoc => :left  },
      '/' => { :priority => 2, :method=> :/,  :assoc => :left  },
      '+' => { :priority => 1, :method=> :+,  :assoc => :left  },
      '-' => { :priority => 1, :method=> :-,  :assoc => :left  },
  }

  # Converts an mathematical expression from infix to postfix notation
  def self.infixToPostfix(expression)
    input_queue     = SimpleQueue.new
    output_queue    = SimpleQueue.new
    operator_stack  = SimpleStack.new

    expression.chars.reject(&:blank?).each do |char|
      input_queue.add(char)
    end

    while !input_queue.empty? do
      token = input_queue.poll

      if token =~ NUMERIC_REGEX
        # Support for floaring point numbers. Read from the input
        # queue until a non-numeric symbol is encountered
        while !input_queue.empty? && input_queue.peek =~ NUMERIC_REGEX
          token = "#{token}#{input_queue.poll}"
        end
        output_queue.add(token)
      elsif token =~ OPERATOR_REGEX
        while !operator_stack.empty? && operator_stack.peek =~ OPERATOR_REGEX
          operator_1, operator_2 = token, operator_stack.peek
          if should_pop_operator(operator_1, operator_2)
            output_queue.add(operator_stack.pop)
            next
          end
          break
        end
        operator_stack.push(token)
      elsif token == '('
        operator_stack.push(token)
      elsif token == ')'
        while !operator_stack.empty? && operator_stack.peek != '('
          output_queue.add(operator_stack.pop)
        end
        operator_stack.pop
      end
    end

    while !operator_stack.empty? do
      output_queue.add(operator_stack.pop)
    end

    output_queue.to_a.join(' ')
  end

  # Determine whether or not to pop operator_2 from
  #
  # @param operator_1 - current token that's being processed
  # @param operator_2 - the operator at the top of the stak
  #
  # @return [true, false]
  def self.should_pop_operator(operator_1, operator_2)
    (OPERATORS[operator_1][:assoc] == :left  && OPERATORS[operator_1][:priority] <= OPERATORS[operator_2][:priority]) ||
    (OPERATORS[operator_1][:assoc] == :right && OPERATORS[operator_1][:priority] <  OPERATORS[operator_2][:priority])
  end
end
