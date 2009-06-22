class VotesController < ApplicationController

  # POST /votes
  # POST /votes.xml
  def create
    @vote = Vote.new(params[:vote].merge({:user_id => session[:client_id]}))
    @question = Question.find_by_id(@vote.question_id)
    respond_to do |format|
      if @vote.save
        flash[:notice] = 'Vote was successfully created.'
        format.html { redirect_to(question_path(@question.sid)) }
        format.xml  { render :xml => @vote, :status => :created, :location => @vote }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @vote.errors, :status => :unprocessable_entity }
      end
    end
  end

  def voters
    @votes = Vote.find_all_by_answer_id(params[:answer_id])
  end

end
