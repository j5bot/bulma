#!/bin/bash

rm -rf src/sass-attribute-selectors dist/sass-attribute-selectors

cp -R src/sass src/sass-attribute-selectors

pushd src/sass-attribute-selectors

grep -r '^\s*\.' -l --null . | xargs -0 sed -i '' 's#\.\([a-z][^\:,.)]*\)#[data-am-bulma~="\1"]#g'
grep -r '^\s*&\.' -l --null . | xargs -0 sed -i '' 's#\.\([a-z][^\:,.)]*\)#[data-am-bulma~="\1"]#g'

grep -r '\[data-am-bulma~="sass""\]' -l --null . | xargs -0 sed -i '' 's#\[data-am-bulma~="sass""\]#.sass"#g'

popd

cp src/bulma.sass src/bulma-attribute-selectors.sass

sed -i '' 's#sass/#sass-attribute-selectors/#g' src/bulma-attribute-selectors.sass

echo '/* @import "bulma.sass" */' >> src/bulma-attribute-selectors.sass

echo 'Recreated bulma-attribute-selectors.sass at: ' $(date) >> logs/bulma-attribute-selectors.log

mkdir -p dist/bulma/css
mkdir -p dist/bulma-attribute-selectors/css
