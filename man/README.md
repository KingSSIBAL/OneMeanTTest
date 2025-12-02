# Documentation Files - IMPORTANT

## Naming Convention
All .Rd documentation files in this folder follow the project guideline naming convention:
- `for_functionName.Rd` instead of the standard `functionName.Rd`

## Files
- `for_oneMeanTTest.Rd` - Documentation for oneMeanTTest() function
- `for_print.oneMeanTTest.Rd` - Documentation for print.oneMeanTTest() S3 method
- `for_OneMeanDream-package.Rd` - Package-level documentation

## DO NOT run roxygen2::roxygenise()
Running roxygen2 will overwrite these files and revert them to the standard naming convention.

If you need to update documentation:
1. Edit the roxygen2 comments in `R/oneMeanTTest.R` and `R/OneMeanDream-package.R`
2. Manually copy the generated content to these `for_*.Rd` files
3. Rename any newly generated files to follow the `for_` convention
