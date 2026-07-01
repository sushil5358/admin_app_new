# Solar Marketplace Admin App - Project Documentation

This project is a Flutter application designed for managing solar project quotations, leads, site surveys, and users. It serves as the administrative backbone for the Solar Marketplace ecosystem.

## 🏗 Architecture & Technologies
- **State Management:** [GetX](https://pub.dev/packages/get) (Controllers, Reactive state, Routing).
- **Network:** `http` package for REST API communication.
- **Local Storage:** `shared_preferences` for user session management.
- **Maps:** `google_maps_flutter` for site surveys and location tracking.
- **UI Components:** Material Design with custom styling defined in `AppColors` and `AppTheme`.

## 📁 Folder Structure & Key Files

### 1. Controllers (`lib/controller/`)
Handles the business logic and connects the UI with API services.
- **`login_controller.dart`**: Manages the authentication flow, OTP generation, and verification.
- **`add_quotation_companyUser_controller.dart`**: The most complex controller. Manages multi-step quotation creation, kit selection, price calculations (GST, Round-off, Margins), and data fetching for solar components.
- **`admin_quotes_controller.dart`**: Handles listing, filtering, and deleting quotations.
- **`survey_map_controller.dart`**: Manages the logic for site surveys using Google Maps, including marker placement and coordinate capturing.
- **`otp_controller.dart`**: General utility for OTP-based verification across different modules (like agreements).

### 2. Models (`lib/models/`)
Data classes for parsing JSON API responses into type-safe Dart objects.
- **`quickQuote_model.dart`**: The primary model for Quotations.
- **`combokit_Model.dart` / `customizeKit_model.dart`**: Models for pre-defined solar kits vs. custom configurations.
- **`solarPanel_model.dart`, `inverter_model.dart`, `bosKit_model.dart`**: Core hardware component models.
- **`commonItem_model.dart`**: A reusable model for dropdowns and simple ID/Name lists (Districts, Categories, etc.).

### 3. Screens (`lib/screens/`)
UI implementation using Flutter widgets.
- **`login_screen.dart`**: Entry point for authentication.
- **`dashbord_screen.dart` / `maindashbord_screen.dart`**: Main navigational hubs showing summaries and quick actions.
- **`add_quotation_companyUser.dart`**: A comprehensive form for generating new quotes.
- **`survey_map_screen.dart`**: Interface for conducting site surveys on a map.
- **`quote_pdf_view.dart`**: Displays the generated quotation PDF via a WebView or PDF viewer.

### 4. Services (`lib/sevices/` & `lib/services/`)
- **`api_services.dart` (in `lib/sevices/`)**: Contains all API endpoint definitions and network logic. This is the **active** service file.
- **`lib/services/api_services.dart`**: Currently an empty class; likely a legacy file or intended for a future refactor.
- **`retrofit.dart`**: Placeholder or utility for potential Retrofit integration.

### 5. Utilities & Styling
- **`appColors.dart`**: The central source of truth for the app's color palette, text styles, and common decorations.
- **`constants.dart`**: Stores app-wide constants like the Base URL and default padding.
- **`theme.dart`**: Configures the global `ThemeData` for the app.
- **`custome_snackbar.dart`**: Reusable utility for showing success/error messages.

## 🚀 Key Workflows

### Quotation Generation
1. Fetches metadata (Districts -> Categories -> Brands).
2. User selects between "Combo Kit" or "Customize Kit".
3. The controller fetches specific hardware rates and partner margins.
4. `calculateTotalAmount()` in the controller computes subtotal, GST, and grand total.
5. Submission sends a large JSON payload to the `mobile-quick-quote` endpoint.

### Site Survey
Uses Google Maps to allow users to pinpoint installation locations, which are then saved back to the server to assist in technical feasibility studies.

## 🛠 Maintenance Notes
- **API Base URL:** Defined in `lib/sevices/api_services.dart`. Currently points to a local/test IP (`192.168.1.6`). This needs to be updated for production.
- **Naming Convention:** Note that the folder `sevices` is a typo but is the one containing the active code. Renaming it will require updating imports throughout the project.
