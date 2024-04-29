require 'minitest/autorun'

class GeneralTest < Minitest::Test
  # fail if value is not an instance of the Numeric class exactly.
  # value may not be an instance of one of Numeric's superclasses.

  def test_Instance_of_numeric
    value = 
    assert_kind_of(Numeric, 2.5)
  end


end


