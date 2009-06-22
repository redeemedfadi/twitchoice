require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/questions/new.html.erb" do
  include QuestionsHelper
  
  before(:each) do
    assigns[:question] = stub_model(Question,
      :new_record? => true,
      :user_id => 1,
      :question => "value for question"
    )
  end

  it "should render new form" do
    render "/questions/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", questions_path) do
      with_tag("input#question_user_id[name=?]", "question[user_id]")
      with_tag("input#question_question[name=?]", "question[question]")
    end
  end
end


