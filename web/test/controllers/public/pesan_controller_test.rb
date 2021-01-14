require 'test_helper'

class Public::PesanControllerTest < ActionDispatch::IntegrationTest
  test "should get baru" do
    get public_pesan_baru_url
    assert_response :success
  end

end
