# Random Joke Generator - GitHub Copilot Instructions

**ALWAYS follow these instructions first.** Only search for additional information or use bash commands if the information here is incomplete or found to be in error.

## Project Overview

This is a Random Joke Generator web application built with vanilla HTML, CSS, and JavaScript. The application features:
- A single-page HTML application (`index.html`) with embedded CSS and JavaScript
- External API integration with graceful fallback to demo jokes
- @primer/css dependency for styling
- GitHub Actions for auto-assignment and HTML validation
- No build process required - runs directly in any web browser

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

**Dependencies:**
- `npm install` - Install @primer/css dependency (~1 second)
- **NEVER CANCEL**: Wait for npm install to complete

**Development:**
- No build process - edit files directly
- Use any static HTTP server to serve files
- `python3 -m http.server 8080` - Recommended local server

**Testing:**
- **NO AUTOMATED TESTS**: This project has no test suite
- **MANUAL VALIDATION REQUIRED**: Always test in browser after changes
- HTML validation via GitHub Actions (uses anishathalye/proof-html)

## Repository Structure

```
.
├── .github/
│   └── workflows/
│       ├── auto-assign.yml      # Auto-assigns issues/PRs to joe10832
│       └── proof-html.yml       # HTML validation workflow
├── .gitignore                   # Standard Node.js gitignore
├── README.md                    # Basic project description
├── index.html                   # Main application file (HTML + CSS + JS)
├── package.json                 # Dependencies (@primer/css only)
└── package-lock.json           # Lock file (generated after npm install)
```

## Validation Requirements

### Manual Testing Protocol
**CRITICAL**: Always perform these validation steps after making any changes:

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

### Making Changes to the Application
1. **Edit `index.html`** directly - no build process needed
2. **Test immediately** using local server
3. **Validate manually** using the testing protocol above
4. **Check GitHub Actions** will pass by ensuring HTML is valid

### Adding New Features
- **CSS**: Add styles in the `<style>` section (lines ~8-80)
- **JavaScript**: Modify the JokeGenerator class (lines ~90-281)
- **HTML**: Update structure in the `<body>` section

### Debugging
- **Console errors**: Open browser dev tools to see JavaScript errors
- **Network failures**: External API calls may fail - ensure fallback works
- **Styling issues**: Check CSS specificity and @primer/css conflicts

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
   - Check console for error messages

3. **Styling broken**:
   - @primer/css CDN may be blocked
   - Application still functional without external CSS

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