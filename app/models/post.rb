class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  belongs_to :writer
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :name, presence: true
  validates :title, presence: true,
  presence: { with: /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\z/i }
  validates :post, presence: true, length: { maximum: 500 }, length: { minimum: 5 }
  validates :image, presence: true

  mount_uploader :image, ImageUploader


end
