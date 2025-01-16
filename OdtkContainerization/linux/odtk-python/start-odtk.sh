#!/bin/bash
set -e

LOGS_DIR="${ODTK_USER_HOME}"/logs
STARTUP_LOG="${LOGS_DIR}"/startup.log
TIMEOUT=120

create_log_file() {
    mkdir -p "${LOGS_DIR}"
    touch "${STARTUP_LOG}"
}

start_odtk() {
    echo "Initializing ODTK..."
    odtkruntime > "${STARTUP_LOG}" 2>&1 &
}

wait_for_startup_complete() {
    while true; do
        if grep -q 'App running' "${STARTUP_LOG}"; then
            break
        fi

        if [ $SECONDS -gt "${TIMEOUT}" ]; then
            echo "ERROR: ODTK did not start up successfully. Startup log:"
            cat "${STARTUP_LOG}"
            exit 1
        fi

        sleep 5
    done
}

main() {
    create_log_file
    start_odtk
    wait_for_startup_complete

    echo "ODTK initialization successful."
}

main
