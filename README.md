# Vehicle Fleet Management System

## Project Description

The Vehicle Fleet Management System is a Dart console application that manages vehicle information and basic fleet operations. It focuses on jeepney passenger management, vehicle maintenance, engine operations, GPS navigation, and vehicle diagnostics.

The program demonstrates object-oriented programming and asynchronous programming concepts learned in Weeks 9 to 11.

## Features

- Manage multiple jeepneys.
- Track passenger capacity and available seats.
- Board and disembark passengers.
- Calculate estimated fare totals.
- Display vehicle and fleet information.
- Start different types of vehicle engines.
- Perform vehicle maintenance.
- Use GPS navigation.
- Run asynchronous vehicle diagnostics.
- Calculate the average number of passengers.

## OOP Concepts Used

**1. Encapsulation**

The `_currentPassengers` variable is private. Getter methods provide controlled access to passenger information.

**2. Inheritance**

The `Jeepney`, `Car`, and `Motorcycle` classes inherit properties and methods from the `Vehicle` class.

**3. Polymorphism**

Each vehicle class provides its own implementation of the `startEngine()` and `performMaintenance()` methods.

**4. Abstraction**

The abstract `Vehicle` class and `Maintainable` interface define common vehicle behaviors.

**5. Mixin**

The `GPSNavigation` mixin provides navigation functionality to different vehicle classes.

**6. Asynchronous Programming**

The `async`, `await`, and `Future` keywords handle vehicle diagnostics without blocking the program during the delay.

## Technologies Used

- Programming Language: Dart
- Development Environment: DartPad
- Version Control: GitHub

## How to Run

1. Open [DartPad](https://dartpad.dev/).
2. Create a new Dart program.
3. Copy the code from `main.dart`.
4. Paste the code into the editor.
5. Click the Run button.
6. Check the console output.

## Expected Output

The program displays:
- Jeepney passenger operations.
- Vehicle fleet status.
- Average passenger count.
- Engine startup messages.
- Vehicle maintenance reports.
- GPS navigation messages.
- Vehicle diagnostic results.

## Project Purpose

This project demonstrates how Dart programming concepts work together in a practical vehicle fleet management application. It applies structured programming, object-oriented programming, and asynchronous operations to a real-world transportation scenario.
