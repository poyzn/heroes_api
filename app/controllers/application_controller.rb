class ApplicationController < ActionController::Base
  include RescueCallbacks
  
  def raise_not_found!
    respond_to do |format|
      format.html { render plain: "page not found", status: 404 }
      format.json { render json: { error: true, message: "Path not found" }, status: 404 }
    end
  end
  
end
