cask "dotnet-sdk-3-1" do
  version "3.1.416"
  sha256 "6db22c5c550de8d35e3968b008418d00a30fadd5419f44ff6810c73a2e98a861"

  url "https://download.visualstudio.microsoft.com/download/pr/2dc016eb-cb93-4bdf-98c0-ee8c84ad26c0/d1a7eb02814ac9e164cb0e23c24d5973/dotnet-sdk-3.1.416-osx-x64.pkg"
  appcast "https://www.microsoft.com/net/download/macos"
  name ".NET Core SDK"
  homepage "https://www.microsoft.com/net/core#macos"

  depends_on macos: ">= :sierra"

  pkg "dotnet-sdk-#{version}-osx-x64.pkg"
  binary "/usr/local/share/dotnet/dotnet"

  uninstall pkgutil: [
              "com.microsoft.dotnet.*",
              "com.microsoft.netstandard.pack.targeting.*",
            ],
            delete:  [
              "/etc/paths.d/dotnet",
              "/etc/paths.d/dotnet-cli-tools",
            ]

  zap trash: [
    "~/.dotnet",
    "~/.nuget",
  ]
end
