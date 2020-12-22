module Paperclip
  class Attachment
    def read
      raise Errno::ENOENT, 'File path is nil' unless path
      raise Errno::ENOENT, 'File not exists' unless File.exists?(path)

      File.read(path)
    end

    def base64
      Base64.strict_encode64(read)
    rescue Errno::ENOENT => e
      'not_found'
    end
  end
end
