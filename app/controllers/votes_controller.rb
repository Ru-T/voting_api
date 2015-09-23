class VotesController < ApplicationController
  # before_filter :restrict_access, only: [:create, :destroy]

  def index
    render json: Vote.all.to_json
  end

  def create
    vote = Vote.new(voter_id: params[:voter_id], candidate_id: params[:candidate_id])
    if vote.save
      render json: vote.to_json
    else
      render json: vote.errors
    end
  end

  def destroy
    id = params[:id]
    Vote.find(id).destroy
    render json: "This vote has been destroyed."
  end

  def update
    vote = Vote.find(params[:id])
    vote.update(candidate_id: params[:candidate_id])
    render json: vote.to_json
  end


  # private def restrict_access
  #   authenticate_or_request_with_http_token do |token, options|
  #     Vote.exists? (access_token: token)
  #   end
  # end

end
