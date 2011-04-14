class API::ApplicationController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  respond_to :json

  before_filter :ensure_json

  private

  def parse_body_json
    @attributes = JSON.parse(request.body.read)
  end

  def record_not_found
    head :not_found
  end

  def ensure_json
    unless request.format.json?
      head :not_acceptable
    end
  end

end

