# 🎬 Movie Database Analysis (SQL)

> Advanced SQL analysis of movie revenue, ROI, ratings and language-level performance — CTEs, window functions and complex joins.

## The Problem
Using a movies database, surface the trends a studio executive would care about: what drives revenue and ROI, how ratings relate to commercial success, and how performance differs across languages.

## The Data
Movies database (`Schema/`): titles, revenue, budgets, ratings, languages, production details.

## Approach
Analytical SQL throughout — multi-table **JOINs**, **CTEs** for staged logic, and **window functions** (ranking, running totals, partitioned aggregates) to answer:
- Revenue and ROI leaders and laggards
- Rating vs revenue relationship
- Language-level performance comparison
- Production and investment trends

## Key Findings
- [e.g. Highest-ROI segment — fill in]
- [e.g. Rating–revenue relationship — fill in]
- [e.g. Best-performing language segment — fill in]

## Tech Stack
SQL (MySQL/PostgreSQL/SQLite compatible)

## Project Structure
```
├── Schema/                  # Table definitions
└── movies-db-analysis.sql   # Analysis queries
```

## How to Run
Load the schema into your database, then run `movies-db-analysis.sql` section by section.
