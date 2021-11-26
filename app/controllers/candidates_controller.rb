class CandidatesController < ApplicationController

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

  private

  def candidate_params
    params.require(:candidate).permit(:name, :party, :age, :politics)
  end

end