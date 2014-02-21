class ApiController < ApplicationController
  before_action :set_host, only: [:heartbeat]

  # GET /api/heartbeat/:id/:token
  # GET /api/heartbeat/:id/:token.json
  def heartbeat
    @host.ip = request.remote_ip
    @host.updated_at = Time.now.to_time

    @ret = (@host.token == params[:token] && @host.save) ? @host.ip : 'false'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_host
      @host = Host.find(params[:id])
    end
end
