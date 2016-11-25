class Gallery < ApplicationRecord
  has_many :gallery_images
  accepts_nested_attributes_for :gallery_images
end
