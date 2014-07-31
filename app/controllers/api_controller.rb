class ApiController < ApplicationController
  before_action :set_host, only: [:heartbeat, :is_attack?]

  # GET /api/heartbeat/:id/:token
  # GET /api/heartbeat/:id/:token.json
  def heartbeat
    not_found if be_attacking?
      
    @host.ip = request.remote_ip
    @host.updated_at = Time.now.to_time

    @ret = (@host.token == params[:token] && @host.save) ? @host.ip : 'false'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_host
    @host = Host.find(params[:id])
  end
  
  def be_attacking?
    ret = false

    # heartbeat too often
    ret = true if (Time.now - @host.updated_at).to_i < Figaro.env.min_heartbeat_interval.to_i
  end
end
