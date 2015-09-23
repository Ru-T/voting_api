class CandidatesController < ApplicationController
  def index
    render json: Candidate.all.to_json
  end

  def show
    id = params[:id]
    render json: Candidate.find(id).to_json
  end

  # def destroy
  #   id = params[:id]
  #   Employee.find(id).destroy
  #   render json: "You are destroyed."
  # end

end
