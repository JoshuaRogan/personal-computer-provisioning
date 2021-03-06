#!/bin/bash
set -x

# see https://github.com/Wikia/chef-repo/tree/master/data_bags/hosts
hosts=(
  'dev-wk-cdn-s1'
  'dev-wk-cdn-s2'
  'dev-wk-cdn-s3'
  'dev-wk-cdn-s4'
  'dev-wk-cdn-s5'
  'dev-wk-cdn-s6'
  'wk-cdn-f1'
  'wk-cdn-f2'
  'wk-cdn-f3'
  'wk-cdn-f4'
  'wk-cdn-f5'
  'wk-cdn-f6'
  'wk-cdn-r1'
  'wk-cdn-r2'
  'wk-cdn-r3'
  'wk-cdn-r4'
  'wk-cdn-r5'
  'wk-cdn-r6'
  'wk-cdn-r7'
  'wk-cdn-r8'
  'wk-cdn-r9'
  'wk-cdn-s1'
  'wk-cdn-s2'
  'wk-cdn-s3'
  'wk-cdn-s5'
  'wk-cdn-s6'
  'wk-cdn-s7'
  'wk-cdn-s8'
  'wk-cdn-s9'
)

for i in ${!hosts[@]};
do
  echo ${hosts[$i]}
  curl -X PURGE $1 -x ${hosts[$i]}:80
done
