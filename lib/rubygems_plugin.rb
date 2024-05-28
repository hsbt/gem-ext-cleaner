require "gem-ext-cleaner"

Gem.post_install do |installer|
  GemExtCleaner.clean(installer.spec)
end
