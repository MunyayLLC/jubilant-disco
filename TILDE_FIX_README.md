# Shell Script Tilde Comparison Fix

This directory contains scripts demonstrating and fixing the tilde (`~`) comparison issue described in issue #33.

## The Problem

In shell scripts, when checking if a directory path is the home directory, the following comparison is problematic:

```bash
if [[ "$TARGET_DIR" == "~" ]]; then
    # This will only match literal tildes, not actual home directory paths
fi
```

**Why it fails:** The shell expands `~` to the full home directory path before the comparison occurs. So if a user passes their actual home directory path (e.g., `/home/username`), the comparison `"/home/username" == "~"` will always be false.

## The Solution

Use the `$HOME` environment variable instead:

```bash
# BEFORE (problematic):
if [[ -z "$TARGET_DIR" || "$TARGET_DIR" == "/" || "$TARGET_DIR" == "~" || "$TARGET_DIR" == "." || "$TARGET_DIR" == ".." ]]; then

# AFTER (fixed):
if [[ -z "$TARGET_DIR" || "$TARGET_DIR" == "/" || "$TARGET_DIR" == "~" || "$TARGET_DIR" == "$HOME" || "$TARGET_DIR" == "." || "$TARGET_DIR" == ".." ]]; then
```

The fix adds `|| "$TARGET_DIR" == "$HOME"` to properly catch actual home directory paths.

## Demonstration Scripts

1. **`fix_example.sh`** - Shows the complete fix implementation
2. **`directory_validator.sh`** - Comprehensive comparison of problematic vs. corrected versions
3. **`tilde_test.sh`** - Simple demonstration of tilde expansion behavior

## Running the Examples

```bash
# Make scripts executable
chmod +x *.sh

# Run the fix demonstration
./fix_example.sh

# Run the comprehensive comparison
./directory_validator.sh

# Run the tilde expansion test
./tilde_test.sh
```

## Key Takeaways

- `"$VAR" == "~"` only matches literal tilde characters
- Users typically pass expanded paths like `/home/username`
- Use `"$VAR" == "$HOME"` for reliable home directory detection
- Keep both checks if you need to handle both literal tildes and expanded paths