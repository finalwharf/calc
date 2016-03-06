# Welcome to Calc

## Getting started
First, get the source:
```bash
$ git clone git@github.com:finalwharf/calc.git
```

Then, run it
```bash
$ cd calc
$ ./calc.rb
```

## What is it
Calc is a simple console-based calculator implemented in Ruby.

## What does it do
It reads standard algebraic expressions from the console, converts them to postfix notarion a.k.a [Reverse Polish Notation](https://en.wikipedia.org/wiki/Reverse_Polish_notation) and then evaluates them.
Currently it supports the following:
  * Parentheses
  * Exponentiation
  * Multiplication
  * Division
  * Addition
  * Subtraction

## How does it do it
Calc uses the [Shunting-Yard algorithm](https://en.wikipedia.org/wiki/Shunting-yard_algorithm) to convert expressions from infix to postfix notation.

After the conversion **`1 + 2 * 3`**, for example, becomes **`1 2 3 * +`**.

It's a simple algorithm that relies on a stack (for operators) and two queues (for input and output) to work it's magic.

After the conversion, another algorithm is used to evaluate the newly created postfix expression. The second algorithm relies on a single stack.

## Todo
* Add support for negative numbers (unary operator)
* Add support for functions (_sin_, _max_, etc...)

## License
Calc is released under the [MIT License](http://www.opensource.org/licenses/MIT).
