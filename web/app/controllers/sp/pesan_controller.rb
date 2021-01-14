class Sp::PesanController < ApplicationController

  before_action :login_sp_required
  layout 'sp'
  before_action :atur_tampilan

  def index
    @datas = Pesan.all
  end

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
      pesan_isi: pesan[:pesan_isi],
      created_at: pesan[:created_at]

    })

    redirect_to action: 'index'
  end

  def edit
      pesan_id = params[:pesan_id].to_i
      @data = Pesan.find(pesan_id)
  end

  def edit_post
      pesan = params[:pesan]
      @data = Pesan.find(params[:pesan_id])
      @data.pesan_nama_pengirim = pesan[:pesan_nama_pengirim]
      @data.pesan_telepon_pengirim = pesan[:pesan_telepon_pengirim]
      @data.pesan_email_pengirim = pesan[:pesan_email_pengirim]
      @data.pesan_subjek = pesan[:pesan_subjek]
      @data.pesan_isi = pesan[:pesan_isi]

      if @data.save
        flash[:notif] = "Berhasil disimpan"
        redirect_to action: 'index'
      else
        flash[:notif] = "Data tidak tersimpan"
        render 'edit'
      end
  end

  def view
    pesan = params[:pesan]
    @data = Pesan.find(params[:pesan_id])
  end

  def hapus
    if Pesan.find(params[:pesan_id].to_i).destroy
      flash[:notif] = "Berhasil dihapus"
      redirect_to action: 'index'
    else
      flash[:notif] = "Data gagal dihapus"
      render 'index'
    end
  end

  private
  def atur_tampilan
    @judul_halaman = "Contact Us"
  end
end
