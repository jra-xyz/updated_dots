#!/bin/bash

whitelist=("Signal" "Vesktop")

LOGFILE="${XDG_RUNTIME_DIR}/dunst/notifications.log"
mkdir -p "$(dirname "$LOGFILE")"

save=false
for app in "${whitelist[@]}"; do
  [[ "$DUNST_APP_NAME" == "$app" ]] && save=true && break
done

if ! save; then
  exit 0
fi

timestamp="$(date '+%Y-%m-%d %H:%M:%S')"
if [[ -n "$DUNST_BODY" ]]; then
  message="${DUNST_SUMMARY}: ${DUNST_BODY}"
else
  message="${DUNST_SUMMARY}"
fi

echo "[$timestamp] ${DUNST_APP_NAME} — ${message}" \
  >>"$LOGFILE"
