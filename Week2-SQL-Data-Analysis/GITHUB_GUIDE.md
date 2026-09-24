# GitHub Push Guide

## 1. Extract the folder
Put it here:
C:\Users\Sunil\Desktop\Week2-SQL-Data-Analysis

## 2. Open PowerShell
```powershell
cd "C:\Users\Sunil\Desktop\Week2-SQL-Data-Analysis"
```

## 3. Initialize Git
```powershell
git init
git branch -M main
git add .
git commit -m "Add Week 2 SQL data analysis assignment"
```

## 4. Create a GitHub repository
Repository name:
Week2-SQL-Data-Analysis

Do not initialize it with README.

## 5. Connect and push
```powershell
git remote add origin https://github.com/sunil502/Week2-SQL-Data-Analysis.git
git push -u origin main
```

## If remote origin already exists
```powershell
git remote set-url origin https://github.com/sunil502/Week2-SQL-Data-Analysis.git
git push -u origin main
```

## Final GitHub structure
```text
Week2-SQL-Data-Analysis/
├── README.md
├── schema.sql
├── sample_data.sql
├── queries.sql
└── GITHUB_GUIDE.md
```
