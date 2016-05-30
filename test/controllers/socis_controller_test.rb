require 'test_helper'

class SocisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @soci = socis(:one)
  end

  test "should get index" do
    get socis_url
    assert_response :success
  end

  test "should get new" do
    get new_soci_url
    assert_response :success
  end

  test "should create soci" do
    assert_difference('Soci.count') do
      post socis_url, params: { soci: { cf: @soci.cf, cognome: @soci.cognome, contatto: @soci.contatto, da_rinnovare: @soci.da_rinnovare, nome: @soci.nome, numero_tessera: @soci.numero_tessera } }
    end

    assert_redirected_to soci_path(Soci.last)
  end

  test "should show soci" do
    get soci_url(@soci)
    assert_response :success
  end

  test "should get edit" do
    get edit_soci_url(@soci)
    assert_response :success
  end

  test "should update soci" do
    patch soci_url(@soci), params: { soci: { cf: @soci.cf, cognome: @soci.cognome, contatto: @soci.contatto, da_rinnovare: @soci.da_rinnovare, nome: @soci.nome, numero_tessera: @soci.numero_tessera } }
    assert_redirected_to soci_path(@soci)
  end

  test "should destroy soci" do
    assert_difference('Soci.count', -1) do
      delete soci_url(@soci)
    end

    assert_redirected_to socis_path
  end
end
