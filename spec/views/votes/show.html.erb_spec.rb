require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/votes/show.html.erb" do
  include VotesHelper
  before(:each) do
    assigns[:vote] = @vote = stub_model(Vote)
  end

  it "should render attributes in <p>" do
    render "/votes/show.html.erb"
  end
end

