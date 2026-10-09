class TopoBeta < Formula
  desc "Destination-neutral infrastructure discovery data plane"
  homepage "https://github.com/Nischoy-ai/topo"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/Nischoy-ai/topo/releases/download/v0.4.6-beta.1/topo_0.4.6-beta.1_darwin_amd64.tar.gz"
      sha256 "b91ef304106b5edfd81dc4371a656f94a2142e705fb56103260e1d5ce483462c"
    end
    on_arm do
      url "https://github.com/Nischoy-ai/topo/releases/download/v0.4.6-beta.1/topo_0.4.6-beta.1_darwin_arm64.tar.gz"
      sha256 "8170e10747ac06d4e11b53be1af45305579b4c7399e92c1e038b1ce7eb6360e2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Nischoy-ai/topo/releases/download/v0.4.6-beta.1/topo_0.4.6-beta.1_linux_amd64.tar.gz"
      sha256 "4cf477608c17e13489d4b4789f64e801452ea9baf44c8ce979d78bb4b0f00086"
    end
    on_arm do
      url "https://github.com/Nischoy-ai/topo/releases/download/v0.4.6-beta.1/topo_0.4.6-beta.1_linux_arm64.tar.gz"
      sha256 "5657ed28624ec5305285116f12e313a90a5f8de9b586f3657cb1d274622dc10d"
    end
  end

  conflicts_with "nischoy-ai/tap/topo", because: "both install the topo executable"

  def install
    bin.install "topo"
    doc.install "LICENSE", "README.md"
  end

  test do
    assert_equal "v0.4.6-beta.1", shell_output("#{bin}/topo version").strip
    observations = shell_output("#{bin}/topo discover local")
    assert_match '"assets":', observations
  end
end
