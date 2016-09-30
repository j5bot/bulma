#!/bin/bash

sed -i '' -e 's#\.\([a-z][^\:,.)]*\)#[data-am-bulma~="\1"]#g' $1
sed -i '' -e 's#\[data-am-bulma~="sass""\]#.sass"#g' $1