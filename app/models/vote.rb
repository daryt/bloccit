class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
<<<<<<< HEAD

  validates :value, inclusion: { in: [-1, 1], message: "%{value} is not a valid vote." }

  after_save :update_post

  def up_vote?
    value = 1
  end

  def down_vote?
    value == -1
  end

  private
=======
  
  validates :value, inclusion: { in: [-1, 1], message: "%{value} is not a valid vote." }

after_save :update_post



private
>>>>>>> master

  def update_post
    post.update_rank
  end
<<<<<<< HEAD
=======

  

>>>>>>> master
end
