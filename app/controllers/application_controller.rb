class ApplicationController < ActionController::Base
  helper_method :exist_user

  def exist_user
    @exist_user ||= Candidate.find_by(id: params[:id])
  end

end
