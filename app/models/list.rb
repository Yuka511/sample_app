class List < ApplicationRecord
  has_one_attached :image #【アプリケーション6章】

  #以下追加【アプリケーション8章】
  validates :title, presence: true
  validates :body, presence: true
  validates :image, presence: true
end
