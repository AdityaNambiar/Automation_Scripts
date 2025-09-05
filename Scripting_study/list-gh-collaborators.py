# Author: GitHub Copilot
import os
import sys
import requests  # This is what I wanted to highlight - Shell Scripts use curl, Python uses requests      

def load_env(env_path=".env"):
    """Load environment variables from a .env file."""
    if not os.path.isfile(env_path):
        return
    with open(env_path) as f:
        for line in f:
            line = line.strip()
            if not line or line.startswith("#"):
                continue
            if "=" in line:
                key, value = line.split("=", 1)
                os.environ[key.strip()] = value.strip()

def print_usage():
    print(f"Usage: {sys.argv[0]} <repo>")
    print(f"Example: {sys.argv[0]} Automation_Scripts")
    print("Lists all collaborators for the specified GitHub repository.")

def main():
    if len(sys.argv) != 2:
        print_usage()
        sys.exit(1)

    load_env()
    owner = os.environ.get("USERNAME")
    repo = sys.argv[1]
    token = os.environ.get("API_TOKEN_KEY")

    if not owner or not token:
        print("USERNAME or API_TOKEN_KEY not set in .env")
        sys.exit(1)

    url = f"https://api.github.com/repos/{owner}/{repo}/collaborators"
    headers = {
        "Accept": "application/vnd.github+json",
        "Authorization": f"Bearer {token}",
        "X-GitHub-Api-Version": "2022-11-28"
    }

    print(f"Listing collaborators for {owner}/{repo}...")
    response = requests.get(url, headers=headers)
    if response.status_code != 200:
        print(f"Error: {response.status_code} {response.text}")
        sys.exit(1)

    for user in response.json():
        if user.get("role_name") == "admin":
            print(user.get("login"))

if __name__ == "__main__":
    main()