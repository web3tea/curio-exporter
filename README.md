# curio-exporter

Exporter for transforming Curio cluster data into Prometheus metrics format, enabling real-time monitoring and visualization of key Curio metrics in dashboarding tools like Grafana. This tool helps bridge the gap between Curio's internal data structures and modern observability platforms.

All collectors can be found in the [collectors](/collectors) directory.
## Usage

```shell
git clone https://github.com/strahe/curio-exporter.git

cd curio-exporter

cp sql_exporter.yml.example sql_exporter.yml

# Edit sql_exporter.yml and update {data_source_name} with your database connection string
vim sql_exporter.yml

docker compose up -d

# Access http://localhost:9399/metrics for metrics
# Access http://localhost:9090 for prometheus
```

## Available Metrics

### Alerts
- `curio_alerts_count` (gauge) - Total number of alerts

### Harmony Machines
- `curio_machines_count` (gauge) - Total number of machines (by status: online/offline/unschedulable)
- `curio_machines_total_cpu` (gauge) - Total CPU resources (by status)
- `curio_machines_total_gpu` (gauge) - Total GPU resources (by status)
- `curio_machines_total_ram` (gauge) - Total RAM resources (by status)

### Harmony Tasks
- `curio_harmony_running_tasks_count` (gauge) - Total number of running tasks (by task_name)
- `curio_harmony_task_error_rate` (gauge) - Error rate of harmony tasks (failures / total executions)
- `curio_harmony_task_latency_seconds` (gauge) - Average delay time from task posting to execution

### IPNI
- `curio_ipni_task_count` (gauge) - Count of IPNI tasks by completion status and operation type
- `curio_ipni_task_age_max` (gauge) - Maximum age of incomplete IPNI tasks in seconds

### Market MK12
- `curio_market_mk12_deal_pipeline_count` (gauge) - Count of market MK12 deal pipeline stages
- `curio_market_mk12_deals_count` (gauge) - Count of market MK12 deals by different dimensions

### Market Pieces
- `curio_market_piece_metadata_count` (gauge) - Count of market piece metadata by indexing status and version
- `curio_market_piece_metadata_size_total` (gauge) - Total size of market pieces by indexing status
- `curio_piece_summary_stats` (gauge) - Summary statistics of pieces (total, announced, indexed)

### Messages
- `curio_message_sends_count` (gauge) - Count of message sends by success status
- `curio_message_waits_count` (gauge) - Count of message waits by waiter machine

### Ethereum Messages
- `curio_message_sends_eth_count` (gauge) - Count of Ethereum message sends by success status
- `curio_message_sends_eth_error_rate` (gauge) - Error rate of Ethereum message sends by from address
- `curio_message_sends_eth_by_reason` (gauge) - Count of Ethereum message sends by send reason
- `curio_message_sends_eth_nonce_max` (gauge) - Maximum nonce used by from address
- `curio_message_sends_eth_recent_failures` (gauge) - Count of recent Ethereum message send failures by error type
- `curio_message_waits_eth_count` (gauge) - Count of Ethereum message waits by transaction status and success
- `curio_message_waits_eth_success_rate` (gauge) - Success rate of Ethereum message waits by waiter machine
- `curio_message_waits_eth_block_number_latest` (gauge) - Latest confirmed block number by waiter machine
- `curio_message_waits_eth_by_status` (gauge) - Count of Ethereum message waits by transaction status
- `curio_message_waits_eth_machine_distribution` (gauge) - Distribution of Ethereum message waits across machines
- `curio_message_waits_eth_hash_matches` (gauge) - Count of Ethereum message waits with matching/non-matching transaction hashes
- `curio_message_send_eth_locks_count` (gauge) - Count of Ethereum message send locks by from address
- `curio_message_send_eth_locks_active` (gauge) - Count of active Ethereum message send locks (currently claimed)
- `curio_message_send_eth_locks_age_max` (gauge) - Maximum age of Ethereum message send locks in seconds
- `curio_message_send_eth_locks_by_task` (gauge) - Count of Ethereum message send locks by task ID status
- `curio_message_send_eth_locks_stale` (gauge) - Count of potentially stale Ethereum message send locks (older than 1 hour)

### Mining
- `curio_mining_tasks_count` (gauge) - Count of mining tasks by inclusion status, winning status, and miner ID
- `curio_mining_tasks_success_rate` (gauge) - Success rate of mining tasks (included tasks / total tasks)
- `curio_mining_tasks_win_rate` (gauge) - Win rate of mining tasks (won tasks / included tasks)

### Sector Management
- `curio_sector_location_count` (gauge) - Count of sector locations by miner ID and primary status
- `curio_sectors_sdr_pipeline_count` (gauge) - Count of sectors in SDR pipeline by status
- `curio_sectors_snap_pipeline_count` (gauge) - Count of sectors in SNAP pipeline by status
- `curio_sectors_unseal_pipeline_count` (gauge) - Count of sectors in Unseal pipeline by status

### Storage
- `curio_storage_path_capacity` (gauge) - Total capacity of storage paths
- `curio_storage_path_available` (gauge) - Available space in storage paths
- `curio_storage_path_fs_available` (gauge) - Available space in file system for storage paths
- `curio_storage_path_used` (gauge) - Used space in storage paths
- `curio_storage_path_reserved` (gauge) - Reserved space in storage paths
- `curio_storage_path_max_storage` (gauge) - Maximum storage capacity of storage paths
- `curio_storage_removal_marks_count` (gauge) - Count of storage removal marks by miner ID and approval status

### WindowPoSt
- `curio_wdpost_proofs_count` (gauge) - Count of WindowPoSt proofs by miner ID, deadline, and partition
- `curio_wdpost_proofs_by_epoch` (gauge) - Count of WindowPoSt proofs for current and future epochs
- `curio_wdpost_recovery_tasks_count` (gauge) - Count of WindowPoSt recovery tasks
