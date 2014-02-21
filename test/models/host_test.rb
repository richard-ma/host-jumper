require 'test_helper'

class HostTest < ActiveSupport::TestCase

  test "Should return full URL" do
    host = hosts(:one)
    assert_equal host.path, "http://#{host.ip}:#{host.port}#{host.suffix}", "host.path: #{host.path}"
  end

  test "Should return URL without port" do
    host = hosts(:without_port)
    assert_equal host.path, "http://#{host.ip}#{host.suffix}", "host.path: #{host.path}"
  end
end
