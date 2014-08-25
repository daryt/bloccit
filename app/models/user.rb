class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
<<<<<<< HEAD
    has_many :posts, dependent: :destroy
    has_many :comments, dependent: :destroy
=======
    has_many :posts
    has_many :comments
>>>>>>> master
    has_many :votes, dependent: :destroy
      mount_uploader :avatar, AvatarUploader

    def role?(base_role)
  role == base_role.to_s
end
end



