# Github to Gitlab Migration Script

## Usage

Run the script using the following command:

```
bash
./Github2Gitlab.sh <Source-Repo> <Target-Repo> <Personal-Token>
```

## Description

This script facilitates the migration of repositories from GitHub to GitLab.

### Parameters

- `<Source-Repo>`: The URL of the GitHub repository you want to migrate.
- `<Target-Repo>`: The URL of the GitLab repository where the source will be migrated.
- `<Personal-Token>`: Your GitLab personal access token for authentication.

## Example

```
bash
./Github2Gitlab.sh https://github.com/user/source-repo.git https://gitlab.com/user/target-repo.git your_personal_token
```
