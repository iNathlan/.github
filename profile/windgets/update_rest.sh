#!/bin/bash
for file in profile/windgets/status.svg profile/windgets/team.svg profile/windgets/connect.svg; do
  if ! grep -q "Plus Jakarta Sans" "$file"; then
    sed -i "s|<style>|<style>\n    @import url('https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800\&display=swap');\n    text { font-family: 'Plus Jakarta Sans', system-ui, sans-serif !important; }|g" "$file"
  fi
done
