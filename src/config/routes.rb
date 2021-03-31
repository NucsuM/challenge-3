Rails.application.routes.draw do
  post 'validator/check_date', to: 'validator#check_date'
  post 'validator/check_date/:valid_days', to: 'validator#check_date'
end
