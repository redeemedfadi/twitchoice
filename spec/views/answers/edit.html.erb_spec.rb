require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/answers/edit.html.erb" do
  include AnswersHelper
  
  before(:each) do
    assigns[:answer] = @answer = stub_model(Answer,
      :new_record? => false
    )
  end

  it "should render edit form" do
    render "/answers/edit.html.erb"
    
    response.should have_tag("form[action=#{answer_path(@answer)}][method=post]") do
    end
  end
end


