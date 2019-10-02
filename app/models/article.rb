class Article < ApplicationRecord
  validates :title, uniqueness: true, presence: true #Valida que el elemento no esté vacío
  validates :body, presence: true, length: {minimum: 20}
  #validates :username, format: {with: /regex/ }
end
