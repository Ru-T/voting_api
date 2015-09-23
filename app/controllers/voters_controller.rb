class VotersController < ApplicationController
  #before_filter :restrict_access, only: [:show, :update]

#DELETE INDEX VIEW
  def index
    render json: Voter.all.to_json
  end

  def create
    v = Voter.new(name: params[:name])
    if v.save
      render json: v.to_json
    else
      render json: v.errors
    end
  end

  def show
    voter = Voter.find(params[:id])
    if voter.access_token == params[:access_token]
      render json: voter#.to_json
    else
      render json: "Wrong access token"
    end
  end

  def update
    voter = Voter.find(params[:id])
    voter.name = params[:name] if params[:name]
    voter.party = params[:party] if params[:party]
    # mystery line
    render json: voter.to_json
  end

  #voter.update(name: params[:name], party: params[:party]) # MUST UPDATE BOTH!!!!

    # voter = Voter.find(params[:id])
    # voter.update
    # OR
    # voter = voter.find(params[:name])
    # voter.update!(voter_params)
    # redirect_to voter

  # private def restrict_access
  #   authenticate_or_request_with_http_token do |token, options|
  #     Voter.find_by(auth_token: token)

  #   end
  # end

end
