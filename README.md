# 🎉 Birthday Surprise Flutter App

A pastel-themed, interactive Flutter app designed to surprise someone special on their birthday — featuring smooth navigation, cheerful icons, and **hourly birthday notifications** that remind them how loved they are! 💖

---

## ✨ Features

- 🎂 **Animated Splash Screen** — Welcomes the user with a birthday message.  
- 💭 **Fun Dialog Screen** — Asks, “Did you think I forgot?” before revealing the surprise.  
- 🎁 **Birthday Message Page** — Displays heartfelt wishes in a pastel UI.  
- 🔔 **Hourly Birthday Notifications** — Sends gentle reminders every hour to wish a happy birthday!  
- 🌈 **Pastel UI Design** — Soft, unified colors and rounded buttons for a smooth and joyful user experience.  
- 📱 **Lightweight & Fast** — Built with Flutter’s modern widget system for seamless performance.  

---

## 🧠 Tech Stack

- **Framework:** Flutter (Dart)  
- **State Management:** setState (no external dependencies)  
- **Notification Service:** flutter_local_notifications (or similar)  
- **Design:** Pastel-themed Material UI  

---

## ⚙️ Installation Guide

### 1. Clone the Repository
```bash
git clone https://github.com/<your-username>/birthday-surprise-app.git
cd birthday-surprise-app
```

---

## 🧩 Folder Structure

```
birthday_surprise_app/
│
├── lib/
│   ├── main.dart              # Main application entry
│
├── android/                   # Android build files
├── ios/                       # iOS build files
├── assets/                    # Placeholder for any images or icons
├── pubspec.yaml               # Dependencies and metadata
└── README.md
```

---

### 2. Install Dependencies
```bash
flutter pub get
```

### 3. Run the App
```bash
flutter run
```

### 4. Build APK (optional)
```bash
flutter build apk --release
```

---

## 🕓 Setting Up Hourly Notifications

To enable hourly birthday reminders:

1. Add the dependency in `pubspec.yaml`:
   ```yaml
   dependencies:
     flutter_local_notifications: ^17.0.0
   ```
2. Initialize the notification service in your `main.dart` file.  
3. Schedule notifications every hour using `periodicallyShow()`.  

> 💡 **Note:** Test on a physical device for accurate notification scheduling.

---

## 🎨 UI Theme Palette

| Element         | Color Name  | Hex Code  |
|-----------------|--------------|-----------|
| Primary Pink    | Pastel Pink  | `#F8BBD0` |
| Accent Purple   | Lavender     | `#E1BEE7` |
| Soft Blue       | Baby Blue    | `#BBDEFB` |
| Mint Green      | Pastel Mint  | `#C8E6C9` |
| Blush Outline   | Blush Pink   | `#F48FB1` |

---

## 💡 Future Enhancements

- 🎵 Background birthday tune on home screen  
- 🎈 Confetti animation upon splash entry  
- 🧁 Personalized message editor for each friend  

---

### 🌟 “A little surprise, every hour — because some birthdays deserve to last all day!”
