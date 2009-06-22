require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/votes/edit.html.erb" do
  include VotesHelper
  
  before(:each) do
    assigns[:vote] = @vote = stub_model(Vote,
      :new_record? => false
    )
  end

  it "should render edit form" do
    render "/votes/edit.html.erb"
    
    response.should have_tag("form[action=#{vote_path(@vote)}][method=post]") do
    end
  end
end


