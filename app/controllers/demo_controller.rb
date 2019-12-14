class DemoController < ApplicationController
  layout 'application'
  before_action :confirm_logged_in
  def index
  end

  def hello
  end
end
