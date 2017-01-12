require 'test_helper'

class PageVisitorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @page_visitor = page_visitors(:one)
  end

  test "should get index" do
    get page_visitors_url
    assert_response :success
  end

  test "should get new" do
    get new_page_visitor_url
    assert_response :success
  end

  test "should create page_visitor" do
    assert_difference('PageVisitor.count') do
      post page_visitors_url, params: { page_visitor: { Page: @page_visitor.Page, Referer: @page_visitor.Referer, RemoteIP: @page_visitor.RemoteIP } }
    end

    assert_redirected_to page_visitor_url(PageVisitor.last)
  end

  test "should show page_visitor" do
    get page_visitor_url(@page_visitor)
    assert_response :success
  end

  test "should get edit" do
    get edit_page_visitor_url(@page_visitor)
    assert_response :success
  end

  test "should update page_visitor" do
    patch page_visitor_url(@page_visitor), params: { page_visitor: { Page: @page_visitor.Page, Referer: @page_visitor.Referer, RemoteIP: @page_visitor.RemoteIP } }
    assert_redirected_to page_visitor_url(@page_visitor)
  end

  test "should destroy page_visitor" do
    assert_difference('PageVisitor.count', -1) do
      delete page_visitor_url(@page_visitor)
    end

    assert_redirected_to page_visitors_url
  end
end
