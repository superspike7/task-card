class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!
  layout 'static'

  def home; end
end
