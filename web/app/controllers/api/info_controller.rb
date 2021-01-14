class Api::InfoController < ApplicationController
  protect_from_forgery except: [:index]

    # == Keterangan
    # Untuk menampilkan info
    # == URL
    # get /api/info/index
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
        @datas = Info.all

        render json: {
          status: 'success',
          msg: 'Info berhasil diminta',
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
