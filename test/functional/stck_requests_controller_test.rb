require 'test_helper'

class StckRequestsControllerTest < ActionController::TestCase
  setup do
    @stck_request = stck_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stck_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create stck_request" do
    assert_difference('StckRequest.count') do
      post :create, stck_request: { bbm: @stck_request.bbm, idperusahaan: @stck_request.idperusahaan, idranmor: @stck_request.idranmor, jenis: @stck_request.jenis, jml_cc: @stck_request.jml_cc, jml_roda: @stck_request.jml_roda, kabupaten: @stck_request.kabupaten, kepentingan: @stck_request.kepentingan, merk: @stck_request.merk, model: @stck_request.model, no_daftar: @stck_request.no_daftar, no_mesin: @stck_request.no_mesin, no_rangka: @stck_request.no_rangka, perusahaan_id: @stck_request.perusahaan_id, tg_akhir: @stck_request.tg_akhir, tg_cetak: @stck_request.tg_cetak, tg_daftar: @stck_request.tg_daftar, tg_mohon: @stck_request.tg_mohon, tg_pembatalan: @stck_request.tg_pembatalan, tg_persetujuan: @stck_request.tg_persetujuan, thn_buat: @stck_request.thn_buat, thn_rakit: @stck_request.thn_rakit, tnkb: @stck_request.tnkb, user_id: @stck_request.user_id, warna: @stck_request.warna }
    end

    assert_redirected_to stck_request_path(assigns(:stck_request))
  end

  test "should show stck_request" do
    get :show, id: @stck_request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @stck_request
    assert_response :success
  end

  test "should update stck_request" do
    put :update, id: @stck_request, stck_request: { bbm: @stck_request.bbm, idperusahaan: @stck_request.idperusahaan, idranmor: @stck_request.idranmor, jenis: @stck_request.jenis, jml_cc: @stck_request.jml_cc, jml_roda: @stck_request.jml_roda, kabupaten: @stck_request.kabupaten, kepentingan: @stck_request.kepentingan, merk: @stck_request.merk, model: @stck_request.model, no_daftar: @stck_request.no_daftar, no_mesin: @stck_request.no_mesin, no_rangka: @stck_request.no_rangka, perusahaan_id: @stck_request.perusahaan_id, tg_akhir: @stck_request.tg_akhir, tg_cetak: @stck_request.tg_cetak, tg_daftar: @stck_request.tg_daftar, tg_mohon: @stck_request.tg_mohon, tg_pembatalan: @stck_request.tg_pembatalan, tg_persetujuan: @stck_request.tg_persetujuan, thn_buat: @stck_request.thn_buat, thn_rakit: @stck_request.thn_rakit, tnkb: @stck_request.tnkb, user_id: @stck_request.user_id, warna: @stck_request.warna }
    assert_redirected_to stck_request_path(assigns(:stck_request))
  end

  test "should destroy stck_request" do
    assert_difference('StckRequest.count', -1) do
      delete :destroy, id: @stck_request
    end

    assert_redirected_to stck_requests_path
  end
end
