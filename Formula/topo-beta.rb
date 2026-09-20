class TopoBeta < Formula
  desc "Destination-neutral infrastructure discovery data plane"
  homepage "https://github.com/Nischoy-ai/topo"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/Nischoy-ai/topo/releases/download/v0.1.0-beta.1/topo_0.1.0-beta.1_darwin_amd64.tar.gz"
      sha256 "e296abb6820f678108dcd82681288849729ed20068a493708ca09e43b2504634"
    end
    on_arm do
      url "https://github.com/Nischoy-ai/topo/releases/download/v0.1.0-beta.1/topo_0.1.0-beta.1_darwin_arm64.tar.gz"
      sha256 "da224c9a50838034363bbe4f5c9e0f324264ce7442823ef9352356e036610c49"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Nischoy-ai/topo/releases/download/v0.1.0-beta.1/topo_0.1.0-beta.1_linux_amd64.tar.gz"
      sha256 "9157d2c0f49d3b4040dcaad6c7ae1570dc4b7cc62c17331044c4c96f5349f320"
    end
    on_arm do
      url "https://github.com/Nischoy-ai/topo/releases/download/v0.1.0-beta.1/topo_0.1.0-beta.1_linux_arm64.tar.gz"
      sha256 "a806a9f4200d8da972bd44f33c2f577095a4a0c764f646c85e2b88e1177cd63d"
    end
  end

  conflicts_with "nischoy-ai/tap/topo", because: "both install the topo executable"

  def install
    bin.install "topo"
    doc.install "LICENSE", "README.md"
  end

  test do
    assert_equal "v0.1.0-beta.1", shell_output("#{bin}/topo version").strip
    observations = shell_output("#{bin}/topo discover local")
    assert_match '"assets":', observations
  end
end
