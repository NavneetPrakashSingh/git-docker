#!/bin/bash
git --version
touch output.txt
echo "Hey there" > output.txt

# Set up our SSH Key
if [ ! -d ~/.ssh ]; then
	echo "SSH Key was not found. Configuring SSH Key."
	mkdir ~/.ssh
	echo -e "${SSH_KEY}" > ~/.ssh/id_rsa
	chmod 700 ~/.ssh
	chmod 600 ~/.ssh/id_rsa

	echo -e "Host *\n    StrictHostKeyChecking no\n    UserKnownHostsFile=/dev/null\n" > ~/.ssh/config
fi

if [ ! -d ~/.git ]; then
	echo "Git repository not found. Initializing repository."
	git init 
	# git remote add ${GIT_ORIGIN} ${GIT_REPO}
    git remote add origin https://a0d6c8c02b2720b50c3b804ca1ae440b619863b2@github.com/NavneetPrakashSingh/git-docker.git
	git fetch
	git checkout -t ${GIT_ORIGIN}/${GIT_BRANCH}
fi

git config user.name "${COMMIT_USER}"
git config user.email "${COMMIT_EMAIL}"
git remote add origin https://bebc55de14810a08965971784b64cb3e94161b1a@github.com/NavneetPrakashSingh/git-docker.git
git add .

git commit -m "Update detected changes"
git push --all -f https://bebc55de14810a08965971784b64cb3e94161b1a@github.com/NavneetPrakashSingh/git-docker.git
# git clone https://github.com/NavneetPrakashSingh/git-docker.git

# git config user.name "NavneetPrakashSingh"
# git config user.email "NavneetPrakashSingh@users.noreply.github.com"
# git add .
# git status
# git commit -am "🧪 Deploy with Navneet-bot-workflow"
# git push
# git push --all -f https://github.com/NavneetPrakashSingh/git-docker.git
# echo "Git pushed successfully"    
# git config user.name "${GITHUB_ACTOR}"
# git config user.email "${GITHUB_ACTOR}@users.noreply.github.com"
# git add .
# git commit -am "🧪 Deploy with ${GITHUB_WORKFLOW}"
# git push --all -f https://${{ secrets.GITHUB_TOKEN }}@github.com/${GITHUB_REPOSITORY}.git
# jekyll --version