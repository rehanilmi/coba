class Api::StafController < ApplicationController

  protect_from_forgery except: [:index]

    # == Keterangan
    # Untuk menampilkan profil staf
    # == URL
    # get /api/guru/index
    # == Headers
    # - JWT
    # == Params
    # -
    # == Response: JSON
    # -
    # == Todo
    # -
    def index

      orang = get_orang_from_jwt_token


      if orang
        @datas = Staf.all

        render json: {
          status: 'success',
          msg: 'Profil berhasil diminta',
          data: @datas
        }
      else
        render json: {
          status: 'fail',
          msg: 'Anda tidak berhak mendapatkan data untuk halaman ini'
        }
      end
    end

end
