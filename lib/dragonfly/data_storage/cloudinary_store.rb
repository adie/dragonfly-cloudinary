require 'cloudinary'

module Dragonfly
  module DataStorage
    class CloudinaryStore
      def store(temp_object, opts={})
        result = ::Cloudinary::Uploader.upload(temp_object.path)
        result['public_id'] + "." + result['format']
      end

      def retrieve(uid)
        url = ::Cloudinary::Utils.cloudinary_url public_id(uid), format: ext(uid) || 'jpg'
        ::Cloudinary::Downloader.download(url)
      end

      def destroy(uid)
        ::Cloudinary::Uploader.destroy public_id(uid)
      end

      private

      def public_id(uid)
        File.basename(uid, ext(uid))
      end

      def ext(uid)
        File.extname(uid)
      end
    end
  end
end
