echo ''
echo '-------------------------------------'
echo 'Start Deploying ......'
echo '-------------------------------------'

mkdir ./_deploy
cd ./_deploy

git init
git config --global push.default matching
git config --global user.email "${GitHubEMail}"
git config --global user.name "${GitHubUser}"
git remote add origin https://${GitHubKEY}@github.com/${GitHubRepo}.git
git pull origin gh-pages
rm -rf ./*
cp -rf ../public/* ../_deploy/

touch CNAME
echo 'chromedl.uk.to' > ./CNAME

git add --all .
git commit -m "Daily check of Chrome offline packages by Travis CI"
git push --quiet --force origin HEAD:gh-pages
