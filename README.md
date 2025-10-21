# 🎉 Birthday Bash — A Flutter Birthday Surprise App

A pastel-themed, interactive Flutter app designed to surprise someone special on their birthday — featuring beautiful animations, heartfelt messages, cheerful icons, and **hourly birthday notifications** that make their day feel truly magical! 💖  

---

## ✨ Features

- 🎂 **Animated Splash Screen** — Greets the user with a fun birthday animation or GIF.  
- 💭 **Playful Dialog Screen** — Asks “Did you think I forgot?” — a fun twist before revealing the surprise.  
- 🎁 **Birthday Wishes Screen** — Displays loving messages, music, and icons in soft pastel tones.  
- 🔔 **Hourly Notifications** — Sends warm birthday wishes every hour throughout the day.  
- 🎵 **Built-in Music Player** — Plays cheerful birthday tunes like `birthday.m4a` and `Enchanted.m4a`.  
- 🌈 **Pastel UI Theme** — Consistent, elegant color palette and rounded buttons.  
- 💌 **Offline & Lightweight** — Works smoothly without heavy dependencies.  

---

## 🧠 Tech Stack

- **Framework:** Flutter (Dart)  
- **Notifications:** flutter_local_notifications  
- **Audio Playback:** audioplayers  
- **Permissions:** permission_handler  
- **Fonts:** Google Fonts + Custom font (*Caveat*)  
- **Design:** Pastel-themed Material UI  

---

## ⚙️ Installation Guide

### 1. Clone the Repository
```bash
git clone https://github.com/<your-username>/birthdaybash.git
cd birthdaybash
```

---

### 2. Install Dependencies
```bash
flutter pub get
```

---

### 3. Run the App
```bash
flutter run
```

---

### 4. Build the APK (optional)
```bash
flutter build apk --release
```

---

## 🧩 Folder Structure

```
birthdaybash/
│
├── lib/
│   ├── main.dart              # Main app logic and screens
│
├── assets/
│   ├── audio/
│   │   ├── birthday.m4a
│   │   └── Enchanted.m4a
│   ├── images/
│   │   └── heart.gif
│   └── fonts/
│       └── Caveat.ttf
│
├── pubspec.yaml               # Dependencies and asset config
└── README.md
```

---

## 🕓 Setting Up Hourly Notifications

To enable hourly birthday reminders:

1. Add this dependency (already included in your `pubspec.yaml`):
   ```yaml
   flutter_local_notifications: ^17.1.2
   ```
2. Initialize notifications in `main.dart` (in `initState` or a dedicated service).  
3. Schedule periodic notifications using:
   ```dart
   periodicallyShow(
     0,
     '🎉 Happy Birthday!',
     'Wishing you joy and love every hour 💕',
     RepeatInterval.hourly,
     notificationDetails,
   );
   ```
> 💡 **Note:** Works best on real devices, not emulators.

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

- 🎈 Confetti animation on splash entry  
- 🧁 Add personalized message editor  
- 💫 Integrate cloud sync for storing greetings  
- 🎶 Option to upload custom songs  

---

## 🧑‍💻 Author

**Developed by:** [Manahil Sabir](https://github.com/minni-developer)  
**Email:** manahilsabir544@gmail.com  
**LinkedIn:** [Manahil Sabir](https://www.linkedin.com/in/manahil-sabir)

---

### 🌟 “A little surprise, every hour — because some birthdays deserve to last all day!”
