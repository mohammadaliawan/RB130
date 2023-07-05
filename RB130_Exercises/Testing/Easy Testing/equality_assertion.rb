require 'minitest/autorun'

class MixTests < Minitest::Test

  def test_downcase
  value = 2
  assert_equal('xyz', value.downcase)
  end
end