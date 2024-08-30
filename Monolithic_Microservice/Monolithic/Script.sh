#!/bin/bash

# Database credentials
DB_USER="root"
DB_PASS="honda4104"
DB_NAME="mac_monitor"
DB_HOST="localhost"

# Table name
TABLE_NAME="monitor_data"

echo $DB_USER
# Capture CPU power data using powermetrics
CPU_POWER_OUTPUT=$(sudo powermetrics --samplers cpu_power )
echo $CPU_POWER_OUTPUT
# Get current timestamp
CURRENT_TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")

# Insert the data into the MySQL table
mysql -u $DB_USER -p$DB_PASS -h $DB_HOST $DB_NAME <<EOF
INSERT INTO $TABLE_NAME (timestamp, data) VALUES ('$CURRENT_TIMESTAMP', '$CPU_POWER_OUTPUT');
EOF

# Output the data for confirmation (optional)
echo "Inserted Data: Timestamp: $CURRENT_TIMESTAMP, Data: $CPU_POWER_OUTPUT"
