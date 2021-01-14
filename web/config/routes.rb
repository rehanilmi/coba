Rails.application.routes.draw do

root to: 'public#main'
  namespace :public do
    get 'public/main'
    resource :auth2 do
      collection do

        get   'auth2/daftar'
        post  'auth2/daftar'     => 'auth2#daftar_post'
        get   'auth2/masuk'
        post  'auth2/masuk'      => 'auth2#masuk_post'
        get  'auth2/signout'

      end
    end

  resource :public do
    collection do
      get 'public/guru'      => 'public#guru'
      get 'public/staff'     => 'public#staff'
      get 'public/pengumuman'=> 'public#pengumuman'
      get 'public/vdm'       => 'public#vdm'
      get 'public/test'      => 'public#test'
      end
    end

  resource :peserta do
    collection do
      get    'index'             => 'peserta#index'
      get    'edit/:pesertaa_id'  => 'peserta#edit'
      patch  'edit/:pesertaa_id'  => 'peserta#edit_post'
    end
  end

  resource :pesan do
    collection do
      get    'baru'            => 'pesan#baru'
      post   'baru'            => 'pesan#baru_post'
    end
  end

  resource :guru do
    collection do
      get 'latest_guru' => 'guru#latest_guru'
    end
  end
end
  # devise_for :users, controllers:{sessions:'users/sessions'}
  # devise_scope :user do
  #   get 'sign_in',to:'devise/sessions#new'
  #   get '/users/sign_out'=>'devise/sessions#destroy'
  # end


  namespace :api do

    resource :auth do
      collection do
            post 'login'                    => 'auth#login'
            post 'register'                 => 'auth#register'
            post 'forgot_password'          => 'auth#forgot_password'
            post 'change_password'          => 'auth#change_password'
            post 'signout'
      end
    end

    resource :peserta do
      collection do
        get 'index'          => 'peserta#index'
        post'baru'           => 'peserta#baru'
        post 'edit'          => 'peserta#edit'
        delete 'hapus'       => 'peserta#hapus'
      end
    end

    resource :guru do
      collection do
        get 'index'          => 'guru#index'
      end
    end

    resource :staf do
      collection do
        get 'index'          => 'staf#index'
      end
    end

    resource :info do
      collection do
        get 'index'          => 'info#index'
      end
    end

    resource :pesan do
      collection do
        post 'baru'          => 'pesan#baru'
      end
    end

  end

  namespace :sp do

    get   'auth/daftar'
    post  'auth/daftar'     => 'auth#daftar_post'
    get   'auth/masuk'
    post  'auth/masuk'      => 'auth#masuk_post'
    get  'auth/signout'

    get 'beranda'          => 'beranda#index'

    resource :peserta do
      collection do
        get    '/'                 => 'peserta#index'
        get    'baru'              => 'peserta#baru'
        post   'baru'              => 'peserta#baru_post'
        get    'edit/:pesertaa_id'  => 'peserta#edit'
        patch  'edit/:pesertaa_id'  => 'peserta#edit_post'
        get    'hapus/:pesertaa_id' => 'peserta#hapus'
        delete 'hapus/:pesertaa_id' => 'peserta#hapus'
        get    'view'              => 'peserta#view'
      end
    end

    resource :info do
      collection do
        get    '/'               => 'info#index'
        get    'baru'            => 'info#baru'
        post   'baru'            => 'info#baru_post'
        get    'edit/:info_id'  => 'info#edit'
        patch  'edit/:info_id'  => 'info#edit_post'
        get    'hapus/:info_id' => 'info#hapus'
        delete 'hapus/:info_id' => 'info#hapus'
        get    'view'           => 'info#view'
      end
    end

    resource :guru do
      collection do
        get    '/'               => 'guru#index'
        get    'baru'            => 'guru#baru'
        post   'baru'            => 'guru#baru_post'
        get    'edit/:guru_id'   => 'guru#edit'
        patch  'edit/:guru_id'   => 'guru#edit_post'
        get    'hapus/:guru_id'  => 'guru#hapus'
        delete 'hapus/:guru_id'  => 'guru#hapus'
        get    'view'            => 'guru#view'
      end
    end

    resource :staf do
      collection do
        get    '/'               => 'staf#index'
        get    'baru'            => 'staf#baru'
        post   'baru'            => 'staf#baru_post'
        get    'edit/:staf_id'   => 'staf#edit'
        patch  'edit/:staf_id'   => 'staf#edit_post'
        get    'hapus/:staf_id'  => 'staf#hapus'
        delete 'hapus/:staf_id'  => 'staf#hapus'
        get    'view'            => 'staf#view'
      end
    end

    resource :pesan do
      collection do
        get    '/'               => 'pesan#index'
        get    'baru'            => 'pesan#baru'
        post   'baru'            => 'pesan#baru_post'
        get    'edit/:pesan_id'  => 'pesan#edit'
        patch  'edit/:pesan_id'  => 'pesan#edit_post'
        get    'hapus/:pesan_id' => 'pesan#hapus'
        delete 'hapus/:pesan_id' => 'pesan#hapus'
        get    'view'            => 'pesan#view'
      end
    end

    resource :user do
      collection do
        get    '/'               => 'user#index'

      end
    end

  end
end
