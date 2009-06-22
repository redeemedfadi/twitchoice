class CommentController < ApplicationController
  # POST /questions
  # POST /questions.xml
  def create
    params[:comment][:user_id] = session[:client_id]
    @question = Question.find_by_sid(params[:sid])
    comment = Comment.new(params[:comment])
    @question.comments << comment
    @question.save

    respond_to do |format|
      if @question.save
        flash[:notice] = 'Thanks for the comment!'
        format.html { redirect_to(question_url(@question.sid)) }
        format.xml  { render :xml => @question, :location => @question }
      else
        flash[:notice] = "We couldn't create that comment"
        format.html { render :action => "new" }
        format.xml  { render :xml => @question.errors, :status => :unprocessable_entity }
      end
    end
  end
end
