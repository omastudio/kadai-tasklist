module SessionsHelper
  # SessionsHelperを始めとした、app/helpers配下のModule群を、ヘルパーモジュールという。
  # ヘルパーモジュールはで定義されたメソッドは、View内のどこからでも呼び出すことができる。
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!current_user
  end
end