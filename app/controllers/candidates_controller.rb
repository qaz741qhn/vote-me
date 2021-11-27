class CandidatesController < ApplicationController

  before_action :no_user_redirect, only: [:show]

  def index
    @candidates = Candidate.all
  end

  def new
    @candidate = Candidate.new
  end

  def create
    @candidate = Candidate.new(candidate_params)
    if @candidate.save
      flash[:notice] = "Welcome to my app #{@candidate.name}"
      redirect_to(candidates_path)
    else
      flash.now[:alert] = "Invalid information"
      render('new')
    end
  end

  def show
    @candidate = Candidate.find_by(id: params[:id])
  end

  private

  def candidate_params
    params.require(:candidate).permit(:name, :party, :age, :politics)
  end

  def no_user_redirect
    unless exist_user
      flash[:alert] = "No user found"
      redirect_to(candidates_path)
    end
  end

end