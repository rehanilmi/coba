class Public::Auth2Controller < ApplicationController


      protect_from_forgery except: [:daftar_post, :masuk_post]

      def daftar
      end

      def daftar_post
        # @email            = params[:pesertaa_email].delete(' ').downcase
        @email            = params[:pesertaa_email]
        @password         = params[:pesertaa_password]
        @password_confirm = params[:password_confirm]
        @pass             = BCrypt::Password.create(@password)

        @hasil_akhir = ''

        if @password == @password_confirm

          if @password.length >= 8

            if Pesertaa.where(pesertaa_email: @email).count == 0

              @ora                    = Pesertaa.new
              @ora.pesertaa_email         = @email
              @ora.pesertaa_password      = @pass
              # @ora.orang_status        = 'inactive'
              @ora.save

              flash[:notif] = 'Terimakasih telah mendaftar'

              redirect_to controller: '/public/auth2', action: 'masuk'

            else
              flash[:notif] = 'Email sudah terdaftar. Silahkan login'

              redirect_to controller: '/public/auth2', action: 'masuk'
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
        @email = params[:pesertaa_email]
        @password = params[:pesertaa_password]

        @peserta = Pesertaa.find_by(pesertaa_email: @email)

        if @peserta.blank? # hasilnya false atau true
          flash[:notif] = 'Unregistered email'
          redirect_to action: "masuk"
        else

          @orang = @peserta

          if @peserta.valid_password?(@password)
            # if @orang.orang_status == ''
               session[:pesertaa_id]    = @orang.id
               session[:pesertaa_email] = @orang.pesertaa_email
               session[:pesertaa_tf]   = true
            #   #TheMailMailer.login_notification(@orang.oadm_email).deliver_later

              redirect_to controller: "public/peserta", action: "edit"

            # else
            #   flash[:notif] = 'peserta ditolak'
            #
            #   redirect_to action: "masuk"
            # end
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

              redirect_to controller: '/public/auth2', action: 'masuk'
          end
end
