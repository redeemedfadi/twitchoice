class Vote < ActiveRecord::Base
  belongs_to :question
  has_one :user
  has_one :answer
  validates_presence_of :question_id, :user_id, :answer_id

  def self.votes_for_question(question_id)
    Vote.find(:all, :select => "answer_id, count(1) as num_votes", 
          :conditions => { :question_id => question_id }, :group => :answer_id)
  end
end
