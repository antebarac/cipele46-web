# -*- encoding : utf-8 -*-
class BlogImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "system/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :large do
    resize_to_fit(800, 600)
  end  
  
  version :small do
    resize_to_fit(260, 195)
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

end
