class Sp::StafController < ApplicationController

  before_action :login_sp_required
  layout 'sp'
  before_action :atur_tampilan


  def index
    @datas = Staf.all
  end

  def baru
    @data = Staf.new
  end

  def baru_post

      staf = params[:staf]

      Staf.create({
        staf_nama: staf[:staf_nama],
        staf_tgl_lahir: staf[:staf_tgl_lahir],
        staf_tempat_lahir: staf[:staf_tempat_lahir],
        staf_jk: staf[:staf_jk],
        staf_status_kepegawaian: staf[:staf_status_kepegawaian],
        staf_telepon: staf[:staf_telepon],
        staf_alamat: staf[:staf_alamat],
        staf_email: staf[:staf_email],
        staf_pendidikan_terakhir: staf[:staf_pendidikan_terakhir],
        staf_agama: staf[:staf_agama],
        staf_status_perkawinan: staf[:staf_status_perkawinan],
        staf_photo: staf[:staf_photo]


      })

      redirect_to action: 'index'
   end

   def edit
       staf_id = params[:staf_id].to_i
       @data = Staf.find(staf_id)
   end

   def edit_post
       staf = params[:staf]
       @data = Staf.find(params[:staf_id])
       @data.staf_nama = staf[:staf_nama]
       @data.staf_tgl_lahir = staf[:staf_tgl_lahir]
       @data.staf_tempat_lahir = staf[:staf_tempat_lahir]
       @data.staf_jk = staf[:staf_jk]
       @data.staf_alamat = staf[:staf_alamat]
       @data.staf_status_kepegawaian = staf[:staf_status_kepegawaian]
       @data.staf_telepon = staf[:staf_telepon]
       @data.staf_email = staf[:staf_email]

       @data.staf_agama = staf[:staf_agama]
       @data.staf_status_perkawinan = staf[:staf_status_perkawinan]
       @data.staf_photo = staf[:staf_photo]
       if @data.save
         flash[:notif] = "Berhasil disimpan"
         redirect_to action: 'index'
       else
         flash[:notif] = "Data tidak tersimpan"
         render 'edit'
       end
   end

   def view
     staf = params[:staf]
     @data = Staf.find(params[:staf_id])
       # @datas = Staf.all
       # staf_id = Staf.find(params[:staf_id].to_i)

   end

   def hapus
     if Staf.find(params[:staf_id].to_i).destroy
       flash[:notif] = "Berhasil dihapus"
       redirect_to action: 'index'
     else
       flash[:notif] = "Data gagal dihapus"
       render 'index'
     end
   end

  private
  def atur_tampilan
    @judul_halaman = "Data Staf"
  end

end
