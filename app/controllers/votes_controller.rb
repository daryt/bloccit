class VotesController < ApplicationController
<<<<<<< HEAD
     before_action :load_post_and_vote

   def up_vote
    update_vote!(1)
    redirect_to :back
  end

  def down_vote
    update_vote!(-1)
    redirect_to :back
=======
 before_action :load_post_and_vote

end
  def up_vote
    update_vote
    redirect_to
  end

  def down_vote
    update_vote
    redirect_to
>>>>>>> master
  end

  private

<<<<<<< HEAD
   def load_post_and_vote
      @post = Post.find(params[:post_id])
      @vote = @post.votes.where(user_id: current_user.id).first   end

   def update_vote!(new_value)
    if @vote
      authorize @vote, :update?
      @vote.update_attribute(:value, new_value)
    else
      @vote = current_user.votes.build(value: new_value, post: @post)
      authorize @vote, :create?
      @vote.save
    end
  end
=======
  def load_post_and_vote
    @post = Post.find(params[:post_id])
    @vote = @post.votes.where(user_id: current_user.id).first
  end

  def update_vote!(new_value)
    if @vote
      authorize @vote, :update?
      @vote.update_attribute(:value, 1)
    else
      @vote= current_user.votes.build(value: new_value, post: @post)
      authorize @vote, :create?
      @vote.save
    end

    def redirect_to
      # httpp://apidock.com/rails/ActionController/Base/redirect_to
    redirect_to :back
>>>>>>> master
end