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
  --description "AI solutions for car dealerships: open-source agent skills for AI readiness, dealer SEO/AEO/GEO, BDC, fixed ops, equity mining, reviews, and VDP merchandising." \
  --homepage "https://dealeraiskills.com" \
  --source=. \
  --remote=origin \
  --push
```

Option B. Manual:

1. Go to https://github.com/new
2. Owner: arielcoro
3. Repository name: dealer-ai-skills
4. Description: AI solutions for car dealerships: open-source agent skills for AI readiness, dealer SEO/AEO/GEO, BDC, fixed ops, equity mining, reviews, and VDP merchandising.
5. Public.
6. Do NOT initialize with README, .gitignore, or license (we already have those).
7. Create repository.

Then connect and push:

```bash
git remote add origin git@github.com:arielcoro/dealer-ai-skills.git
git push -u origin main
```

## After the push

Add these GitHub topics on the repo Settings → Topics page to maximize discoverability. GitHub allows up to 20 topics, so keep this list tight:

```
agent-skills
ai-audit
ai-readiness
ai-solutions
answer-engine-optimization
automotive-ai
automotive-retail
bdc
car-dealer
car-dealer-ai
claude-skills
dealer-aeo
dealer-ai
dealer-ai-seo
dealer-geo
dealer-seo
dealership
dealership-ai
franchise-dealer
fixed-ops
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
