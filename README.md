# A Basic Swift Env on Linux

## My Setup:

* ThinkPad X250 (x86_64)
* Ubuntu 16.04
* NVim

## Install
```bash
./install.bash
```

## Test

New console:
```
swift --version
# should see:
# Swift version 3.0 (swift-3.0-PREVIEW-1)
# Target: x86_64-unknown-linux-gnu
```

## Setup projects

```
mkdir aSwiftLibrary
cd aSwiftLib
swift package init --type library
swift build
swift test
```

```
mkdir aSwiftExecutable
cd aSwiftLib
swift package init --type executable
swift build
swift test
```

## To Try:

* (fancy swift vim)[https://github.com/keith/swift.vim]
* (swift lint (OSX only?))[https://github.com/keith/swift.vim]
