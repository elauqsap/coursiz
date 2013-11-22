FactoryGirl.define do
  factory :admin do
    name 'tayquale'
    email 'admin@coursiz.herokuapp.com'
    password 'Admin.coursiz!'
    password_confirmation 'Admin.coursiz!'
    # required if the Devise Confirmable module is used
    # confirmed_at Time.now
  end
end
