#!/bin/bash

# Test script to demonstrate the specific tilde expansion issue
# This script shows why "$TARGET_DIR" == "~" comparisons fail

echo "Tilde Expansion Demonstration"
echo "============================="
echo ""

echo "1. Environment setup:"
echo "   HOME = '$HOME'"
echo "   Current working directory = '$(pwd)'"
echo ""

echo "2. Testing tilde expansion:"
echo "   Literal tilde: '~'"
echo "   Expanded tilde: $(echo ~)"
echo "   Are they equal? $(if [[ '~' == "$(echo ~)" ]]; then echo 'YES'; else echo 'NO'; fi)"
echo ""

echo "3. The problem with TARGET_DIR comparisons:"
TARGET_DIR="$HOME"
echo "   When TARGET_DIR='$TARGET_DIR' (actual home path)"
echo "   Does TARGET_DIR == '~'? $(if [[ "$TARGET_DIR" == '~' ]]; then echo 'YES'; else echo 'NO'; fi)"
echo "   Does TARGET_DIR == \$HOME? $(if [[ "$TARGET_DIR" == "$HOME" ]]; then echo 'YES'; else echo 'NO'; fi)"
echo ""

TARGET_DIR="~"
echo "   When TARGET_DIR='~' (literal tilde)"
echo "   Does TARGET_DIR == '~'? $(if [[ "$TARGET_DIR" == '~' ]]; then echo 'YES'; else echo 'NO'; fi)"
echo "   Does TARGET_DIR == \$HOME? $(if [[ "$TARGET_DIR" == "$HOME" ]]; then echo 'NO (because ~ != $HOME)'; else echo 'YES'; fi)"
echo ""

echo "4. Conclusion:"
echo "   - The '== \"~\"' comparison only works with literal tildes"
echo "   - Users typically pass expanded paths (like '$HOME')"
echo "   - Use '== \"\$HOME\"' for reliable home directory detection"