require 'cloudinary'

module Dragonfly
  module DataStorage
    class CloudinaryStore
      def initialize config={}
      end

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

      def url_for(uid, options = {})
        options = {format: ext(uid)}.merge(options)
        ::Cloudinary::Utils.cloudinary_url(public_id(uid), options)
      end

      private

      def public_id(uid)
        File.basename(uid, ext(uid, true))
      end

      def ext(uid, with_dot = false)
        ext = File.extname(uid)
        ext[0] = '' if ext and !with_dot
        ext
      end
    end
  end
end
