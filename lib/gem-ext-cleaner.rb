require "rbconfig"
require "pathname"

module GemExtCleaner
  def self.clean(spec)
    (spec.full_require_paths - [spec.extension_dir]).each do |path|
      begin
        Dir.glob(File.join(path, "**/*")).each do |file|
          # Prevent deleting files in versioned directories like google-protobuf, nokogiri
          next if file.sub(/#{spec.full_gem_path}\//, "") =~ /(\d+\.\d+\/)/

          if Pathname(file).extname == ".#{RbConfig::CONFIG["DLEXT"]}"
            File.delete(file)
            puts "Delete #{file}"
          end
        end
      rescue Errno::EPERM
      end
    end
  end
end
