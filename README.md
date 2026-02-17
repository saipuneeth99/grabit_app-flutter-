# 🚀 Grab - Last Minute App

A Flutter-based mobile application for quick and convenient grocery, dairy, and essentials delivery. Get your everyday needs delivered to your doorstep in minutes!

**A Student Project**

---

## 📋 Table of Contents

- [Features](#features)
- [Screenshots](#screenshots)
- [Tech Stack](#tech-stack)
- [Project Structure](#project-structure)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [How to Run](#how-to-run)
- [App Architecture](#app-architecture)
- [Key Features Breakdown](#key-features-breakdown)

---

## ✨ Features

- **User Authentication**: Secure phone number-based OTP verification system
- **Multiple Categories**: Browse Grocery, Medicines, Food, and Liquor items
- **Store Discovery**: Find all nearby stores with real-time availability
- **Product Catalog**: Browse hundreds of products with details, pricing, and discounts
- **Shopping Cart**: Add/remove items, manage cart with real-time total calculation
- **Order Tracking**: Real-time delivery tracking with driver information
- **Easy Checkout**: Smooth checkout process with order confirmation
- **Responsive UI**: Works seamlessly on all device sizes
- **Fast Delivery**: Track your order from confirmation to delivery

---

## 📱 Screenshots

### Splash Screen
<div align="center">
  <img src="docs/00_splash.jpg" width="30%" alt="Splash Screen" />
</div>

### Authentication Flow
**Login Screen** → **OTP Verification**
<div align="center">
  <img src="docs/01_login.jpg" width="30%" alt="Login Screen" />
  <img src="docs/02_otp.jpg" width="30%" alt="OTP Verification" />
</div>

### Home & Shopping
**Home Page with Categories** → **Product Selection** → **Snacks Page**
<div align="center">
  <img src="docs/03_home.jpg" width="30%" alt="Home Page" />
  <img src="docs/04_vegetables_dairy.jpg" width="30%" alt="Products" />
  <img src="docs/05_snacks.jpg" width="30%" alt="Snacks" />
</div>

### Cart & Checkout
**Shopping Cart** → **Checkout**
<div align="center">
  <img src="docs/06_cart.jpg" width="30%" alt="Your Cart" />
</div>

### Order Tracking
**Real-time Delivery Tracking**
<div align="center">
  <img src="docs/08_order_tracking.jpg" width="30%" alt="Order on the Way" />
</div>

---

## 🛠️ Tech Stack

- **Framework**: Flutter (Dart)
- **Architecture**: Multi-page navigation with state management
- **UI Components**: Custom widgets and Material Design
- **Platforms**: 
  - iOS (xcode with Swift)
  - Android (gradle with Kotlin)
  - Web support
  - Linux & macOS (desktop builds)

---

## 📁 Project Structure

```
lib/
├── main.dart                    # App entry point
└── welcome_pages/
    ├── login_page.dart          # Phone number verification
    ├── otp_page.dart            # OTP verification
    ├── home_page.dart           # Main home screen
    ├── dairy_page.dart          # Dairy products listing
    ├── snacks_page.dart         # Snacks products listing
    ├── delivery_page.dart       # Order delivery tracking
    ├── cart_page.dart           # Shopping cart
    └── cart_model.dart          # Cart state management

assets/
└── images/                      # Product images and logos

android/                         # Android native code
ios/                            # iOS native code
macos/                          # macOS desktop code
linux/                          # Linux desktop code
web/                            # Web build files
```

---

## 📦 Prerequisites

Before you begin, ensure you have the following installed:

- **Flutter SDK** (v3.0.0 or higher)
- **Dart SDK** (included with Flutter)
- **Android Studio** or **Xcode** (for mobile development)
- **Git**

Check Flutter installation:
```bash
flutter --version
dart --version
```

---

## ⚙️ Installation

### 1. Clone the Repository
```bash
git clone <repository-url>
cd project_1
```

### 2. Install Dependencies
```bash
flutter pub get
```

### 3. Generate Required Files (if applicable)
```bash
flutter pub run build_runner build
```

---

## 🚀 How to Run

### Run on Emulator/Simulator

**Android**:
```bash
flutter emulators --launch <emulator-name>
flutter run
```

**iOS**:
```bash
open ios/Runner.xcworkspace
flutter run
```

### Run on Physical Device
```bash
flutter run
```

### Build Release APK (Android)
```bash
flutter build apk --release
```

### Build IPA (iOS)
```bash
flutter build ios --release
```

### Build for Web
```bash
flutter build web
```

---

## 🏗️ App Architecture

### Page Flow

```
Login Page (Phone Entry)
    ↓
OTP Verification Page
    ↓
Home Page (Category Selection & Store Discovery)
    ↓
Product Pages (Dairy, Snacks, etc.)
    ↓
Shopping Cart (Manage Items)
    ↓
Checkout & Order Placement
    ↓
Delivery Tracking Page
```

### State Management

The app uses a `cart_model.dart` for managing:
- Cart items
- Product quantities
- Price calculations
- Total amount

---

## 🎯 Key Features Breakdown

### 1. **Authentication (login_page.dart, otp_page.dart)**
- Phone number validation
- OTP-based verification system
- Secure user session management

### 2. **Product Browsing (home_page.dart, dairy_page.dart, snacks_page.dart)**
- Category-wise product display
- Product details with pricing
- Real-time discount information
- Wishlist/Favorite functionality

### 3. **Shopping Cart (cart_page.dart, cart_model.dart)**
- Add/remove items dynamically
- Quantity management
- Real-time price calculation
- Cart persistence

### 4. **Order Tracking (delivery_page.dart)**
- Real-time delivery status updates
- Driver information and contact
- Estimated delivery time
- Location tracking on map

---

## 🔧 Development

### Formatting Code
```bash
flutter format lib/
```

### Analyzing Code
```bash
flutter analyze
```

### Running Tests
```bash
flutter test
```

---

## 📝 Notes

- This is a student project developed as part of learning Flutter development
- The UI/UX is designed based on grocery delivery app patterns
- Currently demonstrating core functionality with mock data
- Ready for backend API integration

---

## 📞 Support & Contribution

For issues, suggestions, or contributions, please reach out or submit a pull request.

---

## 📄 License

This project is created for educational purposes.

---

## 🙏 Acknowledgments

- Flutter and Dart teams for the excellent framework
- Material Design for UI inspiration
- The open-source community

---

**Happy Coding! 🎉**
