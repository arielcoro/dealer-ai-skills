# Push to arielcoro/dealer-ai-skills

Once the GitHub `arielcoro` connector is active in Cowork (or you are signed into git locally as `arielcoro`), run these commands from inside the `dealer-ai-skills` folder.

## One-time setup

```bash
cd ~/DealerAIGuy/dealer-ai-skills

git init
git add .
git commit -m "Initial release: Dealer AI Skills marketplace with Dealer AI Readiness Audit skill"
git branch -M main
```

## Create the GitHub repo

Option A. Via GitHub CLI (recommended, faster):

```bash
gh repo create arielcoro/dealer-ai-skills \
  --public \
  --description "AI agent skills for franchise and independent car dealers. By Ariel Coro of Dealer AI Guy." \
  --homepage "https://dealeraiskills.com" \
  --source=. \
  --remote=origin \
  --push
```

Option B. Manual:

1. Go to https://github.com/new
2. Owner: arielcoro
3. Repository name: dealer-ai-skills
4. Description: AI agent skills for franchise and independent car dealers. By Ariel Coro of Dealer AI Guy.
5. Public.
6. Do NOT initialize with README, .gitignore, or license (we already have those).
7. Create repository.

Then connect and push:

```bash
git remote add origin git@github.com:arielcoro/dealer-ai-skills.git
git push -u origin main
```

## After the push

Add these GitHub topics on the repo Settings → Topics page to maximize discoverability:

```
claude-skills
claude-code
agent-skills
car-dealer
automotive-retail
dealership
ai-audit
ai-readiness
franchise-dealer
fixed-ops
bdc
f-and-i
aeo
answer-engine-optimization
ftc-safeguards
```

Set the website to `https://dealeraiskills.com` on Settings → General.

## Deploy the landing page to dealeraiskills.com

The `landing/index.html` file is ready to deploy.

Recommended path on Cloudflare Pages:

1. Cloudflare dashboard → Pages → Create a project → Connect to Git → select `arielcoro/dealer-ai-skills`.
2. Build settings: leave build command empty, output directory `landing`.
3. Save and deploy.
4. Pages → Custom domains → add `dealeraiskills.com`.

Alternative paths: Vercel, Netlify, or copy `landing/index.html` to your existing static host as `index.html` at the root of `dealeraiskills.com`.

## Test the install path

Once published, the install command in any Claude Code session should work:

```
/plugin marketplace add arielcoro/dealer-ai-skills
/plugin install dealer-ai-readiness-audit@dealer-ai-skills
```

Test in a fresh project to confirm.
