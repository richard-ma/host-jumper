class Host < ActiveRecord::Base
  OFFLINE_DELTA = 180 

  # format host access url
  def path
    port == nil ? "http://#{ip}#{suffix}" : "http://#{ip}:#{port}#{suffix}"
  end

  def online?
    Time.now.to_i - updated_at.to_i <= OFFLINE_DELTA
  end
end
