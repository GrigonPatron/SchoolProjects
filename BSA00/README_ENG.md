# IT analyst's role and functions in the IT systems development team

## Contents

1. [Chapter I](#chapter-i)
   1.1. [Preamble](#11)
2. [Chapter II](#chapter-ii)
   2.1. [General Rules](#21)
3. [Chapter III](#chapter-iii)
   3.1. [IT Systems Development Life Cycle](#31)
   3.2. [Identifying Information Sources](#32)
   3.3. [Glossary](#33)
   3.4. [Placement, Naming and Other Rules](#34)
   3.5. [Decomposition. Main Concepts](#35)
   3.6. [Decomposition Rules](#36)
   3.7. [Recommendations for Decomposition](#37)
4. [Chapter IV](#chapter-iv)
   4.1. [Task 1. Haircut Appointment](#41)
   4.2. [Task 2. Delivery of Orders](#42)
5. [Chapter V](#chapter-v)
   5.1. [Exercise 00 — Creating a Workspace](#51)
   5.2. [Exercise 01 — Identifying Information Sources](#52)
   5.3. [Exercise 02 — Creating and Maintaining a Glossary](#53)
   5.4. [Exercise 03 — Concept of Decomposition](#53)
   5.5. [Exercise 04 — Types of Decomposition](#55)
   5.6. [Exercise 05 — Types of Decomposition](#56)
   5.7. [Exercise 06 — Decomposition Rules](#57)

## Chapter IV <div id="chapter-iv"></div>

### Description of Tasks

### Task 1. Haircut Appointment <div id="41"></div>

The management of a chain of barbershops decided to implement an online booking system. The main objective is to develop the business by expanding the customer base through the possibility of online registration, as well as to reduce employee labour costs and manual labour by automatically informing customers through communication channels.

Both registered and unregistered visitors can book an appointment on the website. When making an appointment, they can select the type of service: hairdressing or cosmetology, as well as the service itself, the master and the time from the available intervals. The system should provide automatic sending of reminders to clients through the communication channel chosen by the client (Telegram, WhatsApp, VK, sms) according to the schedule set by the manager. After receiving a service, the system offers the client to evaluate the service and write suggestions on how to improve the work.

The schedule of masters and the services provided by each master should be entered by the manager, who may be more than one person. This person is also responsible for keeping the schedule up to date and adjusting it if necessary, communicating with customers manually, marking the service, charging and accepting payment, sending the payment data to the accounting department. The manager can also receive reports on completed services and view customer feedback.

Each master has the ability to view the schedule and appointments for their services, as well as customer reviews.

### Task 2. Delivery of Orders <div id="42"></div>

During the lockdown, many grocery stores and food companies dramatically increased their online sales and the need for quick delivery of small quantities to individual customers increased.

A group of students got together and decided to start a delivery service. The idea is to quickly receive information about orders, pickup location and time, delivery location, desired delivery dates, and distribute this information to couriers who will pick up the order at the pickup location and deliver it to the delivery location. They decided to develop an online system where orders could be collected and quickly sorted for delivery by couriers.

The first step was to collect orders from stores and caterers in any way possible and have the operator enter them into the system in a consistent format, as well as developing a mobile application for the courier. The courier should be able to view order information, select an order from those available, book it, pick it up at the collection point and deliver it to the customer. The result of the courier's actions should be immediately reflected in the system via a mobile application. The system should also include a dispatcher who controls the couriers and reassigns orders if necessary. Information on received orders should be sent to the accounting department (to another IT system) to calculate delivery charges with order suppliers. Order delivery information should also be sent to the accounting department to calculate payment to couriers. Accrued payment should be transferred to the system and displayed in the courier's personal account. And there should also be an administrator's workstation, where couriers are registered and access rights are assigned to all of them.

## Chapter V <div id="chapter-v"></div>

### Exercise 00 — Creating a Workspace <div id="51"></div>

**For each task**:

1. Determine the product prefix.
2. Create a separate directory in your GIT repository in the src subfolder, the directory name should contain the product prefix.

### Exercise 01 — Identifying Information Sources <div id="52"></div>

**For each task:**

1. Create a directory of information sources.
2. Find at least 5 sources of information and place them into a directory.
3. Prioritize the study of sources of information.
4. Define the necessary directory parameters.
5. Indicate your answers in the turn-in file ex01\_<product prefix>\_infosources.xlsx.

### Exercise 02 — Creating and Maintaining a Glossary <div id="53"></div>

**For each task:**

1. Create a glossary.
2. Place at least 10 concepts into the glossary.
3. Indicate your answers in the turn-in file ex02\_<product prefix>\_glossary.xlsx.

**Recommendations for tasks:**

1. (Hereafter) When you add new concepts to the glossary, you should enter the project number as the date the concept was added to the glossary (Example:BSA 00).

### Exercise 03 — Concept of Decomposition <div id="54"></div>

1. Find the demographic pyramid of the Russian Federation. Add the found pyramid to the file.
2. Specify the demographic pyramid breakdown indicator.
3. Indicate the purpose of the demographic pyramid.
4. Determine the type of decomposition of the demographic pyramid.
5. Specify:
   - How many levels of decomposition has has?
   - What are those levels?
   - What criteria are used to categorize each level?
6. Determine the order in which the demographic pyramid is constructed.
7. Indicate your answers in the turn-in file ex03\_decomposition.docx.

### Exercise 04 — Types of Decomposition <div id="55"></div>

**Breakfast menu:** boiled egg, buttered toast, juice, tea.

1. <a name="_heading=h.4i7ojhp"></a>Look at the decomposition of breakfast in Figure 3:
   - Specify the goal and type of decomposition;
   - Specify the number of decomposition levels;
   - Find decomposition errors and list them;
   - Correct errors in the decomposition and apply the corrected version to the next task.
2. Develop an object decomposition of breakfast based on the refined decomposition in the paragraph above:
   - Specify the goal of the decomposition;
   - Build a decomposition to level 2;
   - Specify the breakdown criteria for each level of the constructed decomposition.
3. Indicate your answers in the turn-in file ex04\_types.docx.

*Figure 3: Breakfast decomposition*

![img4_eng](./misc/images/img4_eng.png)

**Conditions:**

The means of representing the decomposition is at your discretion.

### Exercise 05 — Types of Decomposition <div id="56"></div>

**For task 2:**

1. Study task 2 (Chapter IV).
2. Develop a decomposition of couriers' actions.
3. Determine the goal and type of decomposition.
4. Specify the number of levels.
5. Develop an object decomposition of the actors (roles) of the task.
6. Specify the goal of object decomposition.
7. Specify the number of levels.
8. Indicate your answers in the turn-in file ex05\_types.docx.

### Exercise 06 — Decomposition Rules <div id="57"></div>

**Daily activities:**

1. List at least 10 activities of your day.
2. Define at least 2 decomposition goals; identify users and needs within each goal.
3. Build an event decomposition of your day's activities according to the chosen goal. Stick to the rules of decomposition.
4. Indicate your answers in the turn-in file ex06\_rules.docx.
