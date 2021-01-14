class Public::GuruController < ApplicationController
layout 'frontend'
  def latest_guru
    @gurus = Guru.latest
  end

end
