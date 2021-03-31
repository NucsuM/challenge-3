require 'date'
require 'active_support/core_ext'

class ValidatorController < ApplicationController
  def check_date
    date_to_validate = convert_unix_to_date(params['datum'])
    days_limit = params['valid_days'].to_i
    date_fix = Date.parse(ENV['DATE_FIX'])

    lower_date_limit = date_fix - days_limit.days
    upper_date_limit = date_fix + days_limit.days

    puts "Das eingegebene Datum ist nur gültig im Bereich von #{lower_date_limit.strftime("%d.%m.%Y")} "\
         "bis #{upper_date_limit.strftime("%d.%m.%Y")}." unless 
         date_inside_range?(lower_date_limit, upper_date_limit, date_to_validate)

    head :no_content, status: :ok
  end

  private

  def convert_unix_to_date(target_date)
    timestamp = Time.at(target_date)
    Date.parse(timestamp.to_s)
  end

  def date_inside_range?(lower_date, upper_date, date_to_validate)
    (lower_date..upper_date).cover?(date_to_validate)
  end
end
