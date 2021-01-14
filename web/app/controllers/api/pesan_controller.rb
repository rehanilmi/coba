class Api::PesanController < ApplicationController
  protect_from_forgery except: [:baru]

  def baru
    @pesan_nama_pengirim    = params[:pesan_nama_pengirim]
    @pesan_telepon_pengirim = params[:pesan_telepon_pengirim]
    @pesan_email_pengirim   = params[:pesan_email_pengirim]
    @pesan_subjek           = params[:pesan_subjek]
    @pesan_isi              = params[:pesan_isi]

    @data = Pesan.new

    @data.pesan_nama_pengirim    = @pesan_nama_pengirim
    @data.pesan_telepon_pengirim = @pesan_telepon_pengirim
    @data.pesan_email_pengirim   = @pesan_email_pengirim
    @data.pesan_subjek           = @pesan_subjek
    @data.pesan_isi              = @pesan_isi

    if @data.save
      render json: {
        status: 'success',
        msg: "Terimakasih telah menambahkan pesan.",
        data: {
          pesan: @data
        }
      }
    else
      render json: {
        status: 'fail',
        msg: "Gagal memasukan pesan"
      }
    end
  end



end
