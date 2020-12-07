class ErrorsController < ApplicationController
  def not_found
    render status: 404, template: "errors/not_found"
  end

  def unacceptable
    render status: 404, template: "errors/not_found"
  end

  def internal_error
    render status: 404, template: "errors/not_found"
  end
end
