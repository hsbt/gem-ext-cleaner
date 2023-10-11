# gem-ext-cleaner

This plugin cleans up the native extension files from unnecessary paths.

```
$ gem install digest
Fetching digest-3.1.1.gem
Building native extensions. This could take a while...
Delete /Users/hsbt/.local/share/gem/gems/digest-3.1.1/lib/digest/bubblebabble.bundle
Delete /Users/hsbt/.local/share/gem/gems/digest-3.1.1/lib/digest/md5.bundle
Delete /Users/hsbt/.local/share/gem/gems/digest-3.1.1/lib/digest/rmd160.bundle
Delete /Users/hsbt/.local/share/gem/gems/digest-3.1.1/lib/digest/sha1.bundle
Delete /Users/hsbt/.local/share/gem/gems/digest-3.1.1/lib/digest/sha2.bundle
Delete /Users/hsbt/.local/share/gem/gems/digest-3.1.1/lib/digest.bundle
Successfully installed digest-3.1.1
1 gem installed
```

## Installation

```
$ gem install gem-ext-cleaner
```

## Background

RubyGems will install native extension files into the following paths:

```
$GEM_HOME/gems/extensions/$arch-$platform-$version/$rubyversion/foo-x.y.z
$GEM_HOME/gems/foo-x.y.z/lib
```

The native extension files in `$GEM_HOME/gems/foo-x.y.z/lib` directory is harmful for us. Because this directory couldn't handle architecture, platform and ruby version. So, We should use native extension files in `$GEM_HOME/gems/extensions/$arch-$platform-$version/$rubyversion/foo-x.y.z` directory, not `$GEM_HOME/gems/foo-x.y.z/lib` directory.

