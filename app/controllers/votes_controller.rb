class VotesController < ApplicationController

  def create
    vote = Vote.new(voter_id: params[:voter_id], candidate_id: params[:candidate_id])
    if vote.save
      if Voter.find_by(voter_id).access_token == params[:access_token]
        render json: vote.to_json
      else
        render json: "Wrong access token"
      end
    else
      render json: vote.errors
    end
  end

  def destroy
    id = params[:id]
    Vote.find(id).destroy
    render json: "This vote has been destroyed."
  end

  def index
    render json: Vote.all.to_json
    # render json: Vote.as_json(only: [:candidate_id])
  end

end
