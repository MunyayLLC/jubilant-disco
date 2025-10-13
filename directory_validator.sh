#!/bin/bash

# Directory Validator Script
# Demonstrates the tilde (~) comparison issue and provides the correct solution
# 
# Issue: The comparison "$TARGET_DIR" == "~" will never match because the shell
# expands ~ to the full home directory path before the comparison occurs.
# 
# Solution: Use "$TARGET_DIR" == "$HOME" to properly check for home directory

set -euo pipefail

validate_directory() {
    local TARGET_DIR="$1"
    
    echo "Validating directory: '$TARGET_DIR'"
    echo "HOME environment variable: '$HOME'"
    echo "Tilde expansion test: $(echo ~)"
    echo ""
    
    # PROBLEMATIC VERSION - demonstrates the issue
    echo "=== PROBLEMATIC VERSION ==="
    if [[ -z "$TARGET_DIR" || "$TARGET_DIR" == "/" || "$TARGET_DIR" == "~" || "$TARGET_DIR" == "." || "$TARGET_DIR" == ".." ]]; then
        echo "❌ PROBLEM: Using tilde comparison - this will reject valid directories"
        echo "   The comparison '\"$TARGET_DIR\" == \"~\"' fails because shell expands ~ before comparison"
        if [[ "$TARGET_DIR" == "~" ]]; then
            echo "   ✓ Literal tilde matched (this rarely happens in practice)"
        else
            echo "   ✗ Literal tilde did not match (expected behavior)"
        fi
        if [[ "$TARGET_DIR" == "$HOME" ]]; then
            echo "   ✓ HOME path matched: $TARGET_DIR"
        else
            echo "   ✗ HOME path did not match"
        fi
        echo "   Result: Directory considered INVALID"
    else
        echo "   Result: Directory considered VALID"
    fi
    echo ""
    
    # CORRECTED VERSION - implements the fix  
    echo "=== CORRECTED VERSION ==="
    if [[ -z "$TARGET_DIR" || "$TARGET_DIR" == "/" || "$TARGET_DIR" == "$HOME" || "$TARGET_DIR" == "." || "$TARGET_DIR" == ".." ]]; then
        echo "✅ FIXED: Using \$HOME comparison - properly detects home directory"
        if [[ "$TARGET_DIR" == "$HOME" ]]; then
            echo "   ✓ HOME directory detected: $TARGET_DIR"
        fi
        echo "   Result: Directory considered INVALID (protected directory)"
    else
        echo "   Result: Directory considered VALID (safe to use)"
    fi
    echo ""
    echo "----------------------------------------"
    echo ""
}

main() {
    echo "Directory Validator - Tilde Comparison Fix Demo"
    echo "==============================================="
    echo ""
    
    # Test cases to demonstrate the issue and fix
    echo "Testing various directory paths..."
    echo ""
    
    # Test 1: Literal tilde (rare but possible)
    validate_directory "~"
    
    # Test 2: Actual home directory path
    validate_directory "$HOME"
    
    # Test 3: A subdirectory of home
    validate_directory "$HOME/Documents"
    
    # Test 4: Root directory
    validate_directory "/"
    
    # Test 5: Current directory
    validate_directory "."
    
    # Test 6: Parent directory
    validate_directory ".."
    
    # Test 7: A safe directory
    validate_directory "/tmp/safe-directory"
    
    # Test 8: Empty string
    validate_directory ""
    
    echo "Summary:"
    echo "- The problematic version using '== \"~\"' fails to properly detect home directory"
    echo "- The corrected version using '== \"\$HOME\"' properly detects home directory"
    echo "- This fix ensures that operations are properly restricted when targeting home directory"
}

# Run the demonstration if script is executed directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi