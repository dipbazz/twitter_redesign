class ImageUploader < Shrine
  Attacher.validate do
    validate_mime_type %w[image/jpeg image/png image/webp]
    validate_max_size 2 * 1024 * 1024
  end
end
