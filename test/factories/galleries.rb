FactoryGirl.define do
  factory :gallery do
    id 999
    name "Gallery 1"
    description "Det her er mine droner som flyver over verden"

    after :create do |gal_img|
      factory :gallery_images do
        gallery_id 999
        image { Rack::Test::UploadedFile.new(
          File.join(Rails.root, 'app', 'assets', 'images', 'default.png')) }
      end
    end
  end

end
