require 'test_helper'

class Api::V1::ReportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_report = api_v1_reports(:one)
  end

  test "should get index" do
    get api_v1_reports_url, as: :json
    assert_response :success
  end

  test "should create api_v1_report" do
    assert_difference('Api::V1::Report.count') do
      post api_v1_reports_url, params: { api_v1_report: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show api_v1_report" do
    get api_v1_report_url(@api_v1_report), as: :json
    assert_response :success
  end

  test "should update api_v1_report" do
    patch api_v1_report_url(@api_v1_report), params: { api_v1_report: {  } }, as: :json
    assert_response 200
  end

  test "should destroy api_v1_report" do
    assert_difference('Api::V1::Report.count', -1) do
      delete api_v1_report_url(@api_v1_report), as: :json
    end

    assert_response 204
  end
end
