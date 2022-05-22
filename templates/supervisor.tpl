[program:tfc-agent]
command=/usr/local/bin/tfc-agent
process_name=%(program_name)s
autostart=true
autorestart=true
redirect_stderr=true
environment=TFC_AGENT_TOKEN=${tfc_agent_token},TFC_AGENT_NAME=${tfc_agent_name}