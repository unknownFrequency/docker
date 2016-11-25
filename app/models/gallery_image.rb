class GalleryImage < ApplicationRecord
  mount_uploader :image, ImageUploader
end
