class User < ActiveRecord::Base
  STATE = {
    # 软删除
    :deleted => -1,
    # 正常
    :normal => 1,
    # 屏蔽
    :blocked => 2,
  }



  
  has_many :posts
  has_many :albums

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         

   def skip_confirmation!
     self.confirmed_at = Time.now
   end       
   


   def get_user_for(token)
   	 
   	 user = User.find_by_authentication_token(token)
   	 if user
   	 	reture true
   	 end
   	 false


   end
   
   def reset_authentication_token!
   	 self.authentication_token = Digest::MD5::hexdigest(Array.new(10){rand(1024).to_s(36)}.join+DateTime.now.to_s())
   	 self.save()
   end 


	def user_params
	  params.require(:user).permit(:avatar, :email, :password)
	end

end
