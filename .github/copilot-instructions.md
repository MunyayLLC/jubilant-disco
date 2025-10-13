# Random Joke Generator Web Application

**ALWAYS follow these instructions first and fallback to search or additional context gathering only when the information here is incomplete or found to be in error.**

This is a static HTML/CSS/JavaScript web application that displays random jokes. It fetches jokes from an external API with fallback to demo jokes when the API is unavailable. The application uses GitHub's Primer CSS framework for styling.

## Working Effectively

### Prerequisites and Setup
- **Node.js and npm are pre-installed** - no additional installation required
- Install dependencies: `npm install` -- takes 5-10 seconds, NEVER CANCEL
- Dependencies include only @primer/css (17.0.1) for styling

### Development Workflow
- **No build process required** - this is a static web application
- Serve locally: `python3 -m http.server 8000` (or any static file server)
- Access application: `http://localhost:8000`
- **NEVER CANCEL** the web server - let it run continuously during development

### Testing and Validation
- **HTML Validation**: Install and run `npm install -g html-validate && html-validate index.html` -- takes 10-15 seconds, NEVER CANCEL
- **Manual Testing Requirements**: ALWAYS test complete user scenarios after making changes:
  1. Load the application in browser (`http://localhost:8000`)
  2. Click "Get a Joke" button multiple times
  3. Verify jokes display properly (setup and punchline)
  4. Verify demo mode notice appears (API will fail in sandboxed environments)
  5. Check browser console for expected API errors (normal behavior)

### GitHub Actions Workflows
- **auto-assign.yml**: Automatically assigns issues/PRs to joe10832
- **proof-html.yml**: Validates HTML structure on push and workflow_dispatch
- Both workflows complete in under 30 seconds - NEVER CANCEL

## Code Structure and Navigation

### Key Files
- **`index.html`** - Complete application (HTML, CSS, JavaScript in single file)
  - Lines 1-142: HTML structure and CSS styling
  - Lines 143-281: JavaScript functionality (JokeGenerator class)
- **`package.json`** - Minimal dependency configuration
- **`README.md`** - Basic repository description
- **`.github/workflows/`** - GitHub Actions automation

### Important Code Areas
- **API Integration**: Lines 150-215 in index.html (fetchJoke method)
- **Demo Jokes Array**: Lines 158-182 in index.html (fallback jokes)
- **Error Handling**: Lines 203-210 in index.html (API failure fallback)
- **UI Updates**: Lines 217-250 in index.html (DOM manipulation methods)

### Architecture Pattern
- **Single-file application** with embedded CSS and JavaScript
- **Class-based JavaScript** (JokeGenerator class pattern)
- **Progressive enhancement** with fallback demo jokes
- **Error-resilient design** for API failures

## Validation and Quality Assurance

### Pre-commit Validation
- ALWAYS run `html-validate index.html` before committing changes
- Common validation issues to fix:
  - Add `type="button"` to button elements
  - Remove trailing whitespace
  - Avoid inline styles (use embedded CSS instead)

### Functional Testing Scenarios
- **Primary Flow**: Load app → Click button → Verify joke displays
- **Fallback Flow**: Confirm demo mode activates when API fails
- **Multiple Clicks**: Verify different jokes appear on repeated clicks
- **UI Responsiveness**: Test on different screen sizes (responsive design)

### Expected Behavior
- **API Call**: Attempts to fetch from `https://official-joke-api.appspot.com/jokes/random`
- **Fallback**: Uses local demo jokes array when API fails
- **Demo Mode Notice**: Blue info box appears when using fallback jokes
- **Loading State**: Button shows "Getting joke..." during API calls

## Common Tasks and Commands

### Setup and Development
```bash
# Install dependencies (5-10 seconds)
npm install

# Start local development server
python3 -m http.server 8000

# Validate HTML (10-15 seconds)
npm install -g html-validate
html-validate index.html
```

### Repository Maintenance
```bash
# Check repository status
git status

# View recent commits
git log --oneline -5

# Check GitHub Actions status
# Visit: https://github.com/MunyayLLC/demo-repository/actions
```

### Directory Structure
```
.
├── .github/
│   └── workflows/
│       ├── auto-assign.yml
│       └── proof-html.yml
├── .gitignore
├── README.md
├── index.html          # Main application file
├── package.json        # Dependencies configuration
└── package-lock.json   # Lock file (auto-generated)
```

## Troubleshooting and Known Issues

### Expected "Errors"
- **External API blocked**: Console shows fetch errors - this is normal in sandboxed environments
- **CSS loading blocked**: @primer/css CDN may be blocked - application still functional
- **Demo mode activation**: Blue notice box is expected behavior, not an error

### Development Guidelines
- **Single file editing**: Most changes only require editing `index.html`
- **CSS modifications**: Add styles within the `<style>` section (lines 8-142)
- **JavaScript changes**: Modify the JokeGenerator class (lines 147-281)
- **New jokes**: Add to the `demoJokes` array (lines 158-182)

### Performance Considerations
- **No build optimization needed** - static files served directly
- **External dependencies**: Only @primer/css loaded from CDN
- **Local fallback**: Demo jokes ensure functionality without network access

## Integration and Deployment

### GitHub Pages Compatible
- Static files can be served directly from repository
- No build process or server-side rendering required
- All dependencies loaded via CDN

### CI/CD Validation
- HTML structure validated automatically via proof-html workflow
- No additional build or test steps required
- Manual testing covers all critical functionality

**Remember**: This is a demonstration repository showcasing simple, effective web development practices. Keep changes minimal and validate thoroughly through manual testing.