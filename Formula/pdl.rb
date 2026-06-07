# frozen_string_literal: true

# Algraf formula for Homebrew
class Pdl < Formula
  desc 'Pipeline Data Language'
  homepage 'https://github.com/williamcotton/pdl'
  url 'https://github.com/williamcotton/pdl.git', tag: 'v0.40.0'
  license 'MIT'
  head 'https://github.com/williamcotton/pdl.git', branch: 'main'

  depends_on 'rust' => :build

  def install
    system 'cargo', 'install', *std_cargo_args(path: 'crates/pdl-cli')
  end

  test do
    assert_match 'pdl', shell_output("#{bin}/pdl --version")
  end
end
