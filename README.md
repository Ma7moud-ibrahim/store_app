# 🛍️ App Store

A modern Flutter e-commerce application built to demonstrate a complete shopping experience, including user authentication, profile management, product browsing, shopping cart functionality, and real-time location tracking.

## ✨ Features

### 🔐 Authentication & Registration
- Phone number authentication using Firebase Authentication.
- OTP-based phone verification.
- New user registration flow.
- Secure user authentication.
- User profile setup after registration.

### 👤 User Profile
- Create and manage user profiles.
- Add and update profile information.
- Upload a profile picture using the camera or gallery.
- Display saved user information.
- Facebook profile synchronization.

### 🛒 E-Commerce
- Browse products fetched from a REST API.
- View product details.
- Add products to the shopping cart.
- Manage cart items.
- Product categories.
- Search for products.

### 📍 Location & Maps
- Display the user's current location.
- Real-time location tracking.
- Interactive Google Maps integration.
- Location permissions handling.

### 🎨 UI & UX
- Clean and responsive Flutter UI.
- Reusable custom widgets.
- Form validation.
- Loading states and user feedback.
- Custom navigation and bottom navigation bar.

---

## 🛠️ Tech Stack

| Technology | Purpose |
|------------|---------|
| **Flutter** | Cross-platform mobile development |
| **Dart** | Programming language |
| **Firebase Authentication** | Phone & OTP authentication |
| **Cloud Firestore** | User data storage |
| **Google Maps** | Map and location visualization |
| **Geolocator** | Device location services |
| **Image Picker** | Camera and gallery image selection |
| **Facebook Auth** | Facebook authentication/profile synchronization |
| **REST API** | Product data |
| **HTTP** | API communication |

### Main Packages

- [`image_picker`](https://pub.dev/packages/image_picker)
- [`flutter_facebook_auth`](https://pub.dev/packages/flutter_facebook_auth)
- [`google_maps_flutter`](https://pub.dev/packages/google_maps_flutter)
- [`geolocator`](https://pub.dev/packages/geolocator)
- [`firebase_auth`](https://pub.dev/packages/firebase_auth)
- [`cloud_firestore`](https://pub.dev/packages/cloud_firestore)

---

## 📱 Screenshots

### Authentication & Registration

<table>
  <tr>
    <td align="center">
      <img width="200" alt="Onboarding" src="https://github.com/user-attachments/assets/d7a5ce7d-fdf1-4b07-8787-ebe2cd780edf" /><br/>
      <sub><b>Onboarding</b></sub>
    </td>
    <td align="center">
      <img width="200" alt="Login" src="https://github.com/user-attachments/assets/5942ad0a-0139-4571-be70-13e4f4f1ab61" /><br/>
      <sub><b>Login</b></sub>
    </td>
    <td align="center">
      <img width="200" alt="Registration" src="https://github.com/user-attachments/assets/3f5713e6-c87f-4d09-a1fd-0b4a244f52c7" /><br/>
      <sub><b>Registration</b></sub>
    </td>
  </tr>
  <tr>
    <td align="center">
      <img width="150" alt="Your Information" src="https://github.com/user-attachments/assets/169c8aef-11da-46ec-82dd-4cdc2002a78d" /><br/>
      <sub><b>Your Information</b></sub>
    </td>
    <td align="center">
      <img width="150" alt="Image Picker" src="https://github.com/user-attachments/assets/e01a7460-86b4-4ce7-9491-7c3b297afdeb" /><br/>
      <sub><b>Image Picker</b></sub>
    </td>
    <td align="center">
      <img width="150" alt="Facebook Sync" src="https://github.com/user-attachments/assets/3c9b56e7-d57b-4a1b-a2a7-5f39d062384f" /><br/>
      <sub><b>Facebook Sync</b></sub>
    </td>
  </tr>
</table>

### Products & Shopping

<table>
  <tr>
    <td align="center">
      <img width="150" alt="Home" src="https://github.com/user-attachments/assets/169c8aef-11da-46ec-82dd-4cdc2002a78d" /><br/>
      <sub><b>Home</b></sub>
    </td>
    <td align="center">
      <img width="150" alt="Product Details" src="https://github.com/user-attachments/assets/62d608d2-36c2-4f31-baf9-7f9e27d4c675" /><br/>
      <sub><b>Product Details</b></sub>
    </td>
    <td align="center">
      <img width="150" alt="Cart" src="https://github.com/user-attachments/assets/a1a58dec-e86c-4008-b1ac-cb7a1334f828" /><br/>
      <sub><b>Shopping Cart</b></sub>
    </td>
  </tr>
</table>

### Profile & Location

<table>
  <tr>
    <td align="center">
      <img width="150" alt="Profile" src="https://github.com/user-attachments/assets/47d92354-e969-4acd-b61f-c6bc16c5fdf3" /><br/>
      <sub><b>Profile</b></sub>
    </td>
    <td align="center">
      <img width="150" alt="Live Location" src="https://github.com/user-attachments/assets/37d5c249-d67f-425c-9837-301fd9eea166" /><br/>
      <sub><b>Live Location</b></sub>
    </td>
  </tr>
</table>

---

## 🏗️ Architecture & Project Structure

The project follows a modular structure with reusable widgets, models, services, and screens.

```text
lib/
├── assets/
│   └── images/
├── helper/
├── models/
├── screens/
├── services/
├── widget/
└── main.dart
