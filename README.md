# iMirror

# Low-Latency Wireless Monitor and Input Tablet

### Description

- This project transforms an iPad into a wireless, low-latency secondary monitor and Apple Pencil input tablet
- It streams desktop screen frames to the iPad in near real-time and captures Apple Pencil input (with pressure and tilt) for display and interaction on the computer

---

## NOTICE

- Please read through this `README.md` to better understand the project's source code and setup instructions
- Also, make sure to review the contents of the `License/` directory
- Your attention to these details is appreciated — enjoy exploring the project!

---

## Problem Statement

- Commercial tools like Duet Display or Astropad Studio offer screen mirroring and input capabilities but are often costly, proprietary, or lack customization
- This project aims to create an open-source, customizable system that provides a high-performance, LAN-based alternative with full Apple Pencil support

---

## Project Goals

### Real-Time Display Streaming

- Stream PC or laptop display frames to an iPad with minimal latency using efficient image encoding

### Bi-Directional Interaction

- Capture Apple Pencil input on the iPad and send the data (position, pressure, tilt) back to the PC for display or interaction

---

## Tools, Materials & Resources

### iPad App

- Developed using Swift with UIKit or SwiftUI, leveraging UIPencilInteraction to capture stylus input

### PC Server

- Built with Python (FastAPI and WebSocket), C#, or Node.js for serving screen frames and receiving input events

### Streaming & Data

- WebSocket for two-way communication; JPEG or PNG encoding for frame transmission; JSON for stroke data

---

## Design Decision

### WebSocket-Based Pipeline

- Chosen for efficient, low-latency bi-directional communication over LAN

### Modular Architecture

- Separate iPad and PC modules allow rapid testing and component replacement (e.g., swap OpenCV with PyQt)

### Binary + JSON Protocol

- Stream binary image frames and send Pencil data as lightweight JSON packets for clarity and performance

---

## Features

### Wireless Screen Streaming

- Stream PC screen content in near real-time using binary-encoded JPEG frames

### Apple Pencil Data Capture

- Capture position, pressure, and tilt using native iOS APIs and forward input to the PC

### Two-Way Communication

- Establish a low-latency WebSocket or UDP tunnel between devices for interactivity

---

## Block Diagram

```plaintext
                                  ┌─────────────────────┐
                                  │     PC or Laptop    │
                                  ├─────────────────────┤
                                  │ - Capture screen    │
                                  │ - Encode as JPEG    │
                                  │ - Send via WebSocket│
                                  │ - Receive strokes   │
                                  └─────────┬───────────┘
                                            │
                                   WebSocket/UDP Tunnel
                                            │
                                  ┌─────────▼─────────────┐
                                  │    iPad (iOS App)     │
                                  ├───────────────────────┤
                                  │ - Display image stream│
                                  │ - Capture Pencil input│
                                  │ - Transmit strokes    │
                                  └───────────────────────┘

```

---

## Functional Overview

- Capture and encode screen images from the host computer
- Stream the images to the iPad over a WebSocket connection
- Use the iPad to capture Apple Pencil strokes
- Send stroke data back to the PC in JSON format
- Render the strokes on the PC interface in real-time

---

## Challenges & Solutions

### Network Latency and Performance

- Used JPEG for lightweight encoding and WebSocket to minimize protocol overhead

### Capturing Apple Pencil Data

- Implemented UIPencilInteraction and touchesMoved in Swift to get high-resolution stylus data

---

## Lessons Learned

### Real-Time Streaming Over LAN

- Achieved high-performance display streaming using WebSocket and frame compression

### Advanced Swift Interaction APIs

- Learned native methods to capture stylus input with pressure and tilt support

---

## Project Structure

```plaintext
root/
├── License/
│   ├── LICENSE.md
│   │
│   └── NOTICE.md
│
├── .gitattributes
│
├── .gitignore
│
└── README.md

```

---

## Future Enhancements

- Add gesture support and dynamic cursor rendering
- Implement WebRTC or QUIC for even lower latency
- Embed drawing canvas into the iPad app
- Add secure pairing and encrypted transport
- Package entire system with Docker and build pipeline
