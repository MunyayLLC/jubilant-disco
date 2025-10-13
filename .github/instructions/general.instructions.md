# General Coding Agent Instructions

## Project Overview
This repository contains a Random Joke Generator web application. Please refer to `.github/copilot-instructions.md` for comprehensive project-specific instructions.

## General Guidelines for All Agents

### Code Quality Standards
- **Minimal Changes**: Make the smallest possible changes to achieve the goal
- **Preserve Functionality**: Never break existing working code unless absolutely necessary
- **Test Thoroughly**: Always validate changes using the manual testing protocol in copilot-instructions.md

### Development Workflow
1. **Read Project Instructions**: Always consult `.github/copilot-instructions.md` first
2. **Install Dependencies**: Run `npm install` (takes ~1 second)
3. **Start Development Server**: Use `python3 -m http.server 8080`
4. **Test Changes**: Manually validate all functionality in browser
5. **Validate HTML**: Ensure GitHub Actions will pass

### File Structure Understanding
- `index.html`: Single-page application with embedded CSS and JavaScript
- `package.json`: Only dependency is @primer/css
- `.github/workflows/`: Auto-assignment and HTML validation
- No build process required

### Testing Requirements
- **Manual Testing Required**: No automated test suite exists
- **Browser Validation**: Test joke generation functionality
- **Responsive Design**: Verify mobile layout works
- **Error Handling**: Confirm API fallback to demo jokes

### Security Considerations
- HTML escaping implemented for user-facing content
- External API integration with graceful degradation
- No sensitive data handling required

## Agent-Specific Notes
- See `AGENTS.md` for detailed agent behavior guidelines
- See `CLAUDE.md` for Claude-specific instructions
- See `GEMINI.md` for Gemini-specific instructions

## Quick Reference
```bash
# Setup
npm install && python3 -m http.server 8080

# Test URL
http://localhost:8080

# Key validation: Click "Get a Joke" button multiple times
```