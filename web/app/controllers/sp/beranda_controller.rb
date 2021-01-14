class Sp::BerandaController < ApplicationController
  before_action :login_sp_required
  layout 'sp'


  def index
      @judul_halaman = "Dashboard"
  end

  def tampilan

  end
end
