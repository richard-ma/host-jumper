class WelcomeController < ApplicationController
  def index
    @client_ip = request.remote_ip
  end
end
