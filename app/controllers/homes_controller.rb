class HomesController < ApplicationController

  def top
    respond_to do |format|
      format.html
      format.json { @task = current_user.notifications.where(checked: false)}
    end
  end

end
