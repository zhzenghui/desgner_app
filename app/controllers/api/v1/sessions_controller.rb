class Api::V1::SessionsController < Devise::SessionsController
  skip_before_filter :verify_authenticity_token

  respond_to :json

  def create
    warden.authenticate!(:scope => resource_name, :store => false, :recall => "#{controller_path}#failure")     
    current_user.reset_authentication_token!
    render :status => 200,
           :json => { :status => true,
                      :info => t("devise.sessions.signed_in"),
                      :data => { :name  => current_user.name,  :auth_token => current_user.authentication_token } }
  end


  

  def destroy

   
    signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))

    current_user=User.find_by_authentication_token(params[:auth_token])
    current_user.update_column(:authentication_token, nil)

    render :status => 200,
           :json => { :status => true,
                      :info => t("devise.sessions.signed_out"),
                      :data => {} }
  end


  def failure
    render :status => 401,
           :json => { :status => false,
                      :info => "Login Failed",
                      :data => {} }
  end



  def sign_in_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end