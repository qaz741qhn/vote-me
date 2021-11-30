class CandidatesController < ApplicationController

  before_action :no_user_redirect, only: [:show]
  before_action :set_candidate, only:[:show, :edit, :update, :destroy]

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
  end

  def edit
  end

  def update
    if @candidate.update(candidate_params)
      flash[:notice] = "#{@candidate.name}'s profile is updated"
      redirect_to(candidate_path)
    else
      flash.now[:alert] = "Invalid information"
      render('edit')
    end
  end

  def destroy
    if @candidate.destroy
      flash[:notice] = "#{@candidate.name}'s profile is deleted"
      redirect_to(candidates_path)
    else
      flash.now[:alert] = "Cannot delete #{@candidate.name}'s profile"
      redirect_to(candidate_path)
    end
  end

  private

  def candidate_params
    params.require(:candidate).permit(:name, :party, :age, :politics)
  end

  def no_user_redirect
    unless exist_user
      flash[:alert] = "User Not Found"
      redirect_to(candidates_path)
    end
  end

  def set_candidate
    @candidate = Candidate.find_by(id: params[:id])
  end

end