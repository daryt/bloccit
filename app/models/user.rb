class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
    has_many :posts, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :votes, dependent: :destroy
    has_many :favorites, dependent: :destroy
      mount_uploader :avatar, AvatarUploader

    def role?(base_role)
  role == base_role.to_s
    end

   def favorited(post)
     favorites.where(post_id: post.id).first
   end

   def voted(post)
    votes.where(post_id: post.id).first
  end

  def self.top_rated
    self.select('users.*') #select all attributes of the user
        .select('COUNT(DISTINCT comments.id) AS comments_count') #count the comments made by the user
        .select('COUNT(DISTINCT posts.id) AS posts_count') #count the posts made by the user
        .select('COUNT(DISTINCT comments.id) + COUNT(DISTINCT posts.id) AS rank') #add the comment count to the post count and label the sum as "rank"
        .joins(:posts) # ties the posts table to the users table, via the user_id
        .joins(:comments) #ties the comments table to the users table, via the user_id
        .group('users.id') #instructs the database to group the results so that each user will be returned in a distinct row
        .order('rank DESC') #instructs the database to order the results in descending order, by the rank that we created in this query.  (rank = comment count + post count)
      end


end



