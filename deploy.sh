#! /bin/sh
set -e

PUBLIC_FOLDER=public/
DOMAIN=everythingstays.com
RECORD=@

if git diff-index --quiet HEAD --; then

  echo "Generating readme.html"
  marked -i readme.md -o readme.html.tmp

  echo "Generating index.html"
  cp template.html $PUBLIC_FOLDER/index.html
  perl -pe 's/MARKDOWN/`cat readme.html.tmp`/ge' -i $PUBLIC_FOLDER/index.html
  perl -pe 's/VERSION/`git rev-parse HEAD`/ge' -i $PUBLIC_FOLDER/index.html

  HASH=$(ipfs add -r $PUBLIC_FOLDER | tail -n 1 | cut -d ' ' -f 2)
  ADDRESS=/ipfs/$HASH

  echo "Deploying $ADDRESS"
  dnslink-deploy -d $DOMAIN -r $RECORD -p $ADDRESS

  echo "Removing built files"
  rm readme.html.tmp

  echo ""
  echo "## Deployed $ADDRESS to $DOMAIN"
  echo ""
else
  echo "GIT Repository is dirty, please commit any changed files"
fi
