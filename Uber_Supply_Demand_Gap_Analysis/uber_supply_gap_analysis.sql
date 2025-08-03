USE Uber_DB;
GO
-- View all columns and rows from the Uber supply-demand Gap table 
Select * from dbo.Uber_Supply_Demand_Gap

-- Display column info, data types, and constraints for the 'Uber_Supply_Demand_Gap' table
EXEC sp_help 'Uber_Supply_Demand_Gap';

/* 
===================================================
INSIGHT 1: Total Demand & Supply
===================================================
This insight gives a high-level view of service availability:
- Total ride demand (requests)
- Supply fulfilled = Completed + Cancelled (driver accepted)
- Supply gap = No Supply (no driver available)
- Helps assess how well Uber meets rider demand
purpose: 
- To measure Uber’s ability to meet demand and identify gaps in supply.
- This helps prioritize operational improvements and driver allocation.
*/
SELECT 
  COUNT(*) AS Total_Requests,
  COUNT(CASE WHEN Trip_Status = 'Completed' THEN 1 END) AS Completed_Trips,
  COUNT(CASE WHEN Trip_Status = 'Cancelled' THEN 1 END) AS Cancelled_Trips,
  COUNT(CASE WHEN Trip_Status = 'No Supply' THEN 1 END) AS No_Supply_Trips,

  -- Supply was available (Completed + Cancelled)
  ROUND(
    100.0 * COUNT(CASE WHEN Trip_Status IN ('Completed', 'Cancelled') THEN 1 END) / COUNT(*),
    2
  ) AS Supply_Availability_Percentage,

  -- Supply Gap (No Supply)
  ROUND(
    100.0 * COUNT(CASE WHEN Trip_Status = 'No Supply' THEN 1 END) / COUNT(*),
    2
  ) AS Supply_Gap_Percentage

FROM Uber_Supply_Demand_Gap;

/* 
===================================================
INSIGHT 2: Trip Status Distribution 
===================================================
Breaks down total ride requests by status:
- Completed = Successfully served
- Cancelled = Rider/Driver cancelled after matching
- No Supply = No driver was available
- Useful for understanding overall service patterns
Purpose:
- To analyze how ride requests were handled across the system and identify where most demand drops occur.
*/

WITH Total AS (
  SELECT COUNT(*) AS Total_Requests 
  FROM Uber_Supply_Demand_Gap
)
SELECT 
  usd.Trip_Status,
  COUNT(*) AS Status_Count,
  CONCAT(
    ROUND(100.0 * COUNT(*) / t.Total_Requests, 2),
    '%'
  ) AS Status_Percentage
FROM Uber_Supply_Demand_Gap usd
CROSS JOIN Total t
GROUP BY usd.Trip_Status, t.Total_Requests;

/* 
===================================================
INSIGHT 3: Peak Problem Hour (Supply Gaps)
===================================================
Identifies the hour with the highest number of unmet ride requests:
- Supply Gaps = Requests with no driver available ('No Supply')
- Cancels are excluded since they had initial supply
- Highlights critical hours where demand was high but supply was absent
Purpose:
- To uncover peak hours with severe supply shortages, enabling Uber to adjust driver availability during high-demand time slots.
*/
SELECT TOP 1
  [Request_Hour],

  -- Count of total requests in that hour
  COUNT(*) AS Total_Requests,

  -- Completed + Cancelled (i.e., supply was available)
  COUNT(CASE WHEN Trip_Status IN ('Completed', 'Cancelled') THEN 1 END) AS Supply,

  -- No Supply = Total - Supplied
  COUNT(*) - COUNT(CASE WHEN Trip_Status IN ('Completed', 'Cancelled') THEN 1 END) AS Supply_Gaps

FROM Uber_Supply_Demand_Gap
GROUP BY [Request_Hour]
ORDER BY Supply_Gaps DESC;  -- Hour with max supply issues

/* 
===================================================
INSIGHT 4: Problematic Days by Supply Gaps
===================================================
Highlights the days with the highest number of unmet ride requests:
- Supply Gaps = Requests with no driver available (Trip_Status = 'No Supply')
- Cancelled trips are excluded (supply was initially available)
- Useful for identifying specific dates where supply failed to meet demand
purpose:
- To detect trends in daily supply failures, helping Uber plan better driver allocation and incentives on high-gap days.
*/

SELECT 
  [Request_Day],
  
  COUNT(*) AS Total_Requests,  -- Total number of requests on the day

  COUNT(CASE WHEN Trip_Status = 'No Supply' THEN 1 END) AS Supply_Gaps 

FROM Uber_Supply_Demand_Gap
GROUP BY [Request_Day]
ORDER BY Supply_Gaps DESC;  -- Days with most no-supply issues at the top

/* 
===================================================
INSIGHT 5: Cancellations by Pickup Point
===================================================
This query identifies which pickup points (City, Airport, Suburb)
have the highest number of cancelled trips.

- Total_Requests: Total ride requests from each pickup location
- Cancelled_Trips: Number of those requests that were cancelled
- Cancellation_Rate: % of cancellations from each pickup point

Purpose:
To pinpoint problematic pickup zones and take actions such as:
- Improving driver availability or wait times
- Investigating cancellation reasons in hotspots
- Enhancing customer experience in those areas
*/
SELECT 
  [Pickup_Point],
  COUNT(*) AS Total_Requests,
  COUNT(CASE WHEN Trip_Status = 'Cancelled' THEN 1 END) AS Cancelled_Trips,
  CONCAT(
    ROUND(100.0 * COUNT(CASE WHEN Trip_Status = 'Cancelled' THEN 1 END) / COUNT(*), 2), '%'
  ) AS Cancellation_Rate
FROM Uber_Supply_Demand_Gap
GROUP BY [Pickup_Point]
ORDER BY Cancelled_Trips DESC;

/*
================================================================
INSIGHT 6: High vs Low Performing Drivers
================================================================
Evaluates individual driver performance based on trip outcomes:
- Tracks total assigned trips, completions, and cancellations
- Calculates completion and cancellation rates per driver
- Classifies drivers into: High, Average, or Low performers
- Enables targeted training, rewards, or corrective actions
purpose:
- To assess driver reliability and quality of service, supporting performance-based decisions like incentives or retraining.
*/
SELECT 
  Driver_ID,

  COUNT(*) AS Total_Assigned_Trips,

  COUNT(CASE WHEN Trip_Status = 'Completed' THEN 1 END) AS Completed_Trips,
  COUNT(CASE WHEN Trip_Status = 'Cancelled' THEN 1 END) AS Cancelled_Trips,

  -- Completion Rate
  ROUND(
    100.0 * COUNT(CASE WHEN Trip_Status = 'Completed' THEN 1 END) / COUNT(*),
    2
  ) AS Completion_Rate_Percentage,

  -- Cancellation Rate
  ROUND(
    100.0 * COUNT(CASE WHEN Trip_Status = 'Cancelled' THEN 1 END) / COUNT(*),
    2
  ) AS Cancellation_Rate_Percentage,

  -- Performance Level based on Completion Rate
  CASE 
    WHEN (100.0 * COUNT(CASE WHEN Trip_Status = 'Completed' THEN 1 END) / COUNT(*)) >= 90 THEN 'High Performing'
    WHEN (100.0 * COUNT(CASE WHEN Trip_Status = 'Completed' THEN 1 END) / COUNT(*)) BETWEEN 70 AND 89.99 THEN 'Average'
    ELSE 'Low Performing'
  END AS Performance_Level

FROM Uber_Supply_Demand_Gap
WHERE Driver_ID IS NOT NULL
GROUP BY Driver_ID
ORDER BY Completion_Rate_Percentage DESC;

/*
===================================================
OVERALL INSIGHTS
===================================================
- Supply gaps peaked by over 60% during critical hours, indicating major driver shortage.
- Cancellations from the Airport pickup point accounted for over 40% of total cancelled trips.
- 30% of drivers had completion rates below 70%, impacting overall service reliability.

*/


/*
===================================================
 Conclusion
===================================================
 - To close the supply-demand gap, Uber must boost driver availability during peak hours and reduce cancellations in high-impact zones like the Airport.
*/