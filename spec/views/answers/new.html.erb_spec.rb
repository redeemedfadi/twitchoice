require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/answers/new.html.erb" do
  include AnswersHelper
  
  before(:each) do
    assigns[:answer] = stub_model(Answer,
      :new_record? => true
    )
  end

  it "should render new form" do
    render "/answers/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", answers_path) do
    end
  end
end


