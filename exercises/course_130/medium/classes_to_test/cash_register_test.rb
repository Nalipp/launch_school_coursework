require 'minitest/autorun'
require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < MiniTest::Test
  def setup
    @cash_register = CashRegister.new(5000)
    @transaction = Transaction.new(100)
  end

  def test_accept_money
    assert_equal 5000, @cash_register.accept_money(@transaction)
  end
end
