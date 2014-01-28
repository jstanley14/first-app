class StaticPagesController < ApplicationController
  attr_accessor :text

  def home
    @text = "home"
  end

  def help
  end
end
