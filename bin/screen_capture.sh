#!/bin/bash

SAVE_DIR="${HOME}/Screenshots/"
TIMESTAMP="$(date'+%Y-%m-%d_%H-%M-%S')"
PIC="${SAVE_DIR}/screenshot_${TIMESTAMP}.png"

mkdir -p "${SAVE_DIR}"

REGION="$(slurp)"

grim -g "${REGION}" "${PIC}" &&
  optipng -strip all -quiet "${PIC}" &&
  wl-copy <"${PIC}" &&
  notify-send -h string:transient:1 "Saved and copied to clipboard: ${OUTFILE}"
