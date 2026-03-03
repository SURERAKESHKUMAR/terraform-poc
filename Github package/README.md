#  Package Release Guide (Step-by-Step)

This repository publishes packages to **GitHub Packages** using **GitHub Actions**.

We support two types of packages:

-  **Angular (NPM) → GitHub Packages**
-  **.NET (NuGet) → GitHub Packages**

Packages are published **ONLY when a version tag is created**.

Normal commits to `main` will NOT publish anything.

---

#  PREREQUISITES (Required Before Releasing)

All developers must have:

## 1️. Git Installed
Check:

```bash
git --version
```

## 2️. Node.js Installed (For Angular Projects)

Check:

```bash
node --version
npm --version
```

Recommended: Node 20+

## 3️. .NET SDK Installed (For NuGet Projects)

Check:

```bash
dotnet --version
```

Recommended: .NET 8 SDK

## 4️. Access to the Repository

You must have permission to:
- Push to `main`
- Create and push tags

---

---

#  SECTION 1: Angular (NPM) → GitHub Packages

This section explains how Angular libraries are published.

---

##  What Happens When You Release?

When you create a tag like:

```bash
git tag v1.0.0
git push origin v1.0.0
```

GitHub Actions will:

1. Install dependencies
2. Build Angular library
3. Set version to `1.0.0`
4. Publish package to GitHub Packages

---

##  Folder Structure Requirement

The built package must exist here:

```
dist/common-utilities
```

Inside that folder, `package.json` must contain:

```json
{
  "name": "@surerakeshkumar/common-utilities"
}
```

 Important:
The scope `@surerakeshkumar` must match the GitHub username exactly (lowercase).

---

##  How to Release Angular Package (Step-by-Step)

### Step 1 — Make your code changes

Example:

```bash
git checkout -b feature/update-button
# make changes
git add .
git commit -m "feat: update button component"
git push origin feature/update-button
```

### Step 2 — Merge to main

```bash
git checkout main
git merge feature/update-button
git push origin main
```

 At this point, NOTHING is published yet.

---

### Step 3 — Create Release Tag

Choose version number carefully.

Example:

```bash
git tag v1.0.0
git push origin v1.0.0
```

Now publishing starts automatically.

---

### Step 4 — Verify Package

Go to:

GitHub → Repository → Packages

You should see:

```
@surerakeshkumar/common-utilities
Version: 1.0.0
```

---

##  How Another Project Installs This NPM Package

Create `.npmrc` in consuming project:

```ini
@surerakeshkumar:registry=https://npm.pkg.github.com
```

Install:

```bash
npm install @surerakeshkumar/common-utilities
```

---

---

#  SECTION 2: .NET (NuGet) → GitHub Packages

This section explains how .NET libraries are published.

---

##  What Happens When You Release?

When you create a tag like:

```bash
git tag v2.0.0
git push origin v2.0.0
```

GitHub Actions will:

1. Restore solution
2. Build all projects
3. Pack all class libraries
4. Apply version `2.0.0`
5. Publish to GitHub NuGet Packages

Executable projects (.exe) are skipped automatically.

---

##  Project Requirements

Each library project must be:

- A `.csproj` file
- Not an `<OutputType>Exe</OutputType>`
- A class library

---

##  How to Release NuGet Packages (Step-by-Step)

### Step 1 — Make changes

```bash
git checkout -b feature/add-service
# make changes
git add .
git commit -m "feat: add new service"
git push origin feature/add-service
```

---

### Step 2 — Merge to main

```bash
git checkout main
git merge feature/add-service
git push origin main
```

 Still nothing is published.

---

### Step 3 — Create Version Tag

```bash
git tag v2.0.0
git push origin v2.0.0
```

Now the release workflow runs automatically.

---

### Step 4 — Verify Packages

Go to:

GitHub → Repository → Packages

Example output:

```
MyLibrary.Core     2.0.0
MyLibrary.Common   2.0.0
MyLibrary.Data     2.0.0
```

---

##  How to Install NuGet Package in Another Project

Add GitHub Package source:

```bash
dotnet nuget add source https://nuget.pkg.github.com/SURERAKESHKUMAR/index.json \
  --name github \
  --username YOUR_USERNAME \
  --password YOUR_PERSONAL_ACCESS_TOKEN \
  --store-password-in-clear-text
```

Install package:

```bash
dotnet add package MyLibrary.Core --version 2.0.0
```

---

---

#  VERSIONING RULES (Very Important)

Tag format must be:

```
vMAJOR.MINOR.PATCH
```

Examples:

```
v1.0.0
v1.2.3
v2.0.0
```

Published version = tag version without `v`.

Example:

```
Tag: v2.1.0
Published Version: 2.1.0
```


#  Recommended Development Flow

```
Feature Branch → Merge to Main → Create Tag → Publish
```

Example:

```bash
git checkout -b feature/new-api
# develop

git checkout main
git merge feature/new-api
git push

git tag v1.3.0
git push origin v1.3.0
```

---

#  Authentication Notes

Publishing inside GitHub Actions uses:

```
GITHUB_TOKEN
```

No Personal Access Token is required for publishing.

However, installing packages in another project requires a Personal Access Token.

---

#  Why We Use Tag-Based Release

 - Prevents accidental publishing  
 - Clean version control  
 - Professional release process  
 - Industry best practice  
 - Works for both NPM and NuGet  

---

#  Final Summary

To release ANY package:

1. Merge changes to main  
2. Create tag  
3. Push tag  
4. Verify in GitHub Packages  

Example:

```bash
git tag v3.0.0
git push origin v3.0.0
```

Release complete.
