class Comment < ApplicationRecord
    belongs-to :User
    belongs_to :post
end
