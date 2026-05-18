#!/bin/bash
for file in profile/windgets/projects*.svg; do
  # Add the Google Fonts import if not exists
  if ! grep -q "Plus Jakarta Sans" "$file"; then
    sed -i "s|<style>|<style>\n    @import url('https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800\&display=swap');\n    text { font-family: 'Plus Jakarta Sans', system-ui, sans-serif !important; }|g" "$file"
  fi
  
  # Update fonts and letter spacing
  sed -i "s|.pname { font-size: 17px; font-weight: 700; }|.pname { font-size: 18px; font-weight: 800; letter-spacing: -0.5px; }|g" "$file"
  sed -i "s|.pdesc { font-size: 11.5px; fill: #8b949e; }|.pdesc { font-size: 12px; fill: #94A3B8; font-weight: 500; }|g" "$file"
  sed -i "s|.ptag { font-size: 10px; fill: #58a6ff; }|.ptag { font-size: 10px; fill: #64748B; font-weight: 600; letter-spacing: 0.5px; }|g" "$file"
  sed -i "s|.porg { font-size: 9px; fill: #484f58; font-weight: 600; letter-spacing: 1px; }|.porg { font-size: 9px; fill: #475569; font-weight: 700; letter-spacing: 2px; }|g" "$file"

  # Enhance the progress bar background
  sed -i 's|fill="#21262d"|fill="#1E293B"|g' "$file"

  # We can inject defs for a drop-shadow if it doesn't exist
  if ! grep -q "<defs>" "$file"; then
    sed -i "s|<style>|<defs>\n    <filter id=\"glow\" x=\"-20%\" y=\"-20%\" width=\"140%\" height=\"140%\">\n      <feGaussianBlur stdDeviation=\"4\" result=\"blur\"/>\n      <feComposite in=\"SourceGraphic\" in2=\"blur\" operator=\"over\"/>\n    </filter>\n  </defs>\n  <style>|g" "$file"
    
    # Add glow to the progress bars
    sed -i 's|opacity="0.7"|opacity="0.8" filter="url(#glow)"|g' "$file"
  fi
  
  # Change the circle icon background to make it blend elegantly
  sed -i 's|fill="#1a1a2e"|fill="transparent" stroke-dasharray="4 4"|g' "$file"
done
