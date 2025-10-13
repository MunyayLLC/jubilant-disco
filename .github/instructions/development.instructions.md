# Development Workflow Instructions

## For GitHub Copilot Coding Agents

### Pre-Development Checklist
- [ ] Read `.github/copilot-instructions.md` thoroughly
- [ ] Understand this is a vanilla HTML/CSS/JS project (no build process)
- [ ] Confirm the single-page application architecture
- [ ] Note the @primer/css dependency usage

### Development Environment Setup
```bash
# Required setup (validated timings from copilot-instructions.md)
npm install          # ~1 second
python3 -m http.server 8080  # Instant start
```

### Code Modification Guidelines

#### HTML Changes (`index.html`)
- **Structure**: Lines 1-80 contain HTML structure and CSS
- **Logic**: Lines 81-281 contain JavaScript JokeGenerator class
- **Testing**: Always test in browser after HTML changes
- **Validation**: Ensure HTML remains valid for GitHub Actions

#### JavaScript Modifications
- **Class**: All functionality in `JokeGenerator` class
- **API**: External joke API with demo fallback array
- **Error Handling**: Graceful degradation implemented
- **Security**: HTML escaping for user content

#### CSS Styling
- **Framework**: Uses @primer/css via CDN
- **Custom Styles**: Embedded in `<style>` section
- **Responsive**: Mobile-first responsive design
- **Testing**: Verify responsive behavior

### Mandatory Testing Protocol
1. **Start Server**: `python3 -m http.server 8080`
2. **Open Browser**: Navigate to `http://localhost:8080`
3. **Click "Get a Joke"**: Test multiple times (minimum 3)
4. **Verify Display**: Check setup + punchline format
5. **Test Responsive**: Resize browser window
6. **Check Console**: No JavaScript errors

### Common Development Scenarios

#### Adding New Features
- Modify HTML structure in `<body>` section
- Add CSS in `<style>` section (lines ~8-80)
- Extend JokeGenerator class functionality
- Test immediately with local server

#### Debugging Issues
- Use browser dev tools for JavaScript errors
- Check network tab for API failures
- Verify demo fallback functionality
- Validate CSS specificity conflicts

#### Performance Optimization
- Keep single-file architecture
- Minimize external dependencies
- Test with API blocked (fallback mode)
- Ensure instant load times

### Integration Points
- **GitHub Actions**: auto-assign.yml and proof-html.yml
- **External API**: `https://official-joke-api.appspot.com/jokes/random`
- **CDN Dependencies**: @primer/css
- **Demo Mode**: Fallback joke array when API unavailable

### Quality Assurance
- **Manual Testing**: Required for all changes
- **HTML Validation**: Automated via GitHub Actions
- **No Unit Tests**: Project intentionally simple
- **Browser Compatibility**: Modern browsers only