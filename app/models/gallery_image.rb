class GalleryImage < ApplicationRecord
  belongs_to :gallery
  mount_uploader :image, ImageUploader
  validates :image, file_size: { less_than_or_equal_to: 500.kilobytes,
                                 message: 'Billedet skal fylde mindre end 500KB'  } 

end
