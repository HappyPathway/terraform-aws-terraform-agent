#!/usr/bin/env bash
set -e

# Setup the configuration
hostname=$$(hostname)
ip_address=$$(ifconfig eth0 | grep "inet addr" | awk '{ print substr($2,6) }')

# install required apps
apt-get install -y unzip gpg supervisor

# configure supervisord
cat <<EOF > /etc/supervisor/conf.d/tfc-agent.conf
${agent_config}
EOF 

# restart supervisord
touch /var/run/supervisor.sock
service supervisor restart

# This is the public key from above - one-time step.
cat << EOF > /etc/hashicorp.asc
${hashicorp_public_key}
EOF
gpg --import /etc/hashicorp.asc

# Download the archive and signature files.

curl -Os https://releases.hashicorp.com/tfc-agent/${agent_version}/tfc-agent_${agent_version}_linux_amd64.zip
curl -Os https://releases.hashicorp.com/tfc-agent/${agent_version}/tfc-agent_${agent_version}_SHA256SUMS
curl -Os https://releases.hashicorp.com/tfc-agent/${agent_version}/tfc-agent_${agent_version}_SHA256SUMS.sig

# Verify the signature file is untampered.
gpg --verify tfc-agent_${agent_version}_SHA256SUMS.sig tfc-agent_${agent_version}_SHA256SUMS

# Verify the SHASUM matches the archive.
shasum -a 256 -c tfc-agent_${agent_version}_SHA256SUMS
unzip tfc-agent_${agent_version}_linux_amd64.zip
mv tfc-agent tfc-agent-core /usr/local/bin