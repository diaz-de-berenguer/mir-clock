class HomeController < ApplicationController
	http_basic_authenticate_with name: "Carie", password: "2506"

  def home
  end
end
