class ApplicationController < ActionController::Base
  http_basic_authenticate_with name: "root", password: "dongdong"
  protect_from_forgery with: :exception
end
