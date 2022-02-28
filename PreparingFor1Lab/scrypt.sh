#!/bin/bash
exec 3>outfile
for var in  $@
do
  echo -n "$var " >&3
  echo -n "$var "
done
echo ""
