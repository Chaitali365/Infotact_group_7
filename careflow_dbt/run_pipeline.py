import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent


def run_command(command, name):
    print("\n" + "=" * 60)
    print(f"RUNNING: {name}")
    print("=" * 60)

    result = subprocess.run(command, cwd=ROOT)

    if result.returncode != 0:
        print(f"\nFAILED: {name}")
        sys.exit(result.returncode)

    print(f"\nPASSED: {name}")


def main():
    print("\n" + "=" * 60)
    print("CARE FLOW END-TO-END PIPELINE")
    print("=" * 60)

    # Step 1: Build dbt models
    run_command(
        ["dbt", "build"],
        "dbt build"
    )

    # Step 2: Run PM4Py process discovery
    run_command(
        [sys.executable, "pm4py_discovery.py"],
        "PM4Py process discovery"
    )

    # Step 3: Validate PM4Py result
    run_command(
        [sys.executable, "validate_pm4py_result.py"],
        "PM4Py result validation"
    )

    # Step 4: Validate process map
    run_command(
        [sys.executable, "validate_process_map.py"],
        "Process map validation"
    )

    print("\n" + "=" * 60)
    print("CARE FLOW PIPELINE COMPLETED SUCCESSFULLY")
    print("=" * 60)


if __name__ == "__main__":
    main()