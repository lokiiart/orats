class PagesController < ApplicationController
  skip_before_action  :logged_in_user, except: :dashboard
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
    case @page_visitor.Referer
      when /localhost|b1dong/i
        @user_referer = :none
      when nil
        @user_referer = :none
      else
        @user_referer = :yes
    end


    if ((@user_referer == :yes) && (@user_agent == :mobile))
      # @page = ab_test(:flow_enter, 'pages/zhihu_flow_enter', 'pages/baidu_flow_enter')
      # @page = 'pages/baidu_list'
      @page = 'pages/baidu_flow_enter'
    else
      # @page = 'pages/baidu_list'
      # @page = 'pages/baidu_flow_enter'
      @page = 'pages/home'
    end

    @page_visitor.Page = @page
    @page_visitor.save
    if @page == 'pages/home'
      render layout: 'baidu_layout', template: @page
    else
      render layout: false, template: @page
    end

  end

  def baidu
    cookies[:visited] = "1"
    render layout: false, template: 'pages/baidu_flow_enter'
  end

  def zhihu
    render layout: false, template: 'pages/zhihu_flow_enter'
  end

  def upali
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
    case @page_visitor.Referer
      when /localhost|b1dong/i
        @user_referer = :none
      when nil
        @user_referer = :none
      else
        @user_referer = :yes
    end


    if ((@user_referer == :yes) && (@user_agent == :mobile))
      # @page = ab_test(:flow_enter, 'pages/zhihu_flow_enter', 'pages/baidu_flow_enter')
      @page = 'pages/upali'
      # @page = 'pages/home'
    else
      # @page = 'pages/baidu_list'
      @page = 'pages/home'
    end

    @page_visitor.Page = @page
    @page_visitor.save
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

  def products
    render layout: 'baidu_layout'
  end

  def copy_succeed
    # ab_finished :flow_enter
    @page_visitor = PageVisitor.new
    @page_visitor.RemoteIP = request.remote_ip
    @page_visitor.Referer = request.referer
    @page_visitor.UserAgent = request.user_agent
    @page_visitor.Page = 'pages/copy_succeed'

    @page_visitor.save

    render plain: "OK"
  end

  def copy_wenbo
    @page_visitor = PageVisitor.new
    @page_visitor.RemoteIP = request.remote_ip
    @page_visitor.Referer = request.referer
    @page_visitor.UserAgent = request.user_agent
    @page_visitor.Page = 'pages/copy_wenbo'

    @page_visitor.save

    render plain: "OK"
  end

  def dashboard
    render layout: 'application', template: 'pages/dashborad'
  end
end
