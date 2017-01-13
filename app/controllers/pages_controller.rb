class PagesController < ApplicationController
  def home
    if !request.referer
      @page = ab_test(:flow_enter, 'pages/zhihu_flow_enter', 'pages/baidu_flow_enter')
    else
      @page = 'pages/home'
    end
    @page_visitor = PageVisitor.new
    @page_visitor.RemoteIP = request.remote_ip
    @page_visitor.Referer = request.referer
    @page_visitor.Page = @page
    @page_visitor.save
    @virtual_order = VirtualOrder.new
    render layout: false, template: @page
  end
  def copy_succeed
    ab_finished :flow_enter
    render plain: "OK"
  end
end
