class ApplicationController < ActionController::Base
  #before_action :authenticate_user!

  # = Keterangan
  # Digunakan untuk membatasi akses kepada halaman admin.
  # metode ini dipanggil sebelum mengakses controller
  # == Params
  # -
  # == Todo
  # -

  def login_sp_required
    if session[:admin_tf].nil? == true
      redirect_to "/sp/auth/masuk"
    end
  end
  def login_peserta_required
    if session[:pesertaa_tf].nil? == true
      redirect_to "/public/auth2/auth2/masuk"
    end
  end
  # = Keterangan
  # Digunakan untuk mengambil orang pada tabel orangs berdasarkan JWT yang dikirimkan
  # == Params
  # -
  # == Todo
  # -
  def get_orang_from_jwt_token
    jwt_token = request.headers["JWT"]

    if jwt_token
      return Peserta.where(peserta_jwt_token: jwt_token).first
    else
      return nil
    end
  end

  def app_api_get_orang_from_jwt
    if !request.headers["JWT"]
      render json: {
        status: 'fail',
        msg: 'Token tidak ditemukan'
      }
    elsif request.headers["JWT"]

      orang_arr = Peserta.where(orang_jwt_token: request.headers["JWT"])

      if orang_arr.count == 0
        render json: {
          status: 'fail',
          msg: 'Anggota tidak ditemukan'
        }
      elsif orang_arr.count == 1
        @orang = orang_arr.first  # ini bisa di load dari method yang memanggilnya
      else
        render json: {
          status: 'fail',
          msg: 'Pengguna tidak ditemukan'
        }
      end
    end
  end
end
