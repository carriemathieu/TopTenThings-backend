class ListsSerializer
  include FastJsonapi::ObjectSerializer
  attributes :list_title :list_content :category :user

  # attribute :locations_json do |trip|
  #   trip.locations.map{|loc| {
  #     city: loc.city
  #     city: loc.state,
  #     city: loc.country
  #   }}
end
