# 🖥️ iPad as a Low-Latency Wireless Monitor + Drawing Tablet

This project turns an iPad into a **wireless second display** and **input tablet** using Apple Pencil — similar to Duet Display or Astropad Studio, but self-built and optimized for LAN performance. It streams real-time frames from a computer to the iPad while sending Apple Pencil input back for interaction, sketching, or handwriting.

---

## 🔍 Problem Statement

While there are commercial tools that enable screen mirroring and Apple Pencil drawing to a computer, they are often expensive, proprietary, or limited in customization. I wanted to:

- Build an **open-source solution** that streams my PC screen to an iPad in real-time
- Capture **Apple Pencil input** and mirror it back to the PC
- Achieve **low latency** with minimal encoding or overhead
- Deepen my understanding of **real-time streaming, mobile sockets, and custom UI rendering**

---

## 🎯 Project Goals

- 🖼️ **Stream PC screen content** (as image frames) to iPad in near real-time
- ✏️ **Capture and transmit Apple Pencil input** (with pressure and tilt) from iPad to PC
- 🔄 Create a **bi-directional WebSocket or UDP pipeline**
- 🧪 Build a responsive and minimal user interface on both devices
- 📶 Enable stable LAN communication with low latency and minimal CPU usage
- 🛠️ Make the system **modular and extensible** (e.g. add gesture control or drawing playback)

---

## 🛠️ Tools & Technology Stack

| Component             | Technology                                 |
|-----------------------|--------------------------------------------|
| 📲 iPad App           | Swift + UIKit / SwiftUI, `UIPencilInteraction` |
| 📡 Network Protocols  | WebSocket (binary), UDP (optional)         |
| 🧠 Data Format        | JSON (stroke data), JPEG/PNG (image stream)|
| 💻 PC Server          | Python (FastAPI / WebSocket), or C#/Node.js |
| 🎨 PC Canvas Renderer | OpenCV / Tkinter / PyQt / WPF              |
| 🖼️ Video Streaming    | `UIImageView` or `Metal` on iOS            |

---

## 🧩 Design Decisions

- Chose **WebSocket** for bi-directional low-latency communication and ease of implementation
- Used **binary image streaming** (e.g. JPEG or PNG) over WebSocket to avoid video codec overhead
- Designed a **modular Swift app** that:
    - Displays streamed frames
    - Captures touch and Pencil data
- On PC side, used **Python** with WebSocket server and GUI toolkit (e.g. Tkinter, PyQt, or OpenCV) for rapid testing and cross-platform compatibility

---

## ⚔️ Challenges & Solutions

| Challenge                              | Solution                                                                |
|---------------------------------------|-------------------------------------------------------------------------|
| Handling image transmission           | Streamed JPEG frames via binary WebSocket messages                      |
| Capturing Apple Pencil input data     | Used `touchesMoved` and `UIPencilInteraction` APIs in Swift             |
| Transmitting input back to PC         | Sent strokes as JSON packets with position, pressure, tilt              |
| Rendering on PC with real-time updates| Used OpenCV/PyQt canvas with draw loop and buffer clearing              |
| Achieving low latency on WiFi         | Tuned packet sizes, compression quality, and disabled full video encoding |

---

## 📚 Lessons Learned

- Built end-to-end **LAN-based streaming pipeline** using WebSockets
- Learned how to **capture high-fidelity Pencil input** including pressure and tilt
- Gained experience in Swift/iOS native UI development and socket programming
- Explored image compression, buffering, and real-time UI rendering in Python
- Managed **synchronization and data flow** between two asynchronously updating UIs

---

## 🖼️ Architecture Overview

```plaintext
         +---------------------+               +----------------------------+
         |     PC or Laptop    |               |         iPad (iOS App)     |
         |---------------------|               |----------------------------|
         | - Captures screen   |               | - Receives image stream    |
         | - Encodes to JPEG   |  WebSocket    | - Displays UIImageView     |
         | - Sends binary img  | <===========> |                            |
         | - Receives Pencil   |               | - Sends strokes            |
         |   strokes           |               | - Coordinates + pressure   |
         | - Renders input     |               +----------------------------+
         +---------------------+
