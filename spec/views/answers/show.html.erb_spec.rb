require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/answers/show.html.erb" do
  include AnswersHelper
  before(:each) do
    assigns[:answer] = @answer = stub_model(Answer)
  end

  it "should render attributes in <p>" do
    render "/answers/show.html.erb"
  end
end

