# Work Item Search Widget

## Overview

The Work Item Search Widget is a powerful Azure DevOps dashboard extension that enhances your work item search capabilities with intelligent field detection, flexible date filtering, and smart query building.

## Key Features

### 🔍 **Smart Search Capabilities**
- **100+ Field Support**: Search across all available work item fields in your project
- **Intelligent Field Detection**: Automatically detects field types (text, numeric, date, boolean)
- **Dynamic UI Adaptation**: Interface adapts based on selected field type

### 📅 **Advanced Date Search**
- **Flexible Date Input**: Date picker, preset options, or natural language
- **Smart Date Parsing**: Supports "today", "this week", "last month", day names, etc.
- **Precise Date Ranges**: Accurate date range queries for exact results

### 🔢 **Intelligent Numeric Search**
- **Partial Matching**: Search "12" to find items with "123", "1234", etc.
- **Exact Matching**: Full numeric precision when needed
- **Smart Operators**: Automatically selects appropriate WIQL operators

### ⚡ **Enhanced User Experience**
- **Enter Key Support**: Press Enter to search from any input field
- **Persistent Configuration**: Saves your preferred default search field
- **Modal Details**: Click any result for detailed work item information
- **Responsive Design**: Works seamlessly across different dashboard sizes

## Supported Widget Sizes

- **2x3**: Compact layout for basic searches
- **3x3**: Standard layout with full feature access
- **3x4**: Extended layout for optimal viewing

## Installation

1. Download the latest `.vsix` file from the [GitHub releases](https://github.com/draj0/azure-work-item-search/releases)
2. Upload to your Azure DevOps organization or Visual Studio Marketplace
3. Add the widget to your dashboard

Alternatively, install directly from the Visual Studio Marketplace (https://marketplace.visualstudio.com/azuredevops) by searching for "Work Item Search Widget".

## Usage

### Basic Search
1. Select a field from the dropdown (Title, Description, Tags, etc.)
2. Enter your search term
3. Click Search or press Enter

### Date Search
1. Select any date field (Created Date, Changed Date, etc.)
2. Choose from:
   - **Date Picker**: Select specific dates
   - **Preset Options**: Today, this week, last month, etc.
   - **Custom Text**: Type natural language like "yesterday"

### Configuration
1. Click the ⚙️ settings icon
2. Select your preferred default search field
3. Save configuration (stored locally per browser)

## Field Types Supported

- **Text Fields**: Title, Description, Comments (uses CONTAINS operator)
- **Numeric Fields**: ID, Story Points, Priority (supports partial and exact matching)
- **Date Fields**: Created Date, Changed Date, Closed Date (intelligent date parsing)
- **Identity Fields**: Assigned To, Created By (searches display names)
- **Boolean Fields**: True/false value matching
- **Picklist Fields**: State, Work Item Type, etc.

## Technical Details

### Architecture
- Built with VSS SDK for Azure DevOps integration
- Uses WIQL (Work Item Query Language) for efficient searching
- localStorage for configuration persistence
- Responsive HTML5/CSS3/ES6 implementation

### Performance
- Optimized API calls with batched work item retrieval
- Efficient DOM manipulation and event handling
- Minimal network requests with intelligent caching

### Security
- Uses Azure DevOps REST API authentication
- Minimal required permissions (vso.work scope only)
- XSS protection with proper input sanitization

## Version History

### 1.0.0
Initial release

### 1.0.2
Better close for work item detail popup

## Support

For issues, feature requests, or contributions:
- **GitHub Repository**: [azure-work-item-search](https://github.com/draj0/azure-work-item-search)
- **Report Issues**: [GitHub Issues](https://github.com/draj0/azure-work-item-search/issues)
- **Documentation**: [Getting Started](https://github.com/draj0/azure-work-item-search#readme)

## License

MIT License - see LICENSE file for details

---

**Enhance your Azure DevOps workflow with intelligent work item search capabilities!**