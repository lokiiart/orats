class PagesController < ApplicationController
  def home
    @ip = request.remote_ip
    @referer = request.referer
  end
end
