# Основы сетей. Часть 1 — «Первый опыт»

# Networking Basics. Part 1 — “First Experience”

**Annotation:** This project includes an overview of networking fundamentals, the OSI/TCP/IP models using GNS3, and the study of IP, ARP, and ICMP protocols.

---

### Task 1. Address Calculation

To reinforce your understanding of CIDR notation and network addressing, complete the following practical tasks:

1. Calculate the binary notation for the following addresses:
   * 178.101.89.7
   * 201.57.153.161
2. Imagine that you need to allocate subnets for different segments of organization N:
   * Technological segment (3 hosts)
   * Server segment (16 hosts)
   * User segment (32 hosts)
3. What subnet masks should be allocated for each segment? Provide justification for your answer.

Write the solutions and explanations in a text file named `ip-1`.

---

### Task 2. Getting Started with GNS3

To complete this task, you need knowledge of: GNS3 and importing Cisco images into GNS3.

**Important:** Do not forget to save device configurations while completing the tasks.

To prepare the virtual environment in which you will perform lab work for this and the next three modules, you need to install and configure a GNS3 test environment and study how it works.
GNS3 is a virtual environment that allows you to emulate network equipment, similar to virtual machines.

To prepare the GNS3 environment, you need to:

* Install GNS3 (if not already installed),
* Create a new project,
* Import Cisco IOS images.

Download the Cisco IOS images (IOS 3745) using the provided link.

After installation, set permissions for dumpcap:

```
sudo chmod +x /usr/bin/dumpcap
```

In case of difficulties, refer to:

* GNS3 GitHub repository

**Important:** Do not install GNS3 as a systemd service, as some versions contain a bug related to project creation when installed this way.

Refer to the official installation guide if needed.

As your answer, upload the GNS3 project containing the imported Cisco 3745 device to the repository.

---

### Task 3. Multicast Requests

To complete this task, you need knowledge of: broadcast, multicast, ICMP, and Wireshark.

Your task:

* Create a project.
* Add two network devices (using the Cisco 3745 image), connect them, and configure their network interfaces.
* Start the emulation and capture packet traces by sending an ICMP request to a multicast IP address.
* Use Wireshark to analyze the resulting packet capture file, paying attention to fields related to L2, L3, and ICMP.
* Answer the question: to which destination MAC address is the ICMP request sent? Write your answer in a text file named `multicast`.
* Save the resulting packet capture as a `.pcap` file named `multicast`.

*Wireshark* is traffic analysis software that allows you to capture and inspect network traffic. It is widely used when manual inspection of network activity is required. The interface may seem complex, but the official documentation will help you understand it.

As the final result, upload the file `multicast.pcap` and the text file `multicast` with your answer to the repository.

**Hint:** For a device to respond to multicast requests, its interface must be added to a multicast group.

If you encounter difficulties, refer to the help documentation.

**Tips:**

* Do not assign “complex” IP addresses to network interfaces; use simple ones like 10.10.10.0/24.
* Use `?` in the CLI to display help.
* Use the TAB key to auto-complete commands.

---

### Task 4. ARP

To complete this task, you need knowledge of: ARP, OSI Layer 2, Wireshark, and GNS3.

ARP (Address Resolution Protocol) allows you to determine a MAC address based on a known IP address.
Each device has an ARP table, which acts as a “logbook” containing IP addresses and their associated MAC addresses.

Refer to the related article if needed.

Continue studying basic network protocols using ARP by analyzing traffic between two network nodes in your GNS3 project.

Your task:

* Start packet capture.
* From one node, execute the `ping` command to the IP address of the neighboring device.
* Ensure that the corresponding ARP entry appears in the ARP table.
* In Wireshark, examine the contents of ARP and ICMP packets.
* To which MAC address is the first ARP request sent? What is this address called? Write your answers in a text file named `arp`.
* Pay attention to which MAC address the reply packet originates from.
* Save the resulting Wireshark `.pcap` file as `arp`.

Upload the following three files to the repository:

* GNS3 project (`gns3`)
* `arp.pcap`
* Text file `arp`

Additionally, it is recommended to independently study what Gratuitous ARP is.
