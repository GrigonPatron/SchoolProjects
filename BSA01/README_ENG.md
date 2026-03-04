# Interested Parties (Stakeholders)

Summary:
Today you will learn who stakeholders are and what their importance is to IT systems, as well as techniques for identifying stakeholders and methods of working with them.

## Contents

1. [Chapter I](#chapter-i)
   1.1. [Preamble](#11)
2. [Chapter II](#chapter-ii)
   2.2. [General Rules](#21)
3. [Chapter III](#chapter-iii)
   3.1. [Interested Parties](#31)
   3.2. [Who's interested in the system?](#32)
   3.3. [Roles](#33)
   3.4. [Stakeholder Directory](#34)
   3.5. [Onion Diagram](#35)
4. [Chapter IV](#chapter-iv)
   4.1. [Task 1. Haircut Appointment](#41)
   4.2. [Task 2. Delivery of Orders](#42)
5. [Chapter V](#chapter-v)
   5.1. [Exercise 00 — Identification of Stakeholders](#51)
   5.2. [Exercise 01 — Building a Stakeholder Onion Diagram ](#52)
   5.3. [Exercise 02 — Interests, Needs, Problems of Stakeholders](#53)
   5.4. [Exercise 03 — Completing the Glossary](#54)

## Chapter IV <div id="chapter-iv"></div>

### Task 1. Haircut Appointment <div id="41"></div>

The management of a chain of barbershops decided to implement an online booking system. The main objective is to develop the business by expanding the customer base through the possibility of online registration, as well as to reduce employee labour costs and manual labour by automatically informing customers through communication channels.

Both registered and unregistered visitors can book an appointment on the website. When making an appointment, they can select the type of service: hairdressing or cosmetology, as well as the service itself, the master and the time from the available intervals. The system should provide automatic sending of reminders to clients through the communication channel chosen by the client (Telegram, WhatsApp, VK, SMS) according to the schedule set by the manager. After receiving a service, the system offers the client to evaluate the service and write suggestions on how to improve the work.

The schedule of masters and the services provided by each master should be entered by the manager, who may be more than one person. This person is also responsible for keeping the schedule up to date and adjusting it if necessary, communicating with customers manually, marking the service, charging and accepting payment, sending the payment data to the accounting department. The manager can also receive reports on completed services and view customer feedback.

Moreover, the system must ensure that the sanitization of the premises of each barbershop is recorded, as required by the Sanitary and Epidemiological Inspectorate. The sanitization schedule is set by the manager, who also marks the completion after sanitization by the technician.

Each master has the possibility to see the schedule and the date of his services, as well as the clients' reviews.

### Task 2. Delivery of Orders <div id="42"></div>

During the lockdown, many grocery stores and food companies dramatically increased their online sales and the need for quick delivery of small quantities to individual customers increased.

A group of students got together and decided to create a delivery service startup.

The idea is to quickly receive information about orders, pickup location and time, delivery location, desired delivery dates, and distribute this information to couriers who will pick up the order at the pickup location and deliver it to the delivery location. They decided to develop an online system where orders could be collected and quickly sorted for delivery by couriers. The first step was to collect orders from stores and caterers in any way possible and have the operator enter them into the system in a consistent format, as well as developing a mobile application for the courier.

The courier should be able to view order information, select an order from those available, book it, pick it up at the collection point and deliver it to the customer. The result of the courier's actions should be immediately reflected in the system via a mobile application. The system should also include a dispatcher who controls the couriers and reassigns orders if necessary. Information on received orders should be sent to the accounting department (to another IT system) to calculate delivery charges with order suppliers. Order delivery information should also be sent to the accounting department to calculate payment to couriers. Accrued payment should be transferred to the system and displayed in the courier's personal account. And there should also be an administrator's workplace, where couriers are registered and access rights are assigned to all of them.

## Chapter V <div id="chapter-v"></div>

### Exercise 00 — Identification of Stakeholders <div id="51"></div>

**For task 2:**

1. Create a stakeholder directory.
2. List stakeholders in the directory.
3. Define the directory characteristics, i.e. the categories by which the stakeholders of each task will be classified. Specify the characteristics known from the task conditions.
4. Indicate your answers in the turn-in file ex00\_<product prefix>\_stakeholders.xlsx.

**Recommendations for the task:**

1. Select the categories you need:
   - Categorize by onion diagram area for future work;
   - Identify roles in the system.
2. Select directory categories based on the context of the task. You may want to consider the list of stakeholder groups described in the "Who is interested in the system?".
3. Specify stakeholders in the directory.
4. Rank the categories based on the conditions of the task.
5. Enter the date the stakeholder was added to the directory. It should be a project number (example: BSA 01).
6. An example of part of the stakeholder directory for Task 1 is shown in the table below.

**Stakeholder Directory** using Task 1 as an example.


| Identifier | Stakeholder's Full name (if known) | Organization or Natural person | Stakeholder Category | Level of contact with the system (onion diagram) | Role in the project (if any) |
| ---------- | ---------------------------------- | ------------------------------ | -------------------- | ------------------------------------------------ | ---------------------------- |
| st00100    | Head of the chain                  | Organization                   | System organization  | Doesn't communicate with the system              | None                         |
| st00200    | Registered visitor                 | Natural person                 | Affected parties     | End user                                         | Сlient                      |
| st00300    | Unregistered visitor               | Natural person                 | Affected parties     | End user                                         | Visitor                      |
| st00400    | Master                             | Natural person                 | Affected parties     | End user                                         | Master                       |
| st00500    | Manager                            | Natural person                 | Affected parties     | End user                                         | Manager                      |
| st00600    | Administrator                      | Natural person                 | Affected parties     | End user                                         | Administrator                |
| st00700    | SEI                                | Organization                   | Regulator            | Affected external parties                        | Adjacent system              |
| st00800    | System developers                  | Organization                   | Project team         | Create a system                                  | Developers                   |

### Exercise 01 — Building a Stakeholder Onion Diagram <div id="52"></div>

**For task 2:**

1. Define stakeholder categories in terms of interaction with our system (Onion Diagram layers). Define one of the categories as an attribute of the onion diagram layer.
2. Identify stakeholders or groups (roles) related to each category (layer).
3. Create an Onion Diagram, indicate the layers and stakeholders related to each layer.
4. In addition, specify those stakeholders that are not specified in the task, but may be common in life.
5. When identifying stakeholders that are not in the directory, add them to the directory of Ex. 00.
6. Enter your answers in the turn-in file ex01\_<product prefix>\_onion.xxx (xxx — extension).

**Recommendations for the task:**

Build an onion diagram. Here is an example of onion diagram for task 1:

![img2_eng](misc/images/img2_eng.png)

### Exercise 02 — Interests, Needs, Problems of Stakeholders  <div id="53"></div>

**Fpr each task:**

1. Write down in a table the interests, needs, problems of stakeholders (including external stakeholders).
2. Indicate your answers in the turn-in file ex02\_<product prefix>needs.xlsx.

**Recommendations for the task:**

Here in the table is an example of description of interests, needs, problems of a key stakeholder for task 1.


| Ident.  | Stakeholder                  |   | Interests               |   | Needs                                                                               |   | Problems                                                                                       |
| ------- | ---------------------------- | - | ----------------------- | - | ----------------------------------------------------------------------------------- | - | ---------------------------------------------------------------------------------------------- |
| st00100 | Head of the barbershop chain | 1 | Business volume         | 1 | Expand the client base                                                              | 1 | Lack of client base growth                                                                     |
|         |                              | 2 | Size of the client base | 2 | Increase the average check                                                          | 2 | Clients by appointment don't reach the services                                                |
|         |                              | 3 | Employees' labor costs  | 3 | Reduce the labor costs of employees for calling and making appointments for clients | 3 | High uneven labor costs (peak periods) for phone bookings,                                     |
|         |                              | 4 | Average check           | 4 | Reduce errors when making appointments for services over the phone                  | 4 | Clients are often unable to make an appointment over the phone                                 |
|         |                              |   |                         | 5 |                                                                                     | 5 | During peak periods, the manager has no time to handle calls for appointments                  |
|         |                              |   |                         | 6 |                                                                                     | 6 | The client often doesn't show up for the service, doesn't remember the time of the appointment |
|         |                              |   |                         | 7 |                                                                                     | 7 | Clients do not see a full list of services when making an appointment over the phone           |

### Exercise 03 — Completing the Glossary <div id="54"></div>

**For each task:**

1. Write down new concepts and terms found in the task into a glossary.
2. Find descriptions of concepts and terms and write them in a glossary.
3. Indicate your answers in the turn-in file ex03\_<product prefix>glossary.xlsx.
