class Api::PesertaController < ApplicationController

  protect_from_forgery except: [:index, :edit]

    # == Keterangan
    # Untuk menampilkan profil peserta
    # == URL
    # get /api/peserta/index
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
        @datas = Orang.where(id: orang.id).order('id desc')

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

    def baru
      @orang_nama               = params[:orang_nama]
      @orang_tanggal_lahir      = params[:orang_tanggal_lahir]
      @orang_tempat_lahir       = params[:orang_tempat_lahir]
      @orang_nik                = params[:orang_nik]
      @orang_jk                 = params[:orang_jk]
      @orang_nama_ayah          = params[:orang_nama_ayah]
      @orang_nama_ibu           = params[:orang_nama_ibu]
      @orang_telepon            = params[:orang_telepon]
      @orang_tinggi             = params[:orang_tinggi]
      @orang_bb                 = params[:orang_bb]
      @orang_gol_darah          = params[:orang_gol_darah]
      @orang_jarak_sekolah      = params[:orang_jarak_sekolah]
      @orang_jumlah_saudara     = params[:orang_jumlah_saudara]
      @orang_bahasa_seharihari  = params[:orang_bahasa_seharihari]
      @orang_kategori           = params[:orang_kategori]
      @orang_jenjang_pendidikan = params[:orang_jenjang_pendidikan]
      @orang_photo              = params[:orang_photo]
      @orang_status             = params[:orang_status]


      @data = Orang.new


      @data.orang_nama               = @orang_nama
      @data.orang_tanggal_lahir      = @orang_tanggal_lahir
      @data.orang_tempat_lahir       = @orang_tempat_lahir
      @data.orang_nik                = @orang_nik
      @data.orang_jk                 = @orang_jk
      @data.orang_nama_ayah          = @orang_nama_ayah
      @data.orang_nama_ibu           = @orang_nama_ibu
      @data.orang_telepon            = @orang_telepon
      @data.orang_tinggi             = @orang_tinggi
      @data.orang_bb                 = @orang_bb
      @data.orang_gol_darah          = @orang_gol_darah
      @data.orang_jarak_sekolah      = @orang_jarak_sekolah
      @data.orang_jumlah_saudara     = @orang_jumlah_saudara
      @data.orang_bahasa_seharihari  = @orang_bahasa_seharihari
      @data.orang_kategori           = @orang_kategori
      @data.orang_jenjang_pendidikan = @orang_jenjang_pendidikan
      @data.orang_photo              = @orang_photo
      @data.orang_status             = @orang_status

      if @data.save
        render json: {
          status: 'success',
          msg: "Terimakasih telah menambahkan peserta.",
          data: {
            orang: @data
          }
        }
      else
        render json: {
          status: 'fail',
          msg: "Gagal memasukan peserta"
        }
      end
    end

    def edit

      orang_id             = params[:orang_id].to_i
      @orang_nama               = params[:orang_nama]
      @orang_tanggal_lahir      = params[:orang_tanggal_lahir]
      @orang_tempat_lahir       = params[:orang_tempat_lahir]
      @orang_nik                = params[:orang_nik]
      @orang_jk                 = params[:orang_jk]
      @orang_nama_ayah          = params[:orang_nama_ayah]
      @orang_nama_ibu           = params[:orang_nama_ibu]
      @orang_telepon            = params[:orang_telepon]
      @orang_tinggi             = params[:orang_tinggi]
      @orang_bb                 = params[:orang_bb]
      @orang_gol_darah          = params[:orang_gol_darah]
      @orang_jarak_sekolah      = params[:orang_jarak_sekolah]
      @orang_jumlah_saudara     = params[:orang_jumlah_saudara]
      @orang_bahasa_seharihari  = params[:orang_bahasa_seharihari]
      @orang_kategori           = params[:orang_kategori]
      @orang_jenjang_pendidikan = params[:orang_jenjang_pendidikan]
      @orang_photo              = params[:orang_photo]
      @orang_status             = params[:orang_status]

      @data = Orang.find(orang_id)

      @data.orang_nama               = @orang_nama
      @data.orang_tanggal_lahir      = @orang_tanggal_lahir
      @data.orang_tempat_lahir       = @orang_tempat_lahir
      @data.orang_nik                = @orang_nik
      @data.orang_jk                 = @orang_jk
      @data.orang_nama_ayah          = @orang_nama_ayah
      @data.orang_nama_ibu           = @orang_nama_ibu
      @data.orang_telepon            = @orang_telepon
      @data.orang_tinggi             = @orang_tinggi
      @data.orang_bb                 = @orang_bb
      @data.orang_gol_darah          = @orang_gol_darah
      @data.orang_jarak_sekolah      = @orang_jarak_sekolah
      @data.orang_jumlah_saudara     = @orang_jumlah_saudara
      @data.orang_bahasa_seharihari  = @orang_bahasa_seharihari
      @data.orang_kategori           = @orang_kategori
      @data.orang_jenjang_pendidikan = @orang_jenjang_pendidikan
      @data.orang_photo              = @orang_photo
      @data.orang_status             = @orang_status

      if @data.save
        render json: {
          status: 'success',
          msg:    "Profil berhasil di edit."
        }
      else
        render json: {
          status: 'fail',
          msg:    "Gagal mengedit profil"
        }
      end
    end

    def hapus
      @data = Orang.find(params[:orang_id].to_i).destroy
      if @data
        render json: {
          status: 'success',
          msg:    "Peserta berhasil dihapus."
        }
      else
        render json: {
          status: 'fail',
          msg:    "Gagal menghapus peserta"
        }

      end
    end
end
