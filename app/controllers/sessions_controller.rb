class SessionsController < ApplicationController
    skip_before_action :login_required, only: [:new, :create]
    
    def new
    end

    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            log_in(user)
            redirect_to tasks_path, notice: 'Je me suis connecté.'
        else
            flash.now[:danger] = 'Il y a une erreur dans votre adresse e-mail ou votre mot de pass.'
            render :new
        end
    end
    def destroy
        session.delete(:user_id)
        flash[:notice] = 'Je me suis déconnecté.'
        redirect_to new_session_path
    end
end
