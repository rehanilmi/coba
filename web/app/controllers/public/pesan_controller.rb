class Public::PesanController < ApplicationController
# before_action :login_peserta_required
  def baru
        @data = Pesan.new
  end

  def baru_post
    pesan = params[:pesan]

    Pesan.create({
      pesan_nama_pengirim: pesan[:pesan_nama_pengirim],
      pesan_telepon_pengirim: pesan[:pesan_telepon_pengirim],
      pesan_email_pengirim: pesan[:pesan_email_pengirim],
      pesan_subjek: pesan[:pesan_subjek],
      pesan_isi: pesan[:pesan_isi]

    })

    redirect_to controller: "/public/public", action: "guru"
  end
end
