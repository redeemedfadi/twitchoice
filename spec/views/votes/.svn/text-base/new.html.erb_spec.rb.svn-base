require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/votes/new.html.erb" do
  include VotesHelper
  
  before(:each) do
    assigns[:vote] = stub_model(Vote,
      :new_record? => true
    )
  end

  it "should render new form" do
    render "/votes/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", votes_path) do
    end
  end
end


