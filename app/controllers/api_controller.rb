class ApiController < ApplicationController
  before_action :set_host, only: [:heartbeat]

  # GET /api/heartbeat/:id/:token
  # GET /api/heartbeat/:id/:token.json
  def heartbeat
    @host.ip = request.remote_ip

    if @host.token == params[:token] and @host.save
      @ret = @host.ip
    else
      @ret = 'false'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_host
      @host = Host.find(params[:id])
    end
end
