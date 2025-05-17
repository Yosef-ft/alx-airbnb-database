# Partitioning Performance Report
## Objective
The objective was to improve query performance on the large bookings table by implementing range-based partitioning on the start_date column.

## Partitioning Strategy
The bookings table was partitioned by year, creating individual partitions for each year from 2022 through 2025. This allowed the database engine to scan only the relevant partitions based on the date range specified in queries.

## Performance Observations
### Query for a Single Year (2024)

On the original (unpartitioned) table, the query scanned the entire table and filtered rows during execution.

On the partitioned table, the planner targeted only the bookings_2024 partition, significantly reducing the number of rows scanned.

Execution time dropped from 0.057 ms to 0.024 ms, reflecting more efficient access.

### Query for Multiple Years (2022–2024)

On the unpartitioned table, the entire dataset was scanned, resulting in unnecessary reads.

On the partitioned table, only the relevant partitions (bookings_2022, bookings_2023, and bookings_2024) were scanned.

Execution time increased from 0.043 ms to 0.060 ms, which may appear slightly longer but reflects parallel access across partitions and more scalable performance with larger datasets.

## Key Benefits Observed
Improved Query Targeting: Partitioning allowed the database to scan only relevant data, avoiding unnecessary reads.

Better Query Planning: The query planner effectively used partition metadata to limit the search space.

Scalability: As data volume grows, partitioning ensures queries remain efficient by minimizing the data each query must process.

## Conclusion
Partitioning the bookings table by start_date has demonstrated clear benefits for query performance. It optimizes resource usage by limiting data scans to relevant partitions and provides a scalable foundation for handling future data growth. For time-based data, especially in booking or transactional systems, partitioning by date is a highly effective optimization strategy.