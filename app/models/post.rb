class Post < ActiveRecord::Base
  belongs_to :user, -> { where order: :title}
end
