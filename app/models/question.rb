class Question < ActiveRecord::Base
  has_many :answers
  has_many :votes
  belongs_to :user
  acts_as_commentable

  validates_presence_of :question
  validates_length_of :answers, :minimum => 2, :message => "- there must be at least two"

  def user_has_voted?(user_id)
    votes.detect { |vote| vote.user_id == user_id } != nil
  end
end

