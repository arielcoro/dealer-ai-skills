# Dealer AI Visibility — Citation Source Taxonomy

The classification of cited sources into buckets, with bucket weights and dealer-leverage notes. SKILL.md and REFERENCE.md reference this file. This taxonomy is designed to be edited as the citation landscape evolves.

For every cited URL in every engine response, the skill classifies the source into one of seven buckets. The bucket determines:
1. How the citation counts in the share calculation.
2. What action the dealer can take to influence future citations of that bucket.
3. Whether the dealer already has presence in that bucket or not.

---

## The seven source buckets

### Bucket 1. OEM (Original Equipment Manufacturer)

Manufacturer-controlled domains and OEM dealer locators.

**Examples:**
- gmc.com, buick.com, chevrolet.com, cadillac.com (and subdomains)
- ford.com, lincoln.com
- stellantis.com, jeep.com, ram.com, dodge.com, chrysler.com
- toyota.com, lexus.com
- honda.com, acura.com
- All OEM dealer locator pages (e.g., gmc.com/find-a-dealer)

**Weight in citation share calculation:** 0.5x
**Why:** OEM citations are valuable but not dealer-controlled. The OEM cites the brand; the specific dealer may or may not benefit. Half-weight reflects that the dealer's leverage is indirect.

**Dealer leverage:**
- Update OEM dealer locator with accurate info
- Apply for OEM recognition programs (GMC Mark of Excellence, Ford President's Award, etc.)
- Submit to OEM press release programs
- Participate in OEM-hosted events

### Bucket 2. Third-party listing platforms

Vehicle marketplaces and inventory aggregators.

**Examples:**
- cars.com, carfax.com, autotrader.com, cargurus.com
- edmunds.com, kbb.com, trucar.com
- carsdirect.com, autolist.com
- inventory feeds and syndicated listings

**Weight in citation share calculation:** 0.8x
**Why:** These platforms are major citation sources for AI engines, especially for model-specific queries. The dealer has direct control over their profile and inventory accuracy. Higher weight than OEM because dealer control is more direct.

**Dealer leverage:**
- Complete and accurate Cars.com, CarGurus, Autotrader, Edmunds profiles
- High-quality inventory photos and descriptions
- Active inventory sync with no stale listings
- Premium tier subscriptions on platforms where the OEM or market makes them worthwhile
- Updated dealer information (hours, brand portfolio, services)

### Bucket 3. Reviews

Customer review platforms.

**Examples:**
- google.com/maps (Google Business Profile reviews)
- dealerrater.com
- cars.com/dealers/reviews
- yelp.com
- bbb.org
- facebook.com (review-focused pages)

**Weight in citation share calculation:** 1.0x
**Why:** Reviews are the highest-leverage citation source for trustworthiness queries. AI engines weight review sentiment and volume heavily. Dealer control is significant through review velocity and response practices. Full weight.

**Dealer leverage:**
- Active review request workflow at sales delivery and service checkout
- Target 5+ fresh reviews per week across Google, DealerRater, Cars.com
- Response to all reviews within 7 days
- Use dealer-customer-sentiment-analyzer skill to monitor sentiment patterns
- Address operational issues that produce negative reviews

### Bucket 4. Forums and communities

User-generated discussion platforms.

**Examples:**
- reddit.com (general and model-specific subreddits like r/GMC, r/F150, r/JeepWrangler, r/Toyota)
- model-specific forums (gm-trucks.com, f150forum.com, mopar-fan-club, gmcsierraownersclub)
- car-domain forums (cars.com forums, autotrader forums)
- Facebook Groups (model-specific or location-specific)

**Weight in citation share calculation:** 0.7x
**Why:** Forum citations are powerful (especially in Perplexity) but harder for dealers to influence directly. Half to two-thirds weight reflects the indirect leverage. Dealers cannot easily get cited in Reddit without authentic community presence.

**Dealer leverage:**
- Authentic forum participation by named staff (NOT astroturfed promotion)
- Sponsoring legitimate community events
- Providing expert content that forums cite organically
- Being a "good local dealer" that gets recommended by community members

Important: forum manipulation (paid posts, fake recommendations) is a violation of platform TOS and produces backlash when discovered. The skill does not recommend forum manipulation.

### Bucket 5. Local press and editorial

Local newspapers, TV stations, regional auto publications.

**Examples:**
- local newspaper websites
- regional TV news websites
- chamber of commerce listings with editorial content
- trade publications (autonews.com, wardsauto.com, digitaldealer.com, dealermagazine.com)
- local business journals

**Weight in citation share calculation:** 1.2x
**Why:** Press citations are high-trust signals for AI engines. They are hard to earn but highly leveraged. Full weight plus a premium reflects the difficulty and value.

**Dealer leverage:**
- Local press outreach for newsworthy events (anniversaries, awards, community involvement, OEM recognition)
- Trade publication contributions (op-eds, expert commentary on industry trends)
- Press release distribution for OEM awards
- PR firm engagement for sustained coverage
- Community involvement that journalists can cover

### Bucket 6. Dealer-owned domains

The dealership's own website and any owned subdomains or content properties.

**Examples:**
- The dealer's primary website
- Subdomain content (blog.[dealer].com, parts.[dealer].com)
- Owned content properties (a dealer-run buyer guide site, a service tips blog)

**Weight in citation share calculation:** 1.5x
**Why:** Dealer-owned citations are the most valuable because they represent owned authority that competitors cannot easily displace. Highest weight reflects the strategic value.

**Dealer leverage:**
- Build conversational, answer-first content using dealer-aeo-content-brief
- Maintain technical foundation using dealer-site-score
- Publish curated llms.txt using dealer-llms-txt-generator
- Optimize VDPs using dealer-vdp-merchandising-review
- Earn citations by being the best source for dealer-specific information (hours, inventory, financing, service)

### Bucket 7. Other

Sources that do not fit the other six buckets.

**Examples:**
- Wikipedia and knowledge graphs
- General reference sites
- Government sources (NHTSA, EPA, IIHS)
- News aggregators
- Social media outside Facebook (Twitter/X, LinkedIn, Instagram captions)

**Weight in citation share calculation:** 0.6x
**Why:** Generally lower leverage. Some sub-types (Wikipedia presence) are highly leveraged if achievable, but most "other" sources represent ambient information rather than dealer-specific authority.

**Dealer leverage:**
- Pursue Wikipedia entry if notability standards are met (most single-rooftop dealers cannot, most large groups can)
- Government source citations are usually automatic (NHTSA safety data, EPA fuel economy) and tied to brand more than dealer
- LinkedIn presence for the dealer principal and key staff
- Limited direct action available

---

## Weight summary

| Bucket | Weight | Why |
| --- | --- | --- |
| 1. OEM | 0.5x | Indirect dealer leverage |
| 2. Third-party listings | 0.8x | Direct dealer control over profile |
| 3. Reviews | 1.0x | Highest-leverage for trust queries |
| 4. Forums and communities | 0.7x | Powerful but hard to influence directly |
| 5. Local press and editorial | 1.2x | High-trust, hard to earn, premium weight |
| 6. Dealer-owned | 1.5x | Strategic value, owned authority |
| 7. Other | 0.6x | Generally lower leverage |

These weights apply when the skill produces weighted citation share calculations. The standard report shows both unweighted (raw count) and weighted (weighted score) views.

---

## Classification rules for ambiguous URLs

Some cited URLs do not clearly fit one bucket. Use these rules:

### Multi-property domains

A domain that hosts multiple types of content (e.g., a local news site that also has a business directory) is classified based on the specific URL path:
- News article URLs → Bucket 5 (Local press and editorial)
- Business directory listing URLs → Bucket 2 (Third-party listings) or Bucket 3 (Reviews) depending on content

### OEM-owned customer-facing properties

Some OEM properties function as listings (e.g., GM Certified Pre-Owned inventory pages). These count as Bucket 1 (OEM) because they are OEM-controlled, even if they look like third-party listings.

### Aggregated review platforms with editorial content

Yelp and BBB sometimes have editorial dealer profiles that include reviews. Classify based on the primary content of the cited URL:
- Review-focused URL → Bucket 3 (Reviews)
- Editorial profile URL → Bucket 3 (still reviews; the editorial component does not move it)

### Dealer's Facebook page

The dealer's Facebook Business Page is dealer-owned in spirit but Meta-controlled in practice. Classify as Bucket 7 (Other) because the dealer's leverage on Facebook citations is limited.

### Dealer's YouTube channel

Same as Facebook: dealer-owned content but Google-controlled platform. Classify as Bucket 7 (Other).

### News articles about the dealer principal

If a news article is about the dealer principal individually (their philanthropy, business profile, etc.) rather than the dealership, it still counts toward the dealer's citation graph if cited by AI engines in dealer-context queries. Classify as Bucket 5 (Local press and editorial).

### Sponsored or paid content

Sponsored content that explicitly says "Sponsored by [Dealer]" gets the same classification as the underlying source, but with a note flagging the paid nature. AI engines may treat sponsored content differently in future updates.

---

## How to update this taxonomy

This file is designed to be edited as the citation landscape evolves.

### When to add a new bucket

If a new category of cited source emerges that doesn't fit any existing bucket and represents a meaningfully different dealer leverage opportunity, add it.

### When to adjust weights

If real-world data shows a bucket's leverage has shifted (e.g., AI engines start weighting third-party listings dramatically less), adjust the weight. Document the rationale in the comment.

### When to update example domains

When new platforms emerge (a new car shopping site, a new review platform, a new forum), add them to the appropriate bucket's example list.

### When to add bucket-specific notes

If a specific platform within a bucket has unusual leverage characteristics, note it. Example: "Within Bucket 2, CarGurus tends to be cited by Perplexity more than other platforms; dealers should prioritize CarGurus profile if Perplexity is a priority engine."

---

## Reporting the source bucket distribution

The skill's report includes a source bucket distribution table:

| Bucket | Dealer citations | Total citations | Dealer share |
| --- | --- | --- | --- |
| OEM | 1 | 5 | 20% |
| Third-party listings | 2 | 8 | 25% |
| Reviews | 1 | 6 | 17% |
| Forums | 0 | 4 | 0% |
| Local press | 1 | 2 | 50% |
| Dealer-owned | 2 | 2 | 100% |
| Other | 0 | 3 | 0% |

This table reveals where the dealer is winning, where they are losing, and where the leverage is.

**Reading this example:**
- Dealer dominates dealer-owned citations (good, but the bucket is small).
- Dealer captures some local press (good, but only 2 citations available).
- Dealer is invisible in forums (gap; community presence work needed).
- Dealer has only 20% OEM share (room to grow via OEM programs).
- Dealer is at 25% third-party listings (room to grow via profile optimization).
- Dealer is at 17% reviews (room to grow via review velocity).

The report's action plan section translates these gaps into specific actions, each referencing the marketplace skill that executes the work.
