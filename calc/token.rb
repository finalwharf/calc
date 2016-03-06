class Token
  attr_reader :value, :original_value

  OPERAND_REGEX = /\A\d+(\.\d+)?\z/
  OPERATOR_REGEX = /\A[\(\)^*\/+-]\z/

  def initialize(original_value)
    @original_value = original_value
    @value = parse
  end

  def parse
    if is_operand?
      if original_value.include?('.')
        Float(original_value)
      else
        Integer(original_value)
      end
    elsif is_operator?
      original_value
    else
      raise Exception.new "Invalid token <#{original_value}>."
    end
  end

  def is_operand?;  original_value =~ OPERAND_REGEX;  end
  def is_operator?; original_value =~ OPERATOR_REGEX; end

  def to_s
    value.to_s
  end
end
