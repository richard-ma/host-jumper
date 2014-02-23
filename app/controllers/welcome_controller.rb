class WelcomeController < ApplicationController
  def index
    @hosts = Host.all.order(updated_at: :desc)
  end
end
