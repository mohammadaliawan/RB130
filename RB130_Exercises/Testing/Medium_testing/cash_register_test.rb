require 'minitest/autorun'

require_relative 'cash_register.rb'
require_relative 'transaction.rb'

class CashRegisterTest < Minitest::Test

  def setup
    @register = CashRegister.new(1000)
    @transaction = Transaction.new(10)

    @transaction.amount_paid = 15
  end

  def test_accept_money
    @register.accept_money(@transaction)
    assert_equal(1015, @register.total_money)
  end

  def test_change
    change = @register.change(@transaction)

    assert_equal(5, change)
  end

  def test_give_receipt
    assert_output("You've paid $10.\n", nil) do |_|
      @register.give_receipt(@transaction)
    end
  end

end