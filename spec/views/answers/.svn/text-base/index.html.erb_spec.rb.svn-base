require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/answers/index.html.erb" do
  include AnswersHelper
  
  before(:each) do
    assigns[:answers] = [
      stub_model(Answer),
      stub_model(Answer)
    ]
  end

  it "should render list of answers" do
    render "/answers/index.html.erb"
  end
end

