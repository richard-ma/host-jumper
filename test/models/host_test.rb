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

  test "Should Online" do
    host = hosts(:one)
    host.updated_at = Time.now
    assert host.online?, "host.updated_at: #{host.updated_at}"
  end

  test "Should Offline" do
    host = hosts(:one)
    host.updated_at = host.updated_at - Host::OFFLINE_DELTA - 1
    assert_not host.online?, "host.updated_at: #{host.updated_at}"
  end
end
