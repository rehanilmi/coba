class Sp::UserController < ApplicationController

  before_action :login_sp_required
  layout 'sp'

  def index
    @datas = Oadm.all
  end

end
