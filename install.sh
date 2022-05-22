
# Download the archive and signature files.
curl -Os https://releases.hashicorp.com/tfc-agent/1.2.2/tfc-agent_1.2.2_linux_amd64.zip
curl -Os https://releases.hashicorp.com/tfc-agent/1.2.2/tfc-agent_1.2.2_SHA256SUMS
curl -Os https://releases.hashicorp.com/tfc-agent/1.2.2/tfc-agent_1.2.2_SHA256SUMS.sig

# Verify the signature file is untampered.
gpg --verify tfc-agent_1.2.2_SHA256SUMS.sig tfc-agent_1.2.2_SHA256SUMS || exit 1

# Verify the SHASUM matches the archive.
echo "Running shasum..."
shasum -a 256 -c tfc-agent_1.2.2_SHA256SUMS
echo "Unzipping package..."
unzip tfc-agent_1.2.2_linux_amd64.zip

mv tfc-agent tfc-agent-cor /usr/local/bin
