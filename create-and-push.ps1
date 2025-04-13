# Clear the screen for clarity
Clear-Host

# Define variables
$localRepoPath = "C:\Users\jared\socrates-ai"
$repoName = "socrates-ai"
$gitHubRepoURL = "https://github.com/jaredgrogan/$repoName.git"

# Change to the local repository directory
cd $localRepoPath

# Configure Git identity if not already set
if (-not (git config --get user.email)) {
    git config --global user.email "jared.grogan@gmail.com"
    Write-Host "Configured Git email as jared.grogan@gmail.com." -ForegroundColor Green
} else {
    Write-Host "Git email is already configured." -ForegroundColor Cyan
}

if (-not (git config --get user.name)) {
    git config --global user.name "Jared Grogan"
    Write-Host "Configured Git user name as Jared Grogan." -ForegroundColor Green
} else {
    Write-Host "Git user name is already configured." -ForegroundColor Cyan
}

# Initialize a Git repository if one doesn't exist already
if (-not (Test-Path ".git")) {
    git init
    Write-Host "Initialized a new Git repository." -ForegroundColor Green
} else {
    Write-Host "Git repository already exists." -ForegroundColor Cyan
}

# Stage and commit all files
git add .
git commit -m "Initial commit of Socrates AI"
Write-Host "Staged and committed all files." -ForegroundColor Green

# Create new GitHub repository using GitHub CLI and push the current code
# This command will create the repository, set the current directory as the source,
# add a remote named 'origin' and push your commits.
gh repo create $repoName --public --source=. --remote=origin --push
Write-Host "Created GitHub repository '$repoName' and pushed code." -ForegroundColor Green
