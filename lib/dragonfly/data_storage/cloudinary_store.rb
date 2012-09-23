require 'cloudinary'

module Dragonfly
  module DataStorage
    class CloudinaryStore
      def store(temp_object, opts={})
        result = ::Cloudinary::Uploader.upload(temp_object.path, format: 'jpg')
        result['public_id']
      end

      def retrieve(uid)
        url = ::Cloudinary::Utils.cloudinary_url(uid, format: 'jpg')
        ::Cloudinary::Downloader.download(url)
      end

      def destroy(uid)
        ::Cloudinary::Uploader.destroy(uid)
      end
    end
  end
end
