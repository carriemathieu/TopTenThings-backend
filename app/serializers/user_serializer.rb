class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :first_name, :last_name, :email, :lists, :categories
  has_many :lists, serializer: ListsSerializer

  
end
