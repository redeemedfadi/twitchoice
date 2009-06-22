require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/votes/index.html.erb" do
  include VotesHelper
  
  before(:each) do
    assigns[:votes] = [
      stub_model(Vote),
      stub_model(Vote)
    ]
  end

  it "should render list of votes" do
    render "/votes/index.html.erb"
  end
end

