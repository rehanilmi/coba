class Sp::InfoController < ApplicationController

  before_action :login_sp_required
  layout 'sp'
  before_action :atur_tampilan

  def index
    @datas = Info.all
  end

  def baru
        @data = Info.new
  end

  def baru_post
    info = params[:info]

    Info.create({
      info_judul: info[:info_judul],
      info_isi: info[:info_isi],
      info_created_by: info[:info_created_by],
      info_photo: info[:info_photo]

    })

    redirect_to action: 'index'
  end

  def edit
      info_id = params[:info_id].to_i
      @data = Info.find(info_id)
  end

  def edit_post
      info = params[:info]
      @data = Info.find(params[:info_id])
      @data.info_judul = info[:info_judul]
      @data.info_isi = info[:info_isi]
      @data.info_created_by = info[:info_created_by]
      @data.info_photo = info[:info_photo]
      
      if @data.save
        flash[:notif] = "Berhasil disimpan"
        redirect_to action: 'index'
      else
        flash[:notif] = "Data tidak tersimpan"
        render 'edit'
      end
  end

  def view
    info = params[:info]
    @data = Info.find(params[:info_id])
  end

  def hapus
    if Info.find(params[:info_id].to_i).destroy
      flash[:notif] = "Berhasil dihapus"
      redirect_to action: 'index'
    else
      flash[:notif] = "Data gagal dihapus"
      render 'index'
    end
  end

  private
  def atur_tampilan
    @judul_halaman = "Info"
  end
end
