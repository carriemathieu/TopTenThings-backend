class ListsSerializer
  include FastJsonapi::ObjectSerializer
  attributes :list_title :list_content :category :user
end
