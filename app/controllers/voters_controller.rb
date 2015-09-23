class VotersController < ApplicationController

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
      if voter.save
        render json: voter.to_json
      else
        render json: "This did not successfully update."
      end
  end

  # private def restrict_access
  #   authenticate_or_request_with_http_token do |token, options|
  #     token = Voter.find(params[:access_token])
  #   end
  # end

end
