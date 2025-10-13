# AI Agent Instructions for Random Joke Generator

This repository contains a Random Joke Generator web application. This file provides general instructions for all AI coding agents working on this project.

## Project Overview

**Application Type**: Single-page web application  
**Tech Stack**: Vanilla HTML, CSS, JavaScript  
**Dependencies**: @primer/css (GitHub's CSS framework)  
**Build Process**: None - direct file editing  
**Deployment**: Static hosting (GitHub Pages ready)

## Key Files & Structure

```
├── index.html           # Main application (HTML + CSS + JavaScript)
├── package.json         # Dependencies (@primer/css only)  
├── .github/
│   ├── copilot-instructions.md    # Comprehensive Copilot instructions
│   └── workflows/                 # Auto-assign & HTML validation
└── README.md           # Basic project info
```

## Development Guidelines

### Essential Rules
1. **Single file architecture**: All code lives in `index.html` - no separate JS/CSS files
2. **No build process**: Edit files directly, test immediately in browser
3. **Manual testing required**: No automated test suite - always validate in browser
4. **Minimal changes**: Make surgical modifications only

### Quick Development Workflow
```bash
# Setup (first time only)
npm install                    # Installs @primer/css (~1 second)

# Development
python3 -m http.server 8080   # Start local server
# Edit index.html directly
# Test at http://localhost:8080
```

### Testing Protocol
**CRITICAL**: Always test after ANY changes:
1. Click "Get a Joke" button multiple times
2. Verify jokes display correctly (setup + punchline)
3. Confirm demo mode fallback works when API fails
4. Test responsive design on mobile

## Code Architecture

### HTML Structure (lines 1-80)
- Standard HTML5 with viewport meta tag
- Embedded CSS styles using GitHub's design system colors
- Container-based layout with responsive design

### JavaScript (lines 81-290)
- `JokeGenerator` class encapsulates all functionality
- External API integration with graceful fallback
- Demo jokes array for offline operation
- HTML escaping for security

### Key Features
- **API Integration**: `https://official-joke-api.appspot.com/jokes/random`
- **Fallback System**: Demo jokes when API unavailable
- **Security**: HTML escaping prevents XSS
- **Responsive**: Mobile-first design with media queries

## Common Tasks

### Adding New Jokes
Edit the `demoJokes` array in the JavaScript section:
```javascript
this.demoJokes = [
    {
        setup: "Your setup here",
        punchline: "Your punchline here"
    }
    // Add new jokes here
];
```

### Styling Changes
Modify the `<style>` section (lines ~8-80):
- Use existing @primer/css classes when possible
- Follow GitHub's design system colors
- Test responsive breakpoints: 768px, 480px

### API Changes
Update the `apiUrl` property in the `JokeGenerator` constructor

## Error Handling

The application gracefully handles:
- Network failures (falls back to demo jokes)
- API rate limiting (automatic retry with demo fallback)
- Blocked external resources (CDN CSS failures are non-fatal)
- Invalid API responses (validates joke structure)

## Deployment Notes

- **No build step required** - deploy `index.html` directly
- **CDN dependencies** - @primer/css loads from unpkg.com
- **GitHub Pages ready** - works immediately with Pages
- **Cross-origin** - API calls may be blocked in some environments (fallback handles this)

## Performance Considerations

- **Load time**: Near-instant (single HTML file + CDN CSS)
- **Bundle size**: ~15KB including all HTML, CSS, JavaScript
- **Runtime**: Minimal JS execution, no heavy frameworks
- **Caching**: Leverages CDN caching for @primer/css

## Troubleshooting

### Common Issues
1. **Jokes not appearing**: API blocked - this is normal, demo mode should activate
2. **Styling broken**: CDN blocked - app remains functional without external CSS
3. **Server errors**: Use different port (`python3 -m http.server 8081`)

### GitHub Actions
- **auto-assign.yml**: Auto-assigns issues/PRs to @joe10832
- **proof-html.yml**: Validates HTML structure on push

## Best Practices for AI Agents

1. **Always test changes** in browser - no automated testing exists
2. **Preserve single-file architecture** - don't split into separate files
3. **Maintain fallback behavior** - demo jokes must always work
4. **Follow existing code style** - consistent indentation and naming
5. **Update line number references** if making structural changes
6. **Test responsive design** - verify mobile layout after changes
7. **Check console errors** - use browser dev tools to debug
8. **Validate HTML structure** - GitHub Actions will fail if HTML is invalid

## Security Notes

- HTML content is properly escaped via `escapeHtml()` method
- No user input stored or processed server-side
- External API calls use HTTPS
- No authentication or sensitive data handling

## Browser Compatibility

- **Modern browsers**: Full functionality (Chrome, Firefox, Safari, Edge)
- **Mobile browsers**: Responsive design tested
- **Legacy browsers**: Graceful degradation for older JavaScript features