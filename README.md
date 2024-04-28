# joshuanianji.github.io

Code for my personal website.

## Run Locally

Open up the project in a devcontainer, then run the following

```
pnpm i
pnpm dev
```

## Environment Variables

Create a `.env` file in the root of the project with the following variables

```env
# optional
GITHUB_TOKEN=your_github_pat
```

### `GITHUB_TOKEN`

My website uses the GitHub API to fetch data in my public repos. Sometimes in development you might hit the rate limit, so you can create a personal access token and add it to the `.env` file to increase the rate limit. 

A PAT with read-only access to public repos is sufficient.
