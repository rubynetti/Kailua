require 'test_helper'

class VerbalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @verbal = verbals(:one)
  end

  test "should get index" do
    get verbals_url
    assert_response :success
  end

  test "should get new" do
    get new_verbal_url
    assert_response :success
  end

  test "should create verbal" do
    assert_difference('Verbal.count') do
      post verbals_url, params: { verbal: { content: @verbal.content, document_date: @verbal.document_date, title: @verbal.title, authors: @verbal.authors} }
    end

    assert_redirected_to verbal_path(Verbal.last)
  end

  test "should show verbal" do
    get verbal_url(@verbal)
    assert_response :success
  end

  test "should get edit" do
    get edit_verbal_url(@verbal)
    assert_response :success
  end

  test "should update verbal" do
    patch verbal_url(@verbal), params: { verbal: { content: @verbal.content, document_date: @verbal.document_date, title: @verbal.title, authors: "Cagno Papagno" } }
    assert_redirected_to verbal_path(@verbal)
  end

  test "should destroy verbal" do
    assert_difference('Verbal.count', -1) do
      delete verbal_url(@verbal)
    end

    assert_redirected_to verbals_path
  end
end
