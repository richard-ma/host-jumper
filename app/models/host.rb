class Host < ActiveRecord::Base

  # format host access url
  def path
    @port == nil ? "http://#{@ip}#{@suffix}" : "http://#{@ip}:#{@port}#{@suffix}"
  end
end
