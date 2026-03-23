# System Monitoring Simulation

A beginner-friendly DevOps project that simulates basic system health monitoring on Linux using Bash.

The script checks uptime, CPU usage, and memory usage, writes the results to a log file, and prints alerts when resource usage goes above a defined threshold.

## Features

- Checks system uptime
- Monitors CPU usage
- Monitors memory usage
- Writes health checks to a log file
- Displays alerts when thresholds are exceeded

## Why I Built This

My background in healthcare and quality control taught me the value of monitoring processes, detecting issues early, and maintaining reliability. This project connects that mindset to DevOps and Linux system administration.

## Project Structure

```text
system-monitoring-simulation/
|-- monitor.sh
|-- README.md
`-- logs/
```

## Requirements

- Linux environment
- Bash shell
- Standard Linux tools such as `uptime`, `top`, `awk`, and `free`

## How to Run

```bash
chmod +x monitor.sh
./monitor.sh
```

The script creates a `logs/` folder automatically and writes output to `logs/system_health.log`.

## Example Output

```text
ALERT: CPU usage is above 80%
ALERT: Memory usage is above 80%
```

## Skills Demonstrated

- Linux
- Bash scripting
- Monitoring
- Logging
- Troubleshooting

## Future Improvements

- Add email or Slack alerts
- Add color-coded terminal output
- Run the script automatically with cron
- Track disk usage as an extra system health metric
