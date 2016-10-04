class Bd < Formula
  desc "Quickly go back to a parent directory in Linux"
  homepage "https://github.com/vigneshwaranr/bd"
  head "https://github.com/vigneshwaranr/bd.git"

  depends_on "gnu-sed" => :optional

  def install
    bin.install "bd"
    bash_completion.install "bash_completion.d/bd"
  end

  def caveats; <<-EOS.undent
    Case-insensitive directory matching (using `-si`) requires GNU sed.
    BSD sed on OS X 10.8.2 won't work.
    Use `--with-gnu-sed` or install 'gnu-sed' separately.

    To use bd most conveniently add this to your shell config:
      alias bd='. bd -si'
    EOS
  end

  test do
    system "#{bin}/bd"
  end
end
