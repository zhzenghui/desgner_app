class Api::V1::RegistrationsController < Devise::RegistrationsController
  # skip_before_filter :verify_authenticity_token,
  #                    :if => Proc.new { |c| c.request.format == 'application/json' }
  skip_before_filter  :verify_authenticity_token 

  respond_to :json

  def create


    build_resource(sign_up_params)


    if resource.save

      sign_in(resource, :store => false)
      render :status => 200,
             :json => { :status => true,
                      :info => t("devise.registrations.signed_up"),
                      :data => { :user => resource,
                                 :auth_token => current_user.authentication_token } }
    else

      render :status => 200,
              :json => { :status => false,
                        :info => resource.errors.full_messages,
                        :data => {} }
    end

  end
  
  
  private 

  def sign_up_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation)
  end
  
end