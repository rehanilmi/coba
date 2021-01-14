class Sp::AuthController < ApplicationController

  layout 'sp_auth'

  protect_from_forgery except: [:daftar_post, :masuk_post]

  def daftar
  end

  def daftar_post
    @nama             = params[:oadm_nama]
    @email            = params[:oadm_email].delete(' ').downcase
    @telepon          = params[:oadm_telepon]
    @password         = params[:oadm_password]
    @password_confirm = params[:password_confirm]
    @pass             = BCrypt::Password.create(@password)

    @hasil_akhir = ''

    if @password == @password_confirm

      if @password.length >= 8

        if Oadm.where(oadm_email: @email).count == 0

          @ora                    = Oadm.new
          @ora.oadm_nama          = @nama
          @ora.oadm_email         = @email
          @ora.oadm_telepon       = @telepon
          @ora.oadm_password      = @pass
          @ora.oadm_status        = 'inactive'
          @ora.save

          flash[:notif] = 'Terimakasih telah mendaftar'

          redirect_to controller: '/sp/auth', action: 'masuk'

        else
          flash[:notif] = 'Email sudah terdaftar. Silahkan login'

          redirect_to controller: '/sp/auth', action: 'masuk'
        end
      else
        flash[:notif] = 'Password at least 8 char'

        render 'daftar'

      end
    else

      flash[:notif] = 'Confirmation is not match'

      render 'daftar'
    end


  end

  def masuk
  end

  def masuk_post
    @email    = params[:oadm_email]
    @password = params[:oadm_password]

    @admin = Oadm.find_by(oadm_email: @email)

    if @admin.blank? # hasilnya false atau true
      flash[:notif] = 'Unregistered email'
      redirect_to action: "masuk"
    else

      @orang = @admin

      if @admin.valid_password?(@password)
        if @orang.oadm_status == 'active'
          session[:oadm_id]    = @orang.id
          session[:oadm_email] = @orang.oadm_email
          session[:admin_tf]   = true

          #TheMailMailer.login_notification(@orang.oadm_email).deliver_later

          redirect_to controller: "/sp/beranda", action: "index"

        else
          flash[:notif] = 'Admin status inatcive'

          redirect_to action: "masuk"
        end
      else
        # redirect_to action: 'signin', info: 'Email dan password tidak match', email: @email
        flash[:notif] = 'Email dan password tidak match'
        redirect_to action: "masuk"
      end
    end
  end
  def signout

          #orang_log_record('get sp/auth/signout', params.to_json)

          reset_session # reset whole session (SEPERTINYA TIDAK BEKERJA DI RAILS 5)

          redirect_to controller: '/sp/auth', action: 'masuk'
      end

  def contoh_json
    render json: Oadm.last

  end
end
