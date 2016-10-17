require 'test_helper'

class SociosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @socio = socios(:one)
  end

  test "should get index" do
    get socios_url
    assert_response :success
  end

  test "should get new" do
    get new_socio_url
    assert_response :success
  end

  test "should create socio" do
    assert_difference('Socio.count') do
      post socios_url, params: { socio: { cf: @socio.cf, complete:
        @socio.complete, contact: @socio.contact, name: @socio.name, number: 7, surname: @socio.surname } }
    end

    assert_redirected_to socios_path
  end

  test "should show socio" do
    get socio_url(@socio)
    assert_response :success
  end

  test "should get edit" do
    get edit_socio_url(@socio)
    assert_response :success
  end

  test "should update socio" do
    patch socio_url(@socio), params: { socio: { cf: @socio.cf, complete: @socio.complete,
      contact: @socio.contact, name: @socio.name, number: @socio.number, surname: @socio.surname } }
    assert_redirected_to socio_path(@socio)
  end

  test "should destroy socio" do
    assert_difference('Socio.count', -1) do
      delete socio_url(@socio)
    end

    assert_redirected_to socios_path
  end
end
