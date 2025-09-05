#! /bin/bash

set +x # Enable debugging
# This script lists all collaborators for a given GitHub repository.

# Script helper - prints usage information
function printUsage() {
    echo "Usage: $0 <repo>";
    echo "Example: $0 Automation_Scripts";
    echo "Lists all collaborators for the specified GitHub repository.";
}

# Check if correct number of arguments provided
if [ "$#" -ne 1 ]; then
    printUsage
    exit 1
fi

# Load environment variables from .env file (if present)
if [ -f .env ]; then
    export $(grep -v '^#' .env | xargs)
fi
# Get arguments
OWNER=$USERNAME
REPO=$1

# List collaborators (requires GitHub CLI or API call)
echo "Listing collaborators for $OWNER/$REPO..."
# Add your GitHub API call or gh CLI command here
# Example: gh api repos/$OWNER/$REPO/collaborators

# Use -s for silent mode and -L to follow redirects
curl -s -L \
    -H "Accept: application/vnd.github+json"  \
    -H "Authorization: Bearer $API_TOKEN_KEY" \
    -H "X-GitHub-Api-Version: 2022-11-28"  \
    https://api.github.com/repos/$OWNER/$REPO/collaborators | 
    jq -r '.[] | select(.role_name == "admin") | .login' # -r for raw output, filter for admin role