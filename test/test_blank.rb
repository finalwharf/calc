require_relative '../calc/blank'
require 'test/unit'

class TestBlank < Test::Unit::TestCase
  def test_strings
    assert(''.blank?, 'Empty string should be blank')
    assert(' '.blank?, 'Whitespace string should be blank')
  end

  def test_objects
    assert([].blank?, 'Empty array should be blank')
    assert({}.blank?, 'Empty hash should be blank')
  end

  def test_boleans
    assert(nil.blank?, 'Nil should be blank')
    assert(!true.blank?, 'True should not be blank')
    assert(false.blank?, 'False should be blank')
  end

  def test_numbers
    assert(!0.blank?, '0 should not be blank')
    assert(!1.blank?, '1 should not be blank')
  end
end
