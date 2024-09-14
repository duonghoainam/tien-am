# Tiên Âm - Backend

Read the `README.md` file in each directory of the project and follow the coding conventions.

## Tech Stack

The backend of Tiên Âm uses the following technologies:

- **Nodemon**: 3.1.4 or higher — for automatic server restarts during development.
- **ExpressJS**: 4.19.2 or higher — a fast, unopinionated web framework for Node.js.
- **AdminJS**: 7.8.12 or higher — an open-source admin panel for Node.js.
- **MongoDB**: 7.0.12 or higher — a highly scalable NoSQL database.
- **Mongoose**: 8.6.1 or higher — an elegant MongoDB object modeling tool.
- **Joi**: 17.13.3 or higher — for schema validation.
- **Swagger UI Express**: 5.0.1 or higher — for API documentation and testing.

## Installation

### Prerequisites

Ensure the following dependencies are installed on your system:

- **Git** — for version control.
- **Node.js**: Version 18.19.0 or higher — for running the application.
- **Docker & Docker Compose** — for containerizing the application and managing dependencies.

### Setup

1. Install Project Dependencies

    To install the necessary packages, run the following command:
    ```bash
    npm install
    ```

2. Configure Environment Variables

    Copy the environment template file to configure the required environment variables:
    ```bash
    cp .env.template .env
    ```

3. Initialize infrastructure:

    Set up the required infrastructure using Docker:
    ```bash
    npm run infras
    ```

4. Run the project:

    Start the application using:
    ```
    npm start
    ```

## Features

### Containerize

The Tiên Âm backend is fully containerized using Docker and Docker Compose, which streamlines the deployment process and ensures consistency across different environments.

Check `./docker` directory.

### Automatically Generate Swagger UI for Routes and Schemas

The backend service includes automatic generation of Swagger UI documentation for all API routes and data schemas.

Automatically collect routes and schemas in the application to generate configuration for Swagger UI.

```bash
npm run swagger
```

Check the `./dist/swagger-output.json` file to review the generated OpenAPI configuration, and inspect each use-case route in the `modules` to see how the automatically generated components are being used.

### Logging

Robust logging is implemented throughout the application, enabling detailed tracking of system events and errors.

Check `./log/combine.log` and `./log/error.log`.

### Use-Case Based Project Structure

The project follows a use-case-based structure, organizing code by specific features and functionalities. This approach enhances code readability, maintainability, and scalability, making it easier for developers to navigate and contribute to the project. Reusable modules are placed in a dedicated `base` folder to prevent code duplication and promote clean coding practices.

Check `./modules` directory.

### Integrate the Admin Panel

The integration of the Admin Panel enhances the ability to quickly manage and configure system resources. This feature focuses on providing an intuitive and efficient interface for administrators to monitor and control various aspects of the application. Additionally, since the Admin Panel is built from an open-source library with high customization capabilities for UI components, we can fully tailor the Admin Panel to our needs.

Check `./lib/admin.js` file.
