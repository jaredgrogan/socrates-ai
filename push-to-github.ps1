# Clear the screen for clarity
Clear-Host

# Define the GitHub repository URL
$repoUrl = "https://github.com/jaredgrogan/socrates-ai.git"

# Change to the local repository directory (ensure you are in the correct folder)
cd "C:\Users\jared\socrates-ai"

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

# Add all files in the directory to the staging area
git add .
Write-Host "Added all files to the staging area." -ForegroundColor Green

# Commit the files with a commit message
$commitMessage = "Initial commit of Socrates AI"
git commit -m $commitMessage
Write-Host "Committed changes with message: '$commitMessage'" -ForegroundColor Green

# Check if the remote named "origin" exists; if not, add it
$remoteExists = git remote | Select-String -Pattern "origin"
if (-not $remoteExists) {
    git remote add origin $repoUrl
    Write-Host "Added remote 'origin' with URL: $repoUrl" -ForegroundColor Green
} else {
    Write-Host "Remote 'origin' already exists." -ForegroundColor Cyan
}

# Push the commit to the 'main' branch on GitHub and set it as the upstream branch
git push -u origin main
Write-Host "Pushed changes to the GitHub repository." -ForegroundColor Green
