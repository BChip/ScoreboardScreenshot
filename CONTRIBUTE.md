# Contributing to the Project

Thank you for your interest in contributing to this project! This document outlines how to create a new Git tag and invoke the GitHub Action workflow to publish a release.

## Prerequisites

Before contributing, ensure you have the following:

1. **Git**: Installed and configured on your system.
2. **Access Permissions**: Push access to the repository.
3. **GitHub Account**: An active GitHub account.
4. **Knowledge of Semantic Versioning**: This project uses [Semantic Versioning](https://semver.org/).

## Steps to Contribute

### 1. Clone the Repository

First, clone the repository to your local machine if you haven't already:

```bash
git clone https://github.com/BChip/ScoreboardScreenshot
cd repo-name
```

### 2. Make Your Changes

- Create a new branch for your changes:

  ```bash
  git checkout -b your-feature-branch
  ```

- Implement your changes and commit them:

  ```bash
  git add .
  git commit -m "Add your descriptive commit message"
  ```

### 3. Push Changes to GitHub

Push your changes to GitHub and create a pull request:

```bash
git push origin your-feature-branch
```

Once the pull request is reviewed and merged, proceed to tagging the release.

### 4. Create a Git Tag

GitHub Actions in this project are triggered by Git tags following the `v*.*.*` format (e.g., `v1.0.0`).

#### Steps to Create and Push a Tag:

1. **Checkout the Main Branch:**
   
   Ensure you are on the main branch:

   ```bash
   git checkout main
   git pull origin main
   ```

2. **Create a Tag:**
   
   Use the `git tag` command to create a new version tag:

   ```bash
   git tag vX.Y.Z
   ```

   Replace `X.Y.Z` with the new version number following semantic versioning.

3. **Push the Tag:**

   Push the tag to the remote repository:

   ```bash
   git push origin vX.Y.Z
   ```

### 5. Invoke the GitHub Action

Once the tag is pushed, the GitHub Action workflow is automatically invoked. This workflow:

- Creates a `ScoreboardScreenshot` folder.
- Moves all repository files into that folder.
- Zips the folder.
- Publishes the ZIP archive as a release.

### 6. Verify the Release

Go to the [Releases section](https://github.com/username/repo-name/releases) of the repository to verify that the release was successfully created. The new release should be named after the tag (e.g., `vX.Y.Z`) and contain the zipped folder.

## Troubleshooting

- **Tag Not Triggering Workflow:** Ensure the tag follows the `v*.*.*` format.
- **Errors in GitHub Action:** Check the [Actions tab](https://github.com/username/repo-name/actions) for logs and troubleshoot any issues.

Thank you for your contribution!

