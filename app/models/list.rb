class List < ApplicationRecord
    belongs_to :user
    belongs_to :category

    validates :user, :category, :list_content, :list_title, presence: true
end
