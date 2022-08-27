class PhotoUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process resize_to_fit: [800, 800]
  
  version :thumb do
    process resize_to_fit: [100, 100]
  end

  def extension_allowlist
    %w(jpg jpeg gif png)
  end
end
