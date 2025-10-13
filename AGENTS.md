# AI Coding Agent Guidelines

This document provides guidelines for AI coding agents working on this Random Joke Generator repository.

## Primary Instructions
**CRITICAL**: Always consult `.github/copilot-instructions.md` first - it contains comprehensive, project-specific instructions that override general guidelines.

## Repository Context
- **Type**: Single-page web application (vanilla HTML/CSS/JavaScript)
- **Architecture**: No build process, direct file editing
- **Dependencies**: Only @primer/css via CDN
- **Testing**: Manual browser testing required (no automated tests)

## Agent Behavior Guidelines

### 1. Information Hierarchy
1. **Primary**: `.github/copilot-instructions.md` (comprehensive project guide)
2. **Secondary**: `.github/instructions/*.instructions.md` (workflow guidance)
3. **Tertiary**: This file and agent-specific files (CLAUDE.md, GEMINI.md)

### 2. Code Modification Principles
- **Minimal Changes**: Make the smallest possible modifications
- **Preserve Working Code**: Never break existing functionality
- **Single File Focus**: All application code is in `index.html`
- **No Build Process**: Direct editing and immediate testing

### 3. Required Validation Steps
```bash
# Setup (every session)
npm install                    # ~1 second
python3 -m http.server 8080   # Instant

# Browser testing (after any change)
# 1. Open http://localhost:8080
# 2. Click "Get a Joke" button 3+ times
# 3. Verify jokes display correctly
# 4. Test responsive layout
```

### 4. Common Tasks

#### Feature Additions
- **Location**: `index.html` (single file contains everything)
- **CSS**: Add to `<style>` section (lines ~8-80)
- **JavaScript**: Modify `JokeGenerator` class (lines ~81-281)
- **HTML**: Update `<body>` structure as needed

#### Bug Fixes
- **Debug**: Use browser dev tools
- **API Issues**: Verify fallback to demo jokes works
- **Styling**: Check @primer/css conflicts
- **Validation**: Ensure HTML remains valid

#### Performance Optimization
- **Keep Simple**: Maintain single-file architecture
- **External Deps**: Minimize additions
- **Load Time**: Preserve instant loading
- **Fallback**: Ensure demo mode always works

### 5. Quality Standards
- **Manual Testing**: Always required (no automated tests)
- **HTML Validation**: Must pass GitHub Actions
- **Browser Compatibility**: Modern browsers
- **Responsive Design**: Mobile-first approach

### 6. Project-Specific Knowledge
- **Joke API**: `https://official-joke-api.appspot.com/jokes/random`
- **Demo Fallback**: Built-in joke array for offline operation
- **Styling**: Uses GitHub's @primer/css framework
- **Auto-Assignment**: Issues/PRs assigned to joe10832

### 7. Troubleshooting
- **Port Conflicts**: Use `python3 -m http.server 8081` if 8080 busy
- **API Blocked**: Normal behavior, demo jokes should still work
- **CSS Issues**: @primer/css CDN may be blocked in some environments

## Agent Communication
When working with this repository:
1. **Acknowledge** reading the primary instructions
2. **Confirm** understanding of single-file architecture
3. **Validate** changes using the manual testing protocol
4. **Report** any deviations from expected behavior

## Success Criteria
A successful agent interaction should:
- ✅ Follow `.github/copilot-instructions.md` guidelines
- ✅ Preserve existing functionality
- ✅ Pass manual browser testing
- ✅ Maintain HTML validation
- ✅ Keep changes minimal and focused