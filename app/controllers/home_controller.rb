class HomeController < ApplicationController
	http_basic_authenticate_with name: "carie", password: "password"

  def home
  end
end
