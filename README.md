# Log Archive

`log_archive.sh` gathers basic system information and creates a compressed archive of a selected path under `/var/log`.

## Requirements

- Bash
- `tar` and standard Linux utilities (`who`, `head`, `date`, `ls`, and `cat`)
- `sudo` privileges to create the archive directory and archive file

## Usage

Run the script with the log file or directory to archive:

```bash
./log_archive.sh <path-under-var-log>
```

For example:

```bash
./log_archive.sh nginx
```

The script changes to `/var/log` before processing the argument, so a relative path such as `nginx` refers to `/var/log/nginx`. You can also provide an absolute path, such as `/var/log/nginx`.

## What it does

1. Prints the first logged-in user reported by `who`.
2. Prints the first three lines of `/etc/os-release`.
3. Changes its working directory to `/var/log`.
4. Creates `/var/log/archive_all_logs` if it does not already exist.
5. Lists the requested path and creates a gzip-compressed tar archive.
6. Moves the archive into `/var/log/archive_all_logs`.

Archive names use the current date and time in `YYYYMMDD_HHMMSS.tar.gz` format, for example:

```text
/var/log/archive_all_logs/20261025_113006.tar.gz
```

The requested path should exist and be accessible from `/var/log`. The script uses `sudo` for archive creation and moving the archive; you may be prompted for your password.
