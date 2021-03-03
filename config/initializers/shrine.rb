require "cloudinary"
require "shrine/storage/cloudinary"

cloudinary_secret = Rails.application.credentials.CLOUDINARY

Cloudinary.config(
  cloud_name: cloudinary_secret[:NAME],
  api_key:    cloudinary_secret[:API_KEY],
  api_secret: cloudinary_secret[:API_SECRET],
)
Shrine.storages = {
  cache: Shrine::Storage::Cloudinary.new(prefix: "twitter_redesign/cache"), # for direct uploads
  store: Shrine::Storage::Cloudinary.new(prefix: "twitter_redesign"),
}

Shrine.plugin :activerecord           # loads Active Record integration
Shrine.plugin :cached_attachment_data # enables retaining cached file across form redisplays
Shrine.plugin :restore_cached_data    # extracts metadata for assigned cached files
Shrine.plugin :validation_helpers
Shrine.plugin :validation
