module QuestionsHelper

  def user_image(user)
    if user
      "<img src='#{user.profile_image_url}' alt='#{user}'/>"
    else
      "<img src='/images/tc_bigger.png' alt='No User'/>"
    end
  end
  
  def number_of_votes_for_answer(votes,answer_id)
    votes.detect do |answer|
      if answer.attributes["answer_id"] == answer_id
        return answer.attributes["num_votes"].to_i
      end
    end
    0
  end

end
