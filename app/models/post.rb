class Post < ApplicationRecord

  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}

  validate :title_is_clickbait

  def title_is_clickbait
    if title
      unless title.match?(/Won't Believe|Secret|Top+[0-9]|Guess/)
        errors.add(:title, "Title must be clickbait")
      end
    end
  end

end
