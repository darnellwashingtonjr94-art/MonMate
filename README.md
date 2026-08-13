# ♟️ MonMate
> High-Frequency Web3 Chess with Real-Time Social Betting on Monad.

[![Monad Network](https://img.shields.io/badge/Network-Monad_Mainnet-6B4DFF?style=for-the-badge&logo=monero&logoColor=white)](https://monad.xyz)
[![UI](https://img.shields.io/badge/UI-Animated_Monad_Pulse-6B4DFF?style=for-the-badge)](#)
[![Web3](https://img.shields.io/badge/Web3-EVM_Compatible-3C3C3D?style=for-the-badge&logo=ethereum&logoColor=white)](#)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)](https://opensource.org/licenses/MIT)

---

###  MonMate ♟️

**What is this and what does it do?**
MonMate is a special chess game for your phone. But it's not just regular chess! While you are moving your pieces, you can see and talk to the person you are playing against using video chat. You can also safely bet digital money (cryptocurrency) on who will win the game!

**How does this work?**
Think of it like a team of smart robots working inside your phone:
*   **The Artist Robot (Flutter & Dart):** This robot draws the chess board, the buttons, and makes the app look pretty on your screen.
*   **The Camera Robot (LiveKit):** This robot turns on your camera and microphone so you can talk to your friends while you play.
*   **The Matchmaker Robot (Supabase):** This robot keeps track of who is online and helps you find a game to join.
*   **The Rule-Keeper Robot (Solidity on Monad):** This is a super-strict robot that holds onto the digital money while you play. When someone wins, this robot automatically gives the prize money to the winner. Nobody can cheat it!

**Why is this cool?**
It's cool because it puts a bunch of awesome things together! You get to play a brain game, talk smack with your friends on video, and use futuristic digital money all at the exact same time. Plus, it uses a super-fast network (called Monad), so the money moves in the blink of an eye without any annoying lag. 

**How to install this?**
To put this on your computer, you have to be a little bit of a builder. Here are the basic steps:
1.  **Download the Code:** Copy the game's folder to your computer.
2.  **Get the Builder Tools:** You need a tool called **Flutter** (to build the phone app) and a tool called **Foundry** (to build the digital money rules). 
3.  **Download the Pieces:** Run a command like `flutter pub get` so your computer downloads all the extra pieces the app needs to work.
4.  **Add Your Secret Keys:** You have to create a special file called `.env` where you put your secret passwords. This lets the app connect to the internet to use the video chat and the digital money.
5.  **Press Play:** Once everything is set up, you tell your computer to run the app, and the chess board will pop up on your screen!

## 🚀 Key Features

* **⚡ Monad High-Speed Betting:** Sub-second wager settlement and ultra-low gas fees using native $MON.
* **🎥 Live Social Hub:** HD Video, Audio, and Messenger integration for real-time trash talk and strategy.
* **💓 Pulsing UI:** Dynamic, code-generated background effects inspired by high-frequency node monitoring.
* **📺 Universal Logic:** A single codebase optimized for high-performance on Phones, Tablets, and Android-based IoT displays.
* **📶 Offline Resilience:** Full move validation and PGN tracking even when the network is dark.

## 🛠️ Technical Architecture

| Layer | Technology Stack |
| :--- | :--- |
| **Frontend** | Flutter (Dart 3.x) |
| **Blockchain** | Monad (EVM-compatible) via `web3dart` |
| **Social/Real-time** | LiveKit (WebRTC) & Supabase Presence |
| **Offline DB** | Isar (High-performance NoSQL) |
| **Smart Contracts** | Solidity (Foundry Toolchain) |

## 📦 Project Structure

```text
/monmate
├── contracts/              # Solidity betting contracts (Forge/Foundry)
├── assets/                 # High-res Monad & Chess branding assets
├── lib/
│   ├── core/               # PulsingBackground UI & Theme engine
│   ├── features/
│   │   ├── chess/          # Move validation & PGN logic
│   │   ├── social/         # Video, Audio, & Messenger providers
│   │   └── wallet/         # $MON Wager management & Web3 Connect
│   └── main.dart           # Adaptive entry point
└── README.md
