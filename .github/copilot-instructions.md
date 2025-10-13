# Demo Repository - GitHub Copilot Instructions

**ALWAYS reference these instructions first.** Only search for additional information or use bash commands if the information here is incomplete or found to be in error.

## Project Overview

This is an organization demo repository designed to showcase GitHub features with minimal complexity. The repository serves as a configuration and demonstration space featuring:
- A Random Joke Generator web application (`index.html`) with embedded CSS and JavaScript
- Shell script examples demonstrating common coding issues and fixes
- GitHub Actions workflows for auto-assignment and HTML validation
- @primer/css dependency for styling
- **CRITICAL: NO BUILD PROCESS EXISTS OR IS REQUIRED** - all files work directly

## ⚠️ CRITICAL NO-BUILD WARNINGS ⚠️

**DO NOT attempt any build processes on this repository:**
- ❌ There is NO webpack, vite, rollup, or similar build system
- ❌ There is NO compilation step required  
- ❌ DO NOT run `npm run build`, `npm run dev`, `yarn build`, or similar commands
- ❌ DO NOT look for or attempt to create build scripts
- ❌ DO NOT attempt to set up any build infrastructure
- ✅ Files work directly in browser - edit and test immediately

## Working Effectively

### Quick Start (Fresh Clone Setup)
Time each step carefully - these are validated timings:

1. **Install dependencies** (~1 second):
   ```bash
   npm install
   ```
   - **EXPECTED TIME**: Under 1 second for npm install (only installs @primer/css)
   - **NEVER CANCEL**: Always wait for completion, even if it appears to hang

2. **Serve the application locally** (instant):
   ```bash
   python3 -m http.server 8080
   ```
   - **EXPECTED TIME**: Starts immediately
   - **ACCESS**: Navigate to `http://localhost:8080` in browser
   - **ALTERNATIVE**: Use any static file server (Live Server extension, nginx, etc.)

3. **Test core functionality** (manual validation required):
   - Click "Get a Joke" button multiple times
   - Verify jokes display (either from API or demo fallback)
   - Confirm demo mode notice appears when API is blocked
   - **CRITICAL**: Always test the complete user workflow after any changes

### Available Commands

**⚠️ BEFORE RUNNING ANY COMMANDS - READ THIS:**
- This repository has **NO BUILD SYSTEM** - do not attempt build commands
- Files work directly without compilation or bundling
- Only dependency management and static serving are needed

**Dependencies (ONLY when needed):**
- `npm install` - Install @primer/css dependency (~1 second) - **NEVER CANCEL**: Always wait for completion

**Development (NO BUILD REQUIRED):**
- Edit files directly - changes work immediately
- Use any static HTTP server to serve files  
- `python3 -m http.server 8080` - Recommended local server
- **CRITICAL**: Never attempt `npm run build`, `npm start`, `yarn dev`, or similar build commands

**Testing (NO TEST SUITE EXISTS):**
- **NO AUTOMATED TESTS**: This project has no test framework installed
- **MANUAL VALIDATION REQUIRED**: Always test in browser after changes
- **NO UNIT TESTS TO RUN**: Do not attempt `npm test`, `jest`, `mocha`, etc.
- HTML structure validation via GitHub Actions only (uses anishathalye/proof-html)

## Repository Structure

This is a **configuration and demonstration repository** with the following structure:

```
.
├── .github/
│   ├── copilot-instructions.md   # THIS FILE - Copilot agent guidance
│   └── workflows/
│       ├── auto-assign.yml      # Auto-assigns issues/PRs to joe10832
│       └── proof-html.yml       # HTML validation workflow
├── .gitignore                   # Standard Node.js gitignore  
├── README.md                    # Repository overview
├── SECURITY.md                  # Security policy
├── index.html                   # Random Joke Generator demo app
├── package.json                 # Dependencies (@primer/css ONLY)
├── package-lock.json           # Lock file (generated after npm install)
├── TILDE_FIX_README.md         # Documentation for shell script examples
├── directory_validator.sh       # Shell script example (tilde fix demo)
├── fix_example.sh              # Shell script example (tilde fix demo)
└── tilde_test.sh               # Shell script example (tilde fix demo)
```

**KEY POINTS:**
- This is a **demo/configuration repository**, not a production application
- No build system exists or is needed
- Shell scripts are executable examples demonstrating coding issues
- Web app runs directly in browser with no compilation

## Validation Requirements

### Manual Testing Protocol
**CRITICAL**: Always perform these validation steps after making any changes:

**FOR WEB APPLICATION CHANGES (index.html):**
1. **Start local server**: `python3 -m http.server 8080`  
2. **Open browser**: Navigate to `http://localhost:8080`
3. **Test joke generation**: 
   - Click "Get a Joke" button at least 3 times
   - Verify jokes display correctly (setup + punchline)
   - Confirm styling and layout remain intact
4. **Test error handling**:
   - API failures automatically fall back to demo jokes  
   - Demo mode notice should appear at bottom
5. **Test responsive design**: Resize browser window to test mobile layout

**FOR SHELL SCRIPT CHANGES:**
1. **Make executable**: `chmod +x script_name.sh`
2. **Run script**: `./script_name.sh`
3. **Verify output**: Check that examples demonstrate the intended behavior
4. **Test in different environments**: Ensure scripts work in various shell contexts

**⚠️ DO NOT ATTEMPT:**
- Running build processes that don't exist
- Setting up test frameworks that aren't installed  
- Creating compilation steps for files that work directly

### GitHub Actions Validation
- **auto-assign.yml**: Automatically assigns new issues/PRs to joe10832
- **proof-html.yml**: Validates HTML structure on push/workflow_dispatch
- **TIMING**: GitHub Actions run automatically, no manual intervention needed

## Code Structure

### Main Application (`index.html`)
- **Lines 1-80**: HTML structure and CSS styling
- **Lines 81-281**: JavaScript JokeGenerator class
- **Key Components**:
  - `JokeGenerator` class handles all functionality
  - Fallback demo jokes array for offline operation
  - Error handling and loading states
  - HTML escaping for security

### Dependencies
- **@primer/css**: GitHub's CSS framework (loaded via CDN)
- **External API**: `https://official-joke-api.appspot.com/jokes/random`

## Common Development Tasks

### Making Changes to the Web Application
1. **Edit `index.html`** directly - no build process needed
2. **Test immediately** using static server (`python3 -m http.server 8080`)
3. **Validate manually** using the testing protocol above
4. **Check GitHub Actions** will pass by ensuring HTML is valid

### Working with Shell Script Examples  
1. **Edit `.sh` files** directly - they are executable examples
2. **Make executable**: `chmod +x filename.sh`
3. **Test execution**: `./filename.sh`
4. **Verify output**: Ensure examples demonstrate intended behavior

### Adding New Content
- **Web app features**: Modify `index.html` (CSS in `<style>`, JS in `<script>`)
- **New examples**: Create new `.sh` files and update documentation
- **Configuration**: Update workflow files in `.github/workflows/`

### ⚠️ THINGS TO NEVER ATTEMPT ⚠️
- Setting up webpack, vite, parcel, or any build system
- Creating `npm run` scripts for building/compilation  
- Installing build-related dependencies (babel, typescript compiler, etc.)
- Setting up test frameworks (jest, mocha, cypress, etc.) 
- Creating Docker containers or deployment pipelines
- Attempting to "modernize" the setup with build tools

### Debugging

**Web Application Issues:**
- **Console errors**: Open browser dev tools to see JavaScript errors
- **Network failures**: External API calls may fail - ensure fallback works  
- **Styling issues**: Check CSS specificity and @primer/css conflicts

**Shell Script Issues:**
- **Permission errors**: Use `chmod +x script.sh` to make executable
- **Syntax errors**: Check bash syntax with `bash -n script.sh`
- **Environment issues**: Verify script works in current shell environment

**⚠️ DO NOT ATTEMPT TO DEBUG WITH:**
- Build system error messages (webpack, vite errors)
- Package compilation issues (TypeScript, Babel errors)  
- Test framework failures (jest, mocha failures)
- These systems are not installed and should not be used

## Important Notes

### External Dependencies
- **@primer/css**: Loaded from CDN, no local installation needed
- **Joke API**: External service, may be blocked in some environments
- **Fallback behavior**: Always works with demo jokes when API unavailable

### CI/CD
- **No deployment**: Static files only, deploy anywhere
- **GitHub Pages ready**: Repository can be served directly via GitHub Pages
- **Validation**: HTML structure validated automatically via GitHub Actions

### Performance
- **Load time**: Instant (single HTML file + CDN CSS)
- **No build step**: Direct file editing and testing
- **Minimal dependencies**: Only @primer/css via npm

## Troubleshooting

### Common Issues
1. **"Address already in use" error**: 
   - Kill existing servers: `pkill -f "python3 -m http.server"`
   - Use different port: `python3 -m http.server 8081`

2. **Jokes not loading**:
   - External API blocked - this is normal behavior
   - Demo jokes should still work  
   - Check browser console for error messages

3. **Styling broken**:
   - @primer/css CDN may be blocked
   - Application still functional without external CSS

4. **Shell scripts not working**:
   - Check execute permissions: `ls -la *.sh`
   - Make executable: `chmod +x *.sh`
   - Verify bash compatibility: `bash -n script.sh`

### ⚠️ DO NOT TROUBLESHOOT NON-EXISTENT SYSTEMS
- **Build failures**: No build system exists, so no build errors should occur
- **Test failures**: No test suite exists, so no test errors should occur  
- **Compilation errors**: No compilation step exists, so these are not relevant
- **Bundle/webpack errors**: No bundling system exists
- **Node.js runtime errors**: Application runs in browser, not Node.js

If you see errors related to missing build systems, **STOP** - these indicate someone is trying to use tools that don't exist in this repository.

### GitHub Actions Failures
- **auto-assign.yml**: Requires `joe10832` user access
- **proof-html.yml**: HTML validation errors need manual fixing

## Quick Reference

### Most Common Commands
```bash
# Fresh setup
npm install                          # Under 1 second
python3 -m http.server 8080         # Instant

# Alternative server options
npx live-server                     # If live-server installed
npx http-server                     # If http-server installed
```

### File Locations
- **Main app**: `index.html` (contains everything)
- **Dependencies**: `package.json` (@primer/css only)
- **Workflows**: `.github/workflows/` (auto-assign, HTML validation)

### Testing Checklist
- [ ] npm install works (~1 second)
- [ ] Local server starts successfully
- [ ] Joke button works and displays jokes
- [ ] Demo mode activates when API unavailable
- [ ] Layout responsive on mobile
- [ ] No JavaScript console errors