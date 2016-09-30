#!/bin/bash

echo "processing: $1"

sed -i '' 's#\.\([a-z][^\:,.)]*\)#[data-am-bulma~="\1"]#g' "$1"
sed -i '' 's#\[data-am-bulma~="sass""\]#.sass"#g' "$1"