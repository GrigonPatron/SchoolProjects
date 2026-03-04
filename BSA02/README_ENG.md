# Requirements

Summary:

Today you will learn about software requirements, their types, levels, relationships and dependencies, as well as the "As-Is" and "To-Be" models. You will build a context diagram, identify stakeholder roles, problems, needs and product business requirements.

## Contents

1. [Chapter I](#chapter-i)
   1.1. [Preamble](#11)
2. [Chapter II](#chapter-ii)
   2.1. [General Rules](#21)
3. [Chapter III](#chapter-iii)
   3.1. [Types and Levels of Requirements](#31)
   3.2. [As-Is and To-Be Models](#32)
   3.3. [Context Diagram](#33)
4. [Chapter IV](#chapter-iv)
   4.1. [Task 1. Haircut Appointment](#41)
   4.2. [Task 2. Delivery of Orders ](#42)
5. [Chapter V](#chapter-v)
   5.1. [Exercise 00 — Roles and Their As-Is Actions ](#51)
   5.2. [Exercise 01 — Creating a Context Diagram ](#52)
   5.3. [Exercise 02 — Solving Stakeholder Problems](#53)
   5.4. [Exercise 03 — Checking Input and Output Data Flows](#54)
   5.5. [Exercise 04 — Adding Artifacts](#55)

## Chapter IV <div id="chapter-iv"></div>

### Task 1. Haircut Appointment <div id="41"></div>

The management of a chain of barbershops decided to implement an online booking system. The main objective is to develop the business by expanding the customer base through the possibility of online registration, as well as to reduce employee labour costs and manual labour by automatically informing customers through communication channels.

Both registered and unregistered visitors can book an appointment on the website. When making an appointment, they can select the type of service: hairdressing or cosmetology, as well as the service itself, the master and the time from the available intervals. The system should provide automatic sending of reminders to clients through the communication channel chosen by the client (Telegram, WhatsApp, VK, SMS) according to the schedule set by the manager. After receiving a service, the system offers the client to evaluate the service and write suggestions on how to improve the work.

The schedule of masters and the services provided by each master should be entered by the manager, who may be more than one person. This person is also responsible for keeping the schedule up to date and adjusting it if necessary, communicating with customers manually, marking the service, charging and accepting payment, sending the payment data to the accounting department. The manager can also receive reports on completed services and view customer feedback.

Each master has the ability to view the schedule and appointments for their services, as well as customer reviews.

### Task 2. Delivery of Orders <div id="42"></div>

During the lockdown, many grocery stores and food companies dramatically increased their online sales and the need for quick delivery of small quantities to individual customers increased.

A group of students got together and decided to create a delivery service startup. The idea is to quickly receive information about orders, pickup location and time, delivery location, desired delivery dates, and distribute this information to couriers who will pick up the order at the pickup location and deliver it to the delivery location. They decided to develop an online system where orders could be collected and quickly sorted for delivery by couriers.

The first step was to collect orders from stores and caterers in any way possible and have the operator enter them into the system in a consistent format, as well as developing a mobile application for the courier. The courier should be able to view order information, select an order from those available, book it, pick it up at the collection point and deliver it to the customer. The result of the courier's actions should be immediately reflected in the system via a mobile application. The system should also include a dispatcher who controls the couriers and reassigns orders if necessary. Information on received orders should be sent to the accounting department (to another IT system) to calculate delivery charges with order suppliers. Order delivery information should also be sent to the accounting department to calculate payment to couriers. Accrued payment should be transferred to the system and displayed in the courier's personal account. And there should also be an administrator's workstation, where couriers are registered and access rights are assigned to all of them.

## Chapter V <div id="chapter-v"></div>

### Exercise 00 — Roles and Their As-Is Actions   <div id="51"></div>

**For each task:**

1. Create a table of roles and their actions in the current state (As-Is) (refine for task 1).
2. Write out all the intended roles of stakeholders and their actions from the task description.
3. Specify the problems that the stakeholder roles face in the current state (As-Is).
4. Specify in the table not only the roles of stakeholders directly interacting with the system, but also the roles of other stakeholders. Update the stakeholder directory of the previous project. Load the updated directory into src.
5. Indicate your answers in the turn-in file ex00\_<product prefix>\_asis.docx.

**Recommendations for the task:**

Check the indication of all problems covered in the project Stakeholders, Exercise 02 — Interests, Needs, Problems of Stakeholders.

A part of a table identifying the roles, their actions and problems using Task 1 as an example.


| Identifier | Stakeholder | Action                             | as   is        |           | Problems                                                        |
| ---------- | ----------- | ---------------------------------- | -------------- | --------- | --------------------------------------------------------------- |
|            |             |                                    | over the phone | in person |                                                                 |
| st00200    | Client      | Making/rescheduling an appointment | +              | +         | It is difficult for the client to make an appointment (to call) |
| st00200    | Client      | Getting a discount                 | -              | +         |                                                                 |
| st00200    | Client      | Getting a reminder                 | +   /-         | -         | It's hard for a manager to text everyone manually               |
| st00300    | Visitor     | Registration                       | -              | +         |                                                                 |
| st00300    | Visitor     | Making/rescheduling an appointment | +              | +         | It is difficult for the client to make an appointment (call)    |
| st00300    | Visitor     | Getting a discount                 | -              | -         |                                                                 |
| st00300    | Visitor     | Getting a reminder                 | -              | -         | Manager loses phone numbers without registration                |

### Exercise 01 — Creating a Context Diagram <div id="52"></div>

**For task 2:**

1. Develop a context diagram.
2. Indicate in the diagram the stakeholders, stakeholder actions and control actions directed to or received from the system.
3. Indicate in the diagram the third-party systems and the data flows that the system uses to interact with them.
4. Place the diagram in the turn-in file ex01\_<product prefix>context.xxx (xxx — is an extension).

**Recommendations for tasks:**

An example of the context diagram of Task 1 is shown in the figure.

![](misc/images/img3_eng.png)

### Exercise 02 — Solving the Problems of Stakeholders <div id="53"></div>

**For each task:**

1. Add user actions of the system To-Be in the table created in the **Exercise 00 — Roles and Their Actions As-Is**, based on the context diagram.
2. Refine the diagram or source table if necessary.
3. Write a To-Be condition for each problem — whether the solution helps to resolve the problem when applying the system.
4. Indicate your answers in turn-in file ex02\_<product prefix>\_tobe.xlsx.

**Recommendations for tasks:**

Example of part of the finalized table for task 1.


| Identifier | Stakeholder (Role in the project) | Action                             | as   is        |           | Problems                                                      | to   be       |           | Problem Solution                                                  |
| ---------- | --------------------------------- | ---------------------------------- | -------------- | --------- | ------------------------------------------------------------- | ------------- | --------- | ----------------------------------------------------------------- |
|            |                                   |                                    | over the phone | in person |                                                               | In the system | In person |                                                                   |
| st00200    | Client                            | Making/rescheduling an appointment | +              | +         | It is difficult for a client to make an appointment (to call) | +             |           | Making it easier for the client to make an appointment            |
| st00200    | Client                            | Getting a discount                 | -              | +         |                                                               | -             | +         | -                                                                 |
| st00200    | Client                            | Getting a reminder                 | +   /-         | -         | It is hard for a manager to text everyone manually            | +             |           | Reminders will be sent automatically                              |
| st00300    | Visitor                           | Registration                       | -              | +         |                                                               | +             |           | Simplification of registration    Reducing the manager's workload |
| st00300    | Visitor                           | Making/rescheduling an appointment | +              | +         | It is difficult for a client to make an appointment (to call) | +             |           | Making it easier to make an appointment                           |
| st00300    | Visitor                           | Getting a discount                 | -              | -         |                                                               | -             | -         | -                                                                 |
| st00300    | Visitor                           | Getting a reminder                 | -              | -         | Manager loses phone numbers without registration              | -             |           | Ability to send reminders automatically                           |

### Exercise 03 — Checking Input and Output Data Flows <div id="54"></div>

**For each task:**

1. Create a table of input-output data flows based on the context diagram.
2. In case of differences in the table refine the context diagram and correspondence table.
3. If there are deviations, make a note to the table and explain.
4. Indicate your answers in turn-in file ex03\_<product prefix>\_flows.xlsx.

### Exercise 04 — Adding Artifacts <div id="55"></div>

**For each task:**

1. Write down new concepts and terms found in the task into a glossary.
2. Find descriptions of concepts and terms and put them in a glossary.
3. Add new identified stakeholders to the stakeholder directory.
4. Specify attributes of new stakeholders.
