module ActiveStorage
  class Attached
    class One
      def get_path
        ActiveStorage::Blob.service.send(:path_for, key)
      end
    end
  end
end