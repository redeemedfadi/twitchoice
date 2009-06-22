class Question < ActiveRecord::Base
  has_many :answers
  has_many :votes
  belongs_to :user
  acts_as_commentable

  def user_has_voted?(user_id)
    votes.detect { |vote| vote.user_id == user_id } != nil
  end
end

