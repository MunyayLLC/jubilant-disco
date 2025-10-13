#!/bin/bash

# Example script with the FIXED tilde comparison issue
# This implements the solution suggested in issue #33

# Function that validates if a directory is safe to use
# Rejects dangerous directories like /, ~, ., .. and empty strings
validate_target_directory() {
    local TARGET_DIR="$1"
    
    # ORIGINAL PROBLEMATIC CODE (commented out):
    # if [[ -z "$TARGET_DIR" || "$TARGET_DIR" == "/" || "$TARGET_DIR" == "~" || "$TARGET_DIR" == "." || "$TARGET_DIR" == ".." ]]; then
    
    # FIXED CODE - Using $HOME instead of "~" for proper home directory detection:
    if [[ -z "$TARGET_DIR" || "$TARGET_DIR" == "/" || "$TARGET_DIR" == "~" || "$TARGET_DIR" == "$HOME" || "$TARGET_DIR" == "." || "$TARGET_DIR" == ".." ]]; then
        return 1  # Directory is not safe
    else
        return 0  # Directory is safe
    fi
}

# Test function to demonstrate the fix
test_directory() {
    local dir="$1"
    echo -n "Testing directory '$dir': "
    
    if validate_target_directory "$dir"; then
        echo "✅ SAFE to use"
    else
        echo "❌ REJECTED (protected directory)"
    fi
}

main() {
    echo "Directory Validation Script - Issue #33 Fix"
    echo "=========================================="
    echo ""
    echo "This script demonstrates the fix for the tilde (~) comparison issue."
    echo "The problem was that '\"$TARGET_DIR\" == \"~\"' would not match actual home directory paths."
    echo "The fix adds '|| \"$TARGET_DIR\" == \"\$HOME\"' to properly catch home directories."
    echo ""
    echo "HOME directory: $HOME"
    echo ""
    
    # Test various directory paths
    test_directory ""                    # Empty string
    test_directory "/"                   # Root directory  
    test_directory "~"                   # Literal tilde
    test_directory "$HOME"               # Actual home path
    test_directory "."                   # Current directory
    test_directory ".."                  # Parent directory
    test_directory "/tmp"                # Safe directory
    test_directory "$HOME/Documents"     # Safe subdirectory
    test_directory "/usr/local/bin"      # Another safe directory
    
    echo ""
    echo "Fix Summary:"
    echo "- Added '|| \"\$TARGET_DIR\" == \"\$HOME\"' to the condition"
    echo "- Now properly rejects both literal '~' and actual home directory paths"
    echo "- Maintains all other safety checks (/, ., .., empty string)"
}

# Run if executed directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi