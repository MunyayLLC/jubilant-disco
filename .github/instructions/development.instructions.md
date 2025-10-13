# Development Instructions - Random Joke Generator

## Project Configuration

**Language**: JavaScript (ES6+)  
**Framework**: Vanilla HTML/CSS/JS  
**Dependencies**: @primer/css  
**Build Process**: None  
**Testing**: Manual browser testing  

## Quick Development Setup

```bash
npm install                     # ~1 second
python3 -m http.server 8080    # Start dev server
```

**Test URL**: http://localhost:8080

## Core Development Rules

1. **Single-file architecture**: Everything in `index.html`
2. **No build process**: Direct file editing only
3. **Manual testing required**: No automated test suite
4. **Preserve fallback system**: Demo jokes must always work
5. **Security first**: Always use `escapeHtml()` for dynamic content

## File Structure

- `index.html` - Main application (HTML + CSS + JavaScript)
- `package.json` - Dependencies (@primer/css only)
- `.github/copilot-instructions.md` - Comprehensive instructions
- `AGENTS.md` - General AI agent guidelines
- `CLAUDE.md` - Claude-specific instructions  
- `GEMINI.md` - Gemini-specific instructions

## Testing Checklist

After any changes, verify:
- [ ] "Get a Joke" button works
- [ ] Jokes display correctly (setup + punchline)  
- [ ] Demo mode activates when API fails
- [ ] Mobile responsive design works
- [ ] No JavaScript console errors
- [ ] HTML validation passes (GitHub Actions)

## Common Tasks

### Add Demo Joke
```javascript
// In constructor(), add to demoJokes array:
{
    setup: "Your setup here",
    punchline: "Your punchline here"
}
```

### Modify Styling  
```css
/* In <style> section (lines ~8-80) */
.joke-container {
    /* Add your styles */
}
```

### API Changes
```javascript
// In constructor():
this.apiUrl = 'your-new-api-endpoint';
```

## Security Requirements

- Always use `escapeHtml()` for user content
- Validate API responses before display
- Handle network failures gracefully
- No sensitive data storage

## Performance Guidelines

- Keep bundle size minimal (~15KB current)
- Leverage CDN for @primer/css
- Minimize DOM manipulations
- No heavy JavaScript frameworks

## Browser Support

- **Modern browsers**: Full functionality
- **Mobile**: Responsive design tested
- **Legacy**: Graceful degradation