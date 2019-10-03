class Article < ApplicationRecord
  belongs_to :user
  validates :title, uniqueness: true, presence: true #Valida que el elemento no esté vacío
  validates :body, presence: true, length: {minimum: 20}
  before_create :set_visits_count
  #validates :username, format: {with: /regex/ }
  def update_visits_count
    self.update(visits_count: self.visits_count + 1)
  end

  private

  def set_visits_count
    self.visits_count ||= 0
  end
end
