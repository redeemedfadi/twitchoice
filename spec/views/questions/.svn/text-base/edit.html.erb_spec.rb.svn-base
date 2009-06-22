require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/questions/edit.html.erb" do
  include QuestionsHelper
  
  before(:each) do
    assigns[:question] = @question = stub_model(Question,
      :new_record? => false,
      :user_id => 1,
      :question => "value for question"
    )
  end

  it "should render edit form" do
    render "/questions/edit.html.erb"
    
    response.should have_tag("form[action=#{question_path(@question)}][method=post]") do
      with_tag('input#question_user_id[name=?]', "question[user_id]")
      with_tag('input#question_question[name=?]', "question[question]")
    end
  end
end


