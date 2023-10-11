# このプラグインは gem のインストール後に実行される
# このプラグインは `lib` の下にコピーされた foo.so や foo.bundle などのファイルを削除する

require "rbconfig"
require "pathname"

Gem.post_install do |installer|
  (installer.spec.full_require_paths - [installer.spec.extension_dir]).each do |path|
    Dir.glob(File.join(path, "**/*")).each do |file|
      if Pathname(file).extname == ".#{RbConfig::CONFIG["DLEXT"]}"
        File.delete(file)
        puts "Delete #{file}"
      end
    end
  end
rescue Errno::EPERM
end
