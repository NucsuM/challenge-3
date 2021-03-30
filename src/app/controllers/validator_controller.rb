class ValidatorController < ApplicationController
  def check_date
    puts ENV['DATE_BEFORE']
    head :no_content, status: :ok
  end
end
