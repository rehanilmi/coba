class Sp::GuruController < ApplicationController
  before_action :login_sp_required
  layout 'sp'
  before_action :atur_tampilan


  def index
    @datas = Guru.all
  end

  def baru
        @data = Guru.new
  end

  def baru_post

      guru = params[:guru]

      Guru.create({
        guru_nama: guru[:guru_nama],
        guru_tgl_lahir: guru[:guru_tgl_lahir],
        guru_tempat_lahir: guru[:guru_tempat_lahir],
        guru_jk: guru[:guru_jk],
        guru_status_kepegawaian: guru[:guru_status_kepegawaian],
        guru_telepon: guru[:guru_telepon],
        guru_alamat: guru[:guru_alamat],
        guru_email: guru[:guru_email],
        guru_bidang_studi: guru[:guru_bidang_studi],
        guru_pendidikan_terakhir: guru[:guru_pendidikan_terakhir],
        guru_agama: guru[:guru_agama],
        guru_status_perkawinan: guru[:guru_status_perkawinan],
        guru_photo: guru[:guru_photo]


      })

      redirect_to action: 'index'
   end

   def edit
       guru_id = params[:guru_id].to_i
       @data = Guru.find(guru_id)
   end

   def edit_post
       guru = params[:guru]
       @data = Guru.find(params[:guru_id])
       @data.guru_nama = guru[:guru_nama]
       @data.guru_tgl_lahir = guru[:guru_tgl_lahir]
       @data.guru_tempat_lahir = guru[:guru_tempat_lahir]
       @data.guru_jk = guru[:guru_jk]
       @data.guru_alamat = guru[:guru_alamat]
       @data.guru_status_kepegawaian = guru[:guru_status_kepegawaian]
       @data.guru_telepon = guru[:guru_telepon]
       @data.guru_email = guru[:guru_email]
       @data.guru_bidang_studi = guru[:guru_bidang_studi]
       @data.guru_pendidikan_terakhir = guru[:guru_pendidikan_terakhir]
       @data.guru_agama = guru[:guru_agama]
       @data.guru_status_perkawinan = guru[:guru_status_perkawinan]
       @data.guru_photo = guru[:guru_photo]
       if @data.save
         flash[:notif] = "Berhasil disimpan"
         redirect_to action: 'index'
       else
         flash[:notif] = "Data tidak tersimpan"
         render 'edit'
       end
   end

   def view
     guru = params[:guru]
     @data = Guru.find(params[:guru_id])
   end

   def hapus
     if Guru.find(params[:guru_id].to_i).destroy
       flash[:notif] = "Berhasil dihapus"
       redirect_to action: 'index'
     else
       flash[:notif] = "Data gagal dihapus"
       render 'index'
     end
   end

  private
  def atur_tampilan
    @judul_halaman = "Data Guru"
  end

end
