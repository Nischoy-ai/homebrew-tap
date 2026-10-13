class TopoBeta < Formula
  desc "Destination-neutral infrastructure discovery data plane"
  homepage "https://github.com/Nischoy-ai/topo"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/Nischoy-ai/topo/releases/download/v0.4.7-beta.1/topo_0.4.7-beta.1_darwin_amd64.tar.gz"
      sha256 "aa59ad75839bd32c3b20273d7b5ff64bdd48ef87e58aa8a8204845cdcc166836"
    end
    on_arm do
      url "https://github.com/Nischoy-ai/topo/releases/download/v0.4.7-beta.1/topo_0.4.7-beta.1_darwin_arm64.tar.gz"
      sha256 "f1e21fec1a0ae4c6b1df8e60c7011c8ab2b9a2b5982fb03559744a8bf0796509"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Nischoy-ai/topo/releases/download/v0.4.7-beta.1/topo_0.4.7-beta.1_linux_amd64.tar.gz"
      sha256 "1f701a97b42f7b7d6fafac65043b7c89e1fcad8671bc81aba4fcad18aa39e1d4"
    end
    on_arm do
      url "https://github.com/Nischoy-ai/topo/releases/download/v0.4.7-beta.1/topo_0.4.7-beta.1_linux_arm64.tar.gz"
      sha256 "4a41bea994d65881fb0831e89321dceaa34e0890f812d9811cd1b8933088c982"
    end
  end

  conflicts_with "nischoy-ai/tap/topo", because: "both install the topo executable"

  def install
    bin.install "topo"
    doc.install "LICENSE", "README.md"
  end

  test do
    assert_equal "v0.4.7-beta.1", shell_output("#{bin}/topo version").strip
    observations = shell_output("#{bin}/topo discover local")
    assert_match '"assets":', observations
  end
end
