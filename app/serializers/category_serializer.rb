class CategorySerializer
  include FastJsonapi::ObjectSerializer
  attributes :name :user

  # attribute :hometown do |user|
  #   {
  #     city: user.hometown.city,
  #     state: user.hometown.state,
  #     country: user.hometown.country
  #   }
  # end
end
