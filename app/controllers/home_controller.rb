class HomeController < ApplicationController
	http_basic_authenticate_with name: ENV["c_username"], password: ENV["c_password"]

  def home
  end
end
