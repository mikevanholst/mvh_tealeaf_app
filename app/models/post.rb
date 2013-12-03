class Post < ActiveRecord::Base
  belongs_to :user, -> { where order: :title}
  validates :title, :content, presence: true
end
