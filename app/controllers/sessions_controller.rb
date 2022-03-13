class SessionsController < ApplicationController
  def new
    @login_form = LoginForm.new
  end

  def create
    @login_form = LoginForm.new(login_form_params)

    respond_to do |format|
      if user = @login_form.authenticate
        log_in(user)
        format.html { redirect_to root_path, notice: 'ログインしました' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def login_form_params
    params.require(:login_form).permit(:login_id, :password)
  end
end
