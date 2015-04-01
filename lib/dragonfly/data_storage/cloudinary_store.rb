require 'cloudinary'

module Dragonfly
  module DataStorage
    class CloudinaryStore
      def initialize config={}
      end

      def store(temp_object, opts={})
        result = ::Cloudinary::Uploader.upload(temp_object.path, exif: true)
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

      # Store the data AND meta, and return a unique string uid
      def write(content, opts={})
        store(content, opts)
      end

      # Retrieve the data and meta as a 2-item array
      def read(uid)
        data = retrieve(uid)
        resource_data = ::Cloudinary::Api.resource(public_id(uid), exif: true)
        if data
          [
              data,     # can be a String, File, Pathname, Tempfile
              resource_data['exif']      # the same meta Hash that was stored with write
          ]
        else
          nil         # return nil if not found
        end
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
