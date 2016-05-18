#!/bin/bash

rm -rf sass-attribute-selectors

cp -R sass sass-attribute-selectors

pushd sass-attribute-selectors

grep -r '^\s*\.' -l --null . | xargs -0 sed -i '' 's#\.\([a-z][^\:,.)]*\)#[data-am-bulma~="\1"]#g'

popd

cp bulma.sass bulma-attribute-selectors.sass

sed -i '' 's#sass/#sass-attribute-selectors/#g' bulma-attribute-selectors.sass

