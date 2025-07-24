# Awesome Athletics Club (AAC) System

This is a full-stack web application developed using ASP.NET Web Forms and C# with a SQL Server LocalDB database. It is designed to assist club administrators in managing various aspects of an athletics club.

## Table of Contents
- [Project Overview](#project-overview)
- [Features](#features)
- [Technologies Used](#technologies-used)
- [Database Setup](#database-setup)
- [Local Setup Instructions](#local-setup-instructions)
- [Group Members](#group-members)
- [Contact](#contact)

## Project Overview
The AAC System provides a comprehensive solution for managing an athletics club. It allows administrators to handle member registrations, track product inventory, manage an online store, enable training slot bookings, generate various reports, and more, streamlining the club's operations. For more information you can check the AAC Documantation word document in the awesome-athletics-club-system repository.

## Features
- **User Authentication:** Secure login and logout for administrators.
- **Member Management:** Add, view, update, and delete member profiles.
- **Product Registration:** Manage club products and inventory.
- **Online Store:** Allows members to purchase club kit and recovery medication.
- **Training Slot Booking:** Enables members to book training slots to avoid traffic during training hours.
- **Reporting:** Generate printable reports (e.g., member lists, product sales).
- **Data Validation:** Ensures data integrity during input.
- **Sorting and Filtering:** Easily search and organize data.
- **Intuitive UI:** User-friendly interface designed for efficient administration.

## Technologies Used
- **Backend:** ASP.NET Web Forms (C#)
- **Database:** SQL Server LocalDB (integrated with Visual Studio)
- **Frontend:** HTML, CSS, JavaScript (client-side validation, basic interactions)
- **Development Environment:** Visual Studio 2022
- **Database Access:** ADO.NET

## Database Setup
This project uses a SQL Server LocalDB database, which is typically located in the `App_Data` folder of the Visual Studio solution. The database file (`.mdf`) is included directly within the project.

1.  **Database File Location:**
    * The database file is named `AwesomeAC_DB.mdf` and is located in the `App_Data` folder within the Visual Studio solution.
2.  **Connection String:**
    * The `Web.config` file in the project root contains the connection string that points to this LocalDB database. It should look similar to this:
        ```xml
        <connectionStrings>
            <add name="AACDBConnection" connectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\AwesomeAC_DB.mdf;Integrated Security=True" providerName="System.Data.SqlClient" />
        </connectionStrings>
        ```
        * **Note:** `|DataDirectory|` is a special ASP.NET placeholder that resolves to the `App_Data` folder at runtime. `(LocalDB)\MSSQLLocalDB` refers to the default LocalDB instance provided by Visual Studio.
    * **No manual SQL Server setup (like SSMS) is typically required for LocalDB if the `.mdf` file is already in `App_Data` and the connection string is correct.** Visual Studio handles attaching the database automatically.

## Local Setup Instructions
To run this project locally using Visual Studio 2022:

1.  **Prerequisites:**
    * Visual Studio 2022 (with "ASP.NET and web development" workload and ".NET Framework project and item templates" installed).
    * SQL Server LocalDB (usually installed with Visual Studio).
2.  **Clone the repository:**
    ```bash
    git clone https://github.com/kl99-chi/awesome-athletics-club-system.git
    ```
    (This URL uses your specific GitHub username and repository name.)
3.  **Navigate to the project directory:**
    ```bash
    cd awesome-athletics-club-system
    ```
4.  **Open in Visual Studio:**
    * Open the `.sln` (solution) file (e.g., `AAC_System.sln`) in Visual Studio 2022.
5.  **Restore NuGet Packages:**
    * In Visual Studio, right-click on your solution in Solution Explorer and select "Restore NuGet Packages" if prompted.
6.  **Verify Connection String:**
    * Ensure the connection string in your `Web.config` file correctly points to the `AwesomeAC_DB.mdf` database file in `App_Data` as shown in the [Database Setup](#database-setup) section.
7.  **Run the application:**
    * Press `F5` or click the "IIS Express" button in Visual Studio to run the application.

## Group Members
- Keletso Ramothibe - https://github.com/kl99-chi
- Mahlatse Legodi
- Nkululeko Mayisa
- George Mashishi
- Nokukhanya Mlilwana
- Kgalalelo Mokotedi
- Ngazibini Ndwandwa

## Contact
For any questions or inquiries, please contact:
- **Email:** keletsoramothibe99@gmail.com
- **LinkedIn:** www.linkedin.com/in/keletso-ramothibe-793583376

---
© 2025 Keletso Ramothibe, Mahlatse Legodi, Nkululeko Mayisa, George Mashishi,	Nokukhanya Mlilwana, Kgalalelo Mokotediand and Ngazibini Ndwandwa. All rights reserved.
