class PagesController < ApplicationController
  def home
    @page_visitor = PageVisitor.new
    @page_visitor.RemoteIP = request.remote_ip
    @page_visitor.Referer = request.referer
    @page_visitor.Page = "baidu_examine"
    @page_visitor.save
  end
end
