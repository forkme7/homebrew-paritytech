require 'formula'

class Parity < Formula
  homepage 'https://github.com/paritytech/parity'
  version '1.8.11'
  url 'https://d1h4xl4cr1h0mo.cloudfront.net/v1.8.11/x86_64-apple-darwin/parity'
  sha256 "e52e16b11f25cc8900349df04b0ce9b22bb85372029e67608153ae5ea9e02af4"

  devel do
    version '1.9.4'
    url 'https://d1h4xl4cr1h0mo.cloudfront.net/v1.9.4/x86_64-apple-darwin/parity'
    sha256 "95ee40205278776f03918178e554e67c36177bfa53bb09a5c22fe5ca08dc1c36"
  end

  head do
    version '1.10.0'
    url 'https://d1h4xl4cr1h0mo.cloudfront.net/nightly/x86_64-apple-darwin/parity'
  end

  def install
    bin.install "parity"
  end

  test do
    system "#{bin}/parity", "--version"
  end

  plist_options :manual => "parity"

  def plist; <<~EOS
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
      <dict>
        <key>Label</key>
        <string>#{plist_name}</string>
        <key>RunAtLoad</key>
        <true/>
        <key>KeepAlive</key>
        <true/>
        <key>ThrottleInterval</key>
        <integer>300</integer>
        <key>ProgramArguments</key>
        <array>
          <string>#{prefix}/bin/parity</string>
        </array>
        <key>WorkingDirectory</key>
        <string>#{HOMEBREW_PREFIX}</string>
      </dict>
    </plist>
    EOS
  end
end
