class QuestionsController < ApplicationController
  layout "default"
  caches_action :index, :layout => false

  before_filter :authenticate, {:only => ["new", "create", "delete", "edit"]}

  # GET /questions
  # GET /questions.xml
  def index
    @questions = Question.find(:all, :order => "created_at DESC", :limit => 10)
    @latest_tweet = "welcome to TwitChoice, where you get answers on twitter!"
    # @latest_tweet = Twitter.user(19079862).status.text
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @questions }
    end
  end

  def user_index
    user = User.find_by_username(params[:username])
    if user
      @questions = user.questions
      @latest_tweet = "welcome to TwitChoice, where you get answers on twitter!"
      render :action => "index"
    else
      flash[:notice] = "Sorry, We couldn't find #{params[:username]}"
      redirect_to "index"
    end
  end

  # GET /questions/1
  # GET /questions/1.xml
  def show
    @question = Question.find(params[:id]) if params[:id]
    @question = Question.find_by_sid(params[:sid]) if params[:sid]
    render :text => "Couldn't find that question" and return unless @question

    @num_votes = Vote.votes_for_question(@question.id)
    @total_votes = @question.votes.count
    @vote = Vote.new(:question_id => @question.id)
    @comment = Comment.new

    if logged_in?
      if @question.user_has_voted?(session[:client_id])
        @cannot_vote = true
      end
    else
      @cannot_vote = true
    end

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @question }
    end
  end

  # GET /questions/new
  # GET /questions/new.xml
  def new
    @question = Question.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @question }
    end
  end

  # GET /questions/1/edit
  def edit
    @question = Question.find(params[:id])
  end

  # POST /questions
  # POST /questions.xml
  def create
    params[:question][:user_id] = session[:client_id]
    sid = String.random_alphanumeric
    @question = Question.new(params[:question].merge({:sid => sid}))
    params[:answers].each do |answer|
     @question.answers << Answer.new(:answer => answer) unless answer.blank?
    end

    expire_action :action => "index"

    respond_to do |format|
      if @question.save
        flash[:notice] = 'Question was successfully created.'
        format.html { redirect_to(question_url(@question.sid)) }
        format.xml  { render :xml => @question, :status => :created, :location => @question }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @question.errors, :status => :unprocessable_entity }
      end
    end
  end

  def clear
    expire_action :action => "index"
    flash[:notice] = "Cache cleared"
    redirect_to :action => "index"
  end

  def post
    @question = Question.find_by_sid(params[:sid])
    message = "#{@question.question} #{question_url(@question.sid)}"
    status = current_user.client.update( message )
    flash[:notice] = "Successfully Posted: #{status.text}"
    redirect_to question_url( @question.sid )
  end

  def delete
    @question = Question.find_by_sid_and_user_id(params[:sid],session[:client_id])
    if @question
      if @question.update_attributes(:deleted => true)
        flash[:notice] = "Deleted that question"
        redirect_to :action => "index"
      else
        flash[:notice] = "We couldn't delete that question"
      end
    else
      flash[:notice] = "We couldn't find that question"
    end
  end

  def backfill_sid
    Question.find(:all).each do |q|
      unless q.sid
        q.sid = String.random_alphanumeric
        q.save
      end
    end
  end

  private
  
  def authenticate
    unless logged_in?
      flash[:notice] = "Please Login"
      redirect_to root_url 
    end
  end

end
