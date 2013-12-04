class Post < ActiveRecord::Base
  belongs_to :user, -> { where order: :title}
  validates :title, :content, presence: true

  def self.search_by_title(search_term)
    return [] if search_term.blank?
    where("title LIKE ?", "%#{search_term}%") 
  end  

end
