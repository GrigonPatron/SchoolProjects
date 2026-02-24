# Networking Basics. Part 2: Application Protocols

## Annotation

This project continues the study of networking fundamentals and the OSI/TCP/IP model using the **GNS3** environment. It also covers static routing, TCP/UDP, DNS, NTP, Telnet, SSH, and DHCP.

> **Important:** When completing the tasks, do not forget to save the configurations of your devices.

---

## Chapter III

---

## Task 1. Static Routing

To complete this task, you will need knowledge of: IP addressing, OSI Layer 3, GNS3, and **Wireshark**.

Routing is the process of determining the optimal path for an IP packet. It can be static or dynamic. Dynamic routing will be covered in the next project using OSPF and BGP as examples.

Without routing, network devices simply will not "know" where to send packets. Static routing means that a network administrator manually configures IP routes on network devices. This method is effective only for small networks (up to about 10 devices). Large companies use dynamic routing.

### Your task:

1. To understand how static routing works, create a new project in GNS3. Add three network devices (use the Cisco 3745 image), and name them R1, R2, and R3. Connect them in a chain topology: R1–R2–R3.
2. Configure the interfaces between R1 and R2 using addresses from the 10.10.10.0/24 network.
   Configure the interfaces between R2 and R3 using a different /24 network.
   *Tip: Do not assign complex IP addresses. Use simple addressing such as 10.10.10.0/24 and 10.10.20.0/24.*
3. Configure a static route on R1 to reach the network between R2 and R3. Configure a return route on R3 to reach the network between R1 and R2.
4. Start packet capture and execute the `ping` command to the IP interface of the opposite device (from R1 to R3 or vice versa). Ensure that reply traffic is received.
5. In Wireshark, analyze the packet capture and save the resulting `.pcap` file as `static`.

### Final deliverables:

Upload to the repository:

* The `.gns3` project file
* The `static.pcap` file

Additionally, we recommend studying how route priority is determined in the routing table.

---

## Task 2. NTP

To complete this task, you will need knowledge of: NTP, Wireshark, GNS3.

### Your task:

1. Configure one device as an NTP server.
2. On a second device, set an intentionally incorrect system time. Start packet capture and configure this device to use the first device as its NTP server.
3. Ensure that the time successfully synchronizes with the NTP server.
4. Open the packet capture in Wireshark and analyze it.
5. Answer the following questions:
   * Which Layer 4 (OSI) protocol is used between the NTP client and server? What source and destination ports are used?
   * Check the Transmit Timestamp value in the first NTP packet and record it.
6. Save your answers in a text file named `ntp`.
7. Save the Wireshark capture file as `ntp.pcap`.

### Final deliverables:

Upload to the repository:

* The `.gns3` project file
* The `ntp` text file
* The `ntp.pcap` file

---

## Task 3. DNS

To complete this task, you will need knowledge of: DNS, FQDN, loopback interfaces, Wireshark, GNS3.

> DNS (Domain Name System) allows you to determine the IP address of a host based on its known name (FQDN).

### Your task:

1. Configure one device as a DNS server and add a DNS record for the domain `my.site`.
2. On a neighboring device, configure it to use this DNS server.
3. Start packet capture and execute `ping my.site`. Ensure that the name resolves to an IP address.
   *Hint: Add a loopback interface for proper DNS resolution. Using a logical loopback interface for a DNS server is good practice and prevents dependency on physical interfaces.*
4. In Wireshark, filter packets using the `dns` filter and analyze them. Pay attention to source and destination ports used in DNS queries and responses.
5. Answer the question:
   * What query type and class are visible in the DNS request?

Save your answer in a text file named `dns`.

Save the Wireshark capture as `dns.pcap`.

### Final deliverables:

Upload to the repository:

* The `.gns3` project file
* The `dns` text file
* The `dns.pcap` file

Additionally, we recommend studying DNS server hierarchy and DNS resource record types.

---

## Task 4. DHCP

To complete this task, you will need knowledge of: DHCP, IP address pools, routers, Round Robin algorithm, GNS3, Wireshark.

DHCP (Dynamic Host Configuration Protocol) dynamically assigns IP addresses to client devices.

Before starting, review DHCP pools, DHCP lease concepts, and the Round Robin algorithm.

### Your task:

1. In your existing GNS3 project, add a virtual PC (vPC) and connect it to one of the Cisco devices.
2. Configure the Cisco interface connected to the vPC with addressing from the 10.10.30.0/24 network. Configure a DHCP server to issue 50 IP addresses from this network.
3. Start packet capture and configure the vPC to obtain an IP address via DHCP.
4. From the vPC, execute `ping` to the IP address of the connected device.
5. In Wireshark, analyze the DHCP and ICMP packets. Save the capture as `dhcp.pcap`.
6. Answer the following questions:
   * What does the output “DORA IP ….” mean during the DHCP process? Which DHCP packets in the capture correspond to DORA?
   * To which IP address is the first DHCP packet sent?

Save your answers in a text file named `dhcp`.

### Final deliverables:

Upload to the repository:

* The `.gns3` project file
* The `dhcp.pcap` file
* The `dhcp` text file

---

## Task 5. SSH

To complete this task, you will need knowledge of: SSH, RSA keys, VTY, TCP, Wireshark, GNS3.

> SSH (Secure Shell) is a protocol designed for secure remote access to network devices. Network administrators use it to manage and troubleshoot equipment.

### Your task:

1. Configure SSH on one device. This includes configuring VTY lines, creating a user, and generating RSA keys.
2. Start packet capture and verify port 22 availability on the neighboring device using telnet.
3. Connect to the neighboring device via SSH using the credentials created earlier. After successful login, disconnect using the `exit` command.
4. In Wireshark, analyze the telnet request packets and the response traffic. Study the TCP packet structure, TCP flags, and the TCP three-way handshake process.

Save the Wireshark capture as `ssh.pcap`.

### Final deliverables:

Upload to the repository:

* The `.gns3` project file
* The `ssh.pcap` file
