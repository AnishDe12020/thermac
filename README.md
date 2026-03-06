# thermac

Tiny CLI for Apple Silicon Mac temperatures using SMC keys.

## Install

```bash
git clone https://github.com/AnishDe12020/thermac.git
cd thermac
./install.sh
~/.local/bin/thermac --json
```

## Output

```json
{
  "timestamp_utc": "2026-03-06T15:09:38Z",
  "hottest": {"key": "TCMz", "c": 78.23},
  "cpu_avg_c": 56.55,
  "gpu_avg_c": 46.10,
  "avg_all_c": 45.96,
  "sensor_count": 168,
  "cpu_sensor_count": 58,
  "gpu_sensor_count": 18
}
```

## Notes

- No runtime git clone: SMC sources are vendored in this repo (`vendor/stats-smc`).
- Uses private/undocumented sensor keys; macOS updates may affect readings.
- `cpu_avg_c` and `gpu_avg_c` are heuristic averages by key prefix.
- Credit: [exelban/stats](https://github.com/exelban/stats) for SMC implementation foundation.

## License

MIT
