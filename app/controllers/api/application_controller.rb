class API::ApplicationController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  respond_to :json

  def parse_body_json
    @attributes = JSON.parse(request.body.read)
  end

  def record_not_found
    head :not_found
  end

end

