require 'test/unit'
require 'gauges_api'

class GaugesTest < MiniTest::Unit::TestCase

  def test_initialize_with_token
    token = "b078b3daa71689977fbbf6037fcd71bf"
    client = Gauges::Client.new token

    assert_equal client.token, token
  end

  def test_throw_exception_without_token
    assert_raises(ArgumentError) { cl = Gauges::Client.new }
  end

end
