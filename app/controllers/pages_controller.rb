class PagesController < ApplicationController
  def home
    @page_visitor = PageVisitor.new
    @page_visitor.RemoteIP = request.remote_ip
    @page_visitor.Referer = request.referer
    @page_visitor.UserAgent = request.user_agent


    case @page_visitor.UserAgent
      when /iPad|iPhone|Linux|Android|iPad/i
        @user_agent = :mobile
      else
        @user_agent = :pc
    end
    if ((@page_visitor.Referer) && (@user_agent == :mobile))
      @page = ab_test(:flow_enter, 'pages/zhihu_flow_enter', 'pages/baidu_flow_enter')
    else
      @page = 'pages/home'
    end

    @page_visitor.Page = @page
    @page_visitor.save
    @virtual_order = VirtualOrder.new
    if @page == 'pages/home'
      render layout: 'baidu_layout', template: @page
    else
      render layout: false, template: @page
    end

  end

  def company
    render layout: 'baidu_layout'
  end

  def contact
    render layout: 'baidu_layout'
  end

  def copy_succeed
    ab_finished :flow_enter
    render plain: "OK"
  end
end
