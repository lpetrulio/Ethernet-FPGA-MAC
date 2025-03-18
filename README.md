# Ethernet MAC Implementation on FPGA (Arty A7-100T)

## 📌 Project Overview  
This project implements an FPGA-based Ethernet MAC layer on the Arty A7-100T, enabling raw Ethernet frame transmission and reception via the onboard DP83848 PHY (MII interface). It demonstrates real-time packet processing and integrates FIFO buffering, CRC32 validation, clock domain crossing (CDC), and UART debugging for enhanced visibility.  

 **Media Independent Interface (MII) Ethernet Support**  
 **Hardware-Based Ethernet Frame Handling**  
 **Clock Domain Crossing (CDC) for Reliable Data Transfer**  
 **FIFO-Based Packet Buffering**  
 **CRC32 Validation for Data Integrity**  
 **UART Debugging for Packet Inspection**  

---

##  **Hardware & Tools**
### **Required Hardware**
- **FPGA Board:** Arty A7-100T  
- **Onboard Ethernet PHY:** DP83848 (Connected via MII)  
- **RJ45 Ethernet Cable**  
- **USB-to-Serial Adapter (For UART Debugging)**  
- **PC with Wireshark (For Ethernet Packet Monitoring)**  

###  **Software Tools**
- **Vivado** (FPGA Synthesis & Implementation)  
- **ModelSim** (Simulation & Verification)  
- **Tera Term / PuTTY** (UART Debugging)  
- **Wireshark** (Packet Capture & Debugging)  

---

## **Project Architecture**
├── src/
│ ├── ethernet_top.v # Top-level module integrating all components │ ├── ethernet_rx.v # Ethernet frame receiver (MII RX) │ ├── ethernet_tx.v # Ethernet frame transmitter (MII TX) │ ├── mac_filter.v # MAC address filtering │ ├── fifo_buffer.v # FIFO buffer for packet storage │ ├── crc32.v # CRC32 checksum module │ ├── uart_debug.v # UART debugging interface │ ├── clk_wiz_0.v # Clock Wizard (Generates 100MHz system clock) │ ├── constraints.xdc # FPGA pin mapping (MII & UART signals) │
├── sim/
│ ├── tb_ethernet_mac.v # Testbench for MAC module │ ├── tb_fifo.v # Testbench for FIFO buffering │
├── README.md # Project documentation
└── LICENSE # License file


---

## **System Architecture**
This design is composed of **multiple Verilog modules**, each performing a key function in the Ethernet communication pipeline.

### **1️⃣ Ethernet Frame Receiver (`ethernet_rx.v`)**
- Captures incoming **Ethernet frames** from the MII interface.  
- **Filters packets** based on MAC address.  
- Stores valid frames into a **FIFO buffer** for processing.  

### **2️⃣ Ethernet Frame Transmitter (`ethernet_tx.v`)**
- Reads packets from a **FIFO buffer**.  
- **Constructs raw Ethernet frames** and transmits them via **MII TX signals**.  
- Includes **CRC32 checksum generation** for packet validation.  

### **3️⃣ FIFO Buffer (`fifo_buffer.v`)**
- Temporarily stores **incoming & outgoing Ethernet packets**.  
- **Manages clock domain crossing (CDC)** between **RX_CLK and TX_CLK**.  

### **4️⃣ CRC32 Module (`crc32.v`)**
- Performs **Ethernet CRC32 checksum verification** on incoming packets.  
- Ensures **packet integrity** before forwarding to the application layer.  

### **5️⃣ UART Debugging (`uart_debug.v`)**
- Sends received **Ethernet frame data over UART**.  
- Allows real-time **packet monitoring via serial console**.  

### **6️⃣ Clock Wizard (`clk_wiz_0.v`)**
- Generates a stable **100MHz system clock** from the FPGA’s onboard oscillator.  
- Ensures all **Ethernet operations run at the correct frequency**.  


