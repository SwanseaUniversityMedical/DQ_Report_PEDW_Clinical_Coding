# Repository filing system:

TESTING WHETHER PULL WORKS

- Latest version of the Data Quality Report PEDW Clinical Coding report can be found in the main folder of the repo
- Scripts folder contains SQL and RMarkdown scripts and guidance for running the report

# Data Quality Report PEDW Clinical Coding

## GENERATED BY

Victoria Best (full list of names to be added once data brief agreed)

## INTRODUCTION

This report investigates the clinical coding of records within the SAIL hospital admissions dataset (PEDW), by comparing records prior to, and post the start of the COVID-19 pandemic.

Datalag for ICD-10 and OPCS-4 coding is also examined by investigating when a primary ICD-10 or OPCS-4 code was first recorded against an episode. Note the primary ICD-10 and OPCS-4 code is denoted as the first code recorded on the episode i.e. position once or code one, where the first position was NULL we did not check the second position.  This information can be used to establish when coding is suitably complete for use in analysis.


## PURPOSE

The purpose is to understand what impact, if any, COVID-19 has had on clinical coding, as well as any impact data lag, will have upon analysis of PEDW data and resultant findings. The following three hypotheses were investigated using ICD-10 and OPCS-4 codes within the PEDW data

•	Whether all clinical coding has declined since the COVID-19 outbreak

•	Whether clinical coding has declined in only certain coding Chapters

•	Whether clinical coding has declined in only certain Health Boards


## MAIN RESOURCES

Analysis is focussed at the PEDW episode level, linked to the latest versions of the following reports and data sources

• PEDW_EPISODES<br />
• PEDW_SPELLS<br />
• PEDW_DIAG<br />
• PEDW_OPER<br />
• ADDE_DEATHS<br />

• SAILUKHDV.ICD10_CODES_AND_TITLES_AND_METADATA<br />
• SAILUKHDV.OPCS4_CODES_AND_TITLES

• SAIL concept library sensitive ICD-10 codes<br />
• SAIL concept library sensitive OPCS-4 codes


## KEY FINDINGS

See latest version of the report for a summary of the key findings
