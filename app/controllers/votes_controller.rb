class VotesController < ApplicationController

  def create
    vote = Vote.new
    vote.candidate_id = params[:candidate_id]
    vote.voter_id = params[:voter_id]
    if vote.save
      render json: vote.to_json
    else
      render json: vote.errors
    end
  end

  def destroy
    voter = Vote.find_by(access_token: params[:access_token])
    voter.vote.destroy
    render json: "This vote has been destroyed."
  end

  def index
    results = Vote.group(:candidate_id).count
    render json: results
  end

end
