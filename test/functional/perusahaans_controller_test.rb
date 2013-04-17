require 'test_helper'

class PerusahaansControllerTest < ActionController::TestCase
  setup do
    @perusahaan = perusahaans(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:perusahaans)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create perusahaan" do
    assert_difference('Perusahaan.count') do
      post :create, perusahaan: { alamat_badan: @perusahaan.alamat_badan, kdperusahaan: @perusahaan.kdperusahaan, nama_badan: @perusahaan.nama_badan, nama_kontak: @perusahaan.nama_kontak, nama_penanggung: @perusahaan.nama_penanggung, telepon: @perusahaan.telepon }
    end

    assert_redirected_to perusahaan_path(assigns(:perusahaan))
  end

  test "should show perusahaan" do
    get :show, id: @perusahaan
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @perusahaan
    assert_response :success
  end

  test "should update perusahaan" do
    put :update, id: @perusahaan, perusahaan: { alamat_badan: @perusahaan.alamat_badan, kdperusahaan: @perusahaan.kdperusahaan, nama_badan: @perusahaan.nama_badan, nama_kontak: @perusahaan.nama_kontak, nama_penanggung: @perusahaan.nama_penanggung, telepon: @perusahaan.telepon }
    assert_redirected_to perusahaan_path(assigns(:perusahaan))
  end

  test "should destroy perusahaan" do
    assert_difference('Perusahaan.count', -1) do
      delete :destroy, id: @perusahaan
    end

    assert_redirected_to perusahaans_path
  end
end
