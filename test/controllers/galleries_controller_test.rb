require 'test_helper'

class GalleriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gallery = Gallery.create!(
      name: "Test Gallery",
      description: "Dette er beskrivelsen af mit drone gallery"
    )
    @gallery_images = @gallery.gallery_images.create!(image: 'default.png')
  end


  #test "should create gallery" do
    #assert_difference('Gallery.count') do
      #post galleries_url, params: { gallery: 
                                    #{ description: @gallery.description, 
                                      #name: @gallery.name } }
    #end

    #assert_redirected_to gallery_url(Gallery.last)
  #end

  #test "should create gallery with gallery_images" do
    #assert_difference('Gallery.count', +1)  do
      #post galleries_url, params: { 
        #gallery: { 
          #description: @gallery.description, 
          #name: @gallery.name 
        #} }
    #end

    #@gallery.gallery_images.create!(image: 'default.png')
    #assert_response 302 
    #assert_redirected_to gallery_url(Gallery.last)
  #end

  #test "should show gallery" do
    #get gallery_url(@gallery.id)
    #assert_response :success
  #end

  #test "should get edit" do
    #get edit_gallery_url(@gallery.id)
    #assert_response :success
  #end

  #test "should update gallery" do
    #patch gallery_url(@gallery), params: { 
      #gallery: { 
        #id: @gallery.id,
        #description: @gallery.description, 
        #name: @gallery.name } 
    #}
    #assert_redirected_to gallery_url(@gallery)
  #end

  #test "should destroy gallery" do
    #assert_difference('Gallery.count', -1) do
      #delete gallery_url(@gallery.id)
    #end

    #assert_redirected_to galleries_url
  #end
end
