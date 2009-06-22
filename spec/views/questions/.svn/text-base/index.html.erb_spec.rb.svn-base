require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/questions/index.html.erb" do
  include QuestionsHelper
  
  before(:each) do
    assigns[:questions] = [
      stub_model(Question,
        :user_id => 1,
        :question => "value for question"
      ),
      stub_model(Question,
        :user_id => 1,
        :question => "value for question"
      )
    ]
  end

  it "should render list of questions" do
    render "/questions/index.html.erb"
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", "value for question".to_s, 2)
  end
end

