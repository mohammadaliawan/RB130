require 'minitest/autorun'

class MixTests < Minitest::Test

  def test_nil
  value = nil
  assert_nil(value)
  end
end