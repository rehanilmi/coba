class Api::AuthController < ApplicationController

  protect_from_forgery except: [:login, :register, :forgot_password, :change_password, :signout]

  # == Keterangan
  # Digunakan untuk login peserta
  # == URL
  # post /api/peserta/auth/login
  # == Headers
  # -
  # == Params
  # +email+
  # +password+
  # == Response: JSON
  # -
  # == Todo
  # - Kirim email kepada pedagang
  def login
    @email    = params[:orang_email]
    @password = params[:orang_password]

    @jumlah = Orang.where(orang_email: @email).count
    if @jumlah == 0
      render json: {
        status: 'fail',
        msg: 'Silahkan mendaftar terlebih dahulu karena email ini belum terdaftar!'
      }
    else
      @orang = Orang.where(orang_email: @email).first
      @orang_hash = BCrypt::Password.new(@orang.orang_password)

      if @orang_hash == @password
        if @orang.orang_status == 'active'
          render json: {
            status: 'success',
            orang_id: @orang.id,
            token: create_jwt_token(@orang)
          }
        else
          render json: {
            status: 'fail',
            msg: 'Anda belum aktif'
          }
        end
      else
        render json: {
          status: 'fail',
          msg: 'Email dan password tidak match!'
        }
      end
    end
  end

  # == Keterangan
  # Digunakan untuk pendaftaran pedagang
  # == URL
  # post /api/v1/pedagang/auth/register
  # == Headers
  # -
  # == Params
  # +email+
  # +password+
  # +password_confirm+
  # == Response: JSON
  # -
  # == Todo
  # - Kirim email kepada pedagang
  def register

    @email             = params[:orang_email]
    @password          = params[:orang_password]
    @password_confirm  = params[:orang_password_confirm]

    if @password == @password_confirm
      @pass      = BCrypt::Password.create(@password)

      valid_email_regex = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

      if(@email =~ valid_email_regex) == 0
        if Orang.where(orang_email: @email).count == 0
          @ora                 = Orang.new
          @ora.orang_email     = @email
          @ora.orang_password  = @pass
          @ora.orang_status    = 'active'
          if @ora.save
            # # Kirim email kepada pendaftar
            # OrangMailer.welcome_email(@ora).deliver_later

            # # Kirim email kepada super admin
            # #@superadmin_emails = superadmin_emails

            render json: {
              status: 'success',
              msg: "Terimakasih telah mendaftar."
            }
          else
            if @ora.errors
              render json: {
                status: 'fail',
                msg: @ora.errors.to_s
              }
            else
              render json: {
                status: 'fail',
                msg: 'Terjadi kesalahan dalam penyimpanan ke database. Mohon coba 1x lagi. Jika masalah terus muncul, silahkan hubungi Admin.'
              }
            end
          end
        else
          render json: {
            status: 'fail',
            msg: 'Email registered already',
            email: @email
          }
        end
      else
        render json: {
          status: 'fail',
          msg: 'Email is not valid'
        }
      end
    else
      render json: {
        status: 'fail',
        msg: 'Password confirmation is not match'
      }
    end
  end

  # == Keterangan
  # Digunakan untuk membuat token supaya password bisa di reset
  # == URL
  # post /api/v1/pedagang/auth/change_password
  # == Headers
  # -
  # == Params
  # +email+
  # +token+
  # +password+
  # +password_confirm+
  # == Response: JSON
  # -
  # == Todo
  # - Kirim email kepada pedagang
  def change_password
    @email            = params[:orang_email]
    @token            = params[:orang_jwt_token]
    @password         = params[:orang_password]
    @password_confirm = params[:orang_password_confirm]

    if @password == @password_confirm

      @jumlah = Orang.where(orang_email: @email, orang_passrequest_token: @token).count

      if @jumlah == 0
        # token tidak usah dikembalikan kembali
        render json: {
          status: 'fail',
          msg: 'Kombinasi email dan token tidak benar',
          email: @email
        }
      else
        @pass  = BCrypt::Password.create(@password)
        @orang = Orang.where(orang_email: @email, orang_passrequest_token: @token).first
        @orang.orang_password          = @pass
        @orang.orang_passrequest_token = 0
        if @orang.save
          render json: {
            status: 'success',
            msg: 'Password berhasil diganti.<br />Silahkan masuk dengan password yang baru.',
            email: @email
          }
        else
          render json: {
            status: 'fail',
            msg: 'Kesalahan server. Mohon dicoba kembali.',
            email: @email
          }
        end
      end
    else
      render json: {
        status: 'fail',
        msg: 'Password dan konfirmasi password tidak sama'
      }
    end
  end

  # == Keterangan
  # Digunakan untuk membuat token supaya password bisa di reset
  # == URL
  # post /api/v1/pedagang/auth/signout
  # == Headers
  # +JWT+
  # == Params
  # -
  # == Response: JSON
  # -
  # == Todo
  # -
  def signout
    orang = get_orang_from_jwt_token
    if orang
      reset_session
      render json: {
        status: 'success'
      }
    else
      render json: {
        status: 'fail'
      }
    end
  end

  private

  def create_jwt_token(orang_obj)

    #@tokenbig = Digest::SHA1.hexdigest(orang_.id.to_s + "_" + self.orang_email)
    # self.update_column(:orang_tokenbig, @tokenbig)

    hmac_secret = "Ini Password"

    payload = {:orang_email => orang_obj.orang_email, :id => orang_obj.id}
    token = JWT.encode(payload, hmac_secret, 'HS256')
    orang_obj.update_column(:orang_jwt_token, token)

    return token
  end

end
