-- Finding the top denial reasons by dollar value
SELECT
    Denial_Reason,
    COUNT(*) as Count_of_Denials,
    SUM(Claim_Amount) as Total_Lost_Revenue
FROM healthcare_claims
WHERE Claim_Status = 'Denied'
GROUP BY Denial_Reason
ORDER BY Total_Lost_Revenue DESC;

-- Drill into the specific reason (CO-11) to find the pattern
SELECT
    Payer,
    CPT_Code,
    ICD_10_Code,
    COUNT(*) as Frequency,
    SUM(Claim_Amount) as Revenue_Impact
FROM healthcare_claims
WHERE Denial_Reason = 'CO-11'
GROUP BY Payer, CPT_Code, ICD_10_Code;
