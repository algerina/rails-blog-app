class Like < ApplicationRecord
    belongs_to :User
    belongs_to :post
end
