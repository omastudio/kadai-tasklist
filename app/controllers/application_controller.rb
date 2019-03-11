class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  # include Moduleを使うことで、そのModule内のメソッドを当該クラスのインスタンスメソッドとして定義することができる。
  # Module内のメソッドをそのクラスにコピペするようなものである。
  # これをインスタンスメソッドのMix-inという。
  include SessionsHelper

  # クラスメソッドのMix-inもある
  # extend SessionsHelper

  private

  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
  
  def counts(user)
    @count_tasks = user.tasks.count
  end
end