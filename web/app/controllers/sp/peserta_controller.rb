class Sp::PesertaController < ApplicationController

  before_action :login_sp_required
  layout 'sp'
  before_action :atur_tampilan


  def index
    @datas = Pesertaa.all
  end

  def baru
        @data = Pesertaa.new
  end

  def baru_post

      pesertaa = params[:pesertaa]

      Pesertaa.create({
        pesertaa_nama: pesertaa[:pesertaa_nama],
        pesertaa_nik: pesertaa[:pesertaa_nik],
        pesertaa_jk: pesertaa[:pesertaa_jk],
        pesertaa_tempat_lahir: pesertaa[:pesertaa_tempat_lahir],
        pesertaa_tanggal_lahir: pesertaa[:pesertaa_tanggal_lahir],
        pesertaa_telepon: pesertaa[:pesertaa_telepon],
        pesertaa_alamat: pesertaa[:pesertaa_alamat],
        pesertaa_nama_ayah: pesertaa[:pesertaa_nama_ayah],
        pesertaa_nama_ibu: pesertaa[:pesertaa_nama_ibu],
        pesertaa_tinggi: pesertaa[:pesertaa_tinggi],
        pesertaa_bb: pesertaa[:pesertaa_bb],
        pesertaa_photo: pesertaa[:pesertaa_photo],
        pesertaa_gol_darah: pesertaa[:pesertaa_gol_darah],
        pesertaa_jarak_sekolah: pesertaa[:pesertaa_jarak_sekolah],
        pesertaa_jumlah_saudara: pesertaa[:pesertaa_jumlah_saudara],
        pesertaa_bahasa_seharihari: pesertaa[:pesertaa_bahasa_seharihari],
        pesertaa_kategori: pesertaa[:pesertaa_kategori],
        pesertaa_jenjang_pendidikan: pesertaa[:pesertaa_jenjang_pendidikan],
        pesertaa_status: pesertaa[:pesertaa_status]


      })

      redirect_to action: 'index'
   end

   def edit
       pesertaa_id = params[:pesertaa_id].to_i
       @data = Pesertaa.find(pesertaa_id)
   end

   def edit_post
       pesertaa = params[:pesertaa]
       @data = Pesertaa.find(params[:pesertaa_id])
       @data.pesertaa_nama = pesertaa[:pesertaa_nama]
       @data.pesertaa_tanggal_lahir = pesertaa[:pesertaa_tanggal_lahir]
       @data.pesertaa_tempat_lahir = pesertaa[:pesertaa_tempat_lahir]
       @data.pesertaa_nik = pesertaa[:pesertaa_nik]
       @data.pesertaa_jk = pesertaa[:pesertaa_jk]
       @data.pesertaa_alamat = pesertaa[:pesertaa_alamat]
       @data.pesertaa_nama_ayah = pesertaa[:pesertaa_nama_ayah]
       @data.pesertaa_nama_ibu = pesertaa[:pesertaa_nama_ibu]
       @data.pesertaa_telepon = pesertaa[:pesertaa_telepon]
       @data.pesertaa_tinggi = pesertaa[:pesertaa_tinggi]
       @data.pesertaa_bb = pesertaa[:pesertaa_bb]
       @data.pesertaa_gol_darah = pesertaa[:pesertaa_gol_darah]
       @data.pesertaa_jarak_sekolah = pesertaa[:pesertaa_jarak_sekolah]
       @data.pesertaa_jumlah_saudara = pesertaa[:pesertaa_jumlah_saudara]
       @data.pesertaa_bahasa_seharihari = pesertaa[:pesertaa_bahasa_seharihari]
       @data.pesertaa_kategori = pesertaa[:pesertaa_kategori]
       @data.pesertaa_jenjang_pendidikan = pesertaa[:pesertaa_jenjang_pendidikan]
       @data.pesertaa_status = pesertaa[:pesertaa_status]
       @data.pesertaa_photo = pesertaa[:pesertaa_photo]
       if @data.save
         flash[:notif] = "Berhasil disimpan"
         redirect_to action: 'index'
       else
         flash[:notif] = "Data tidak tersimpan"
         render 'edit'
       end
   end

   def view
     pesertaa = params[:pesertaa]
     @data = Pesertaa.find(params[:pesertaa_id])
   end

   def hapus
     if Pesertaa.find(params[:pesertaa_id].to_i).destroy
       flash[:notif] = "Berhasil dihapus"
       redirect_to action: 'index'
     else
       flash[:notif] = "Data gagal dihapus"
       render 'index'
     end
   end

  private
  def atur_tampilan
    @judul_halaman = "Data Pendaftar"
  end


end
