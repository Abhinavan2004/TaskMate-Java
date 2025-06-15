# TaskMate 📝 (Java Version)

**TaskMate-Java** is a simple yet efficient to-do list application built using **JSP**, **Servlets**, and **MySQL**. It offers a minimal UI for users to manage their daily tasks with ease. This is the backend-powered version of the TaskMate app with database support.

---

## 🔧 Features

- ✅ Add new tasks  
- 🗑️ Delete tasks  
- 📜 View all tasks  
- 💾 Stores tasks persistently using MySQL  
- 🌐 Simple and responsive web interface  

---

## 🖼️ Demo

📌 Visit: **Live Demo** *(if hosted)*  
> *(Add a link if hosted on platforms like Render, Railway, or local tunnel)*

---

## 🛠️ Tech Stack

- Java (Servlets + JSP)  
- MySQL  
- JDBC  
- HTML5, CSS3  
- Bootstrap (for styling)

---

## 📂 Folder Structure

TaskMate-Java/
│
├── src/ # Java source files (Servlets)
│ └── com/task/
│ ├── AddTaskServlet.java
│ ├── DeleteTaskServlet.java
│ └── DBConnect.java
│
├── WebContent/ # Frontend (JSP + HTML)
│ ├── index.jsp
│ └── tasks.jsp
│
├── sql/ # SQL files (optional, for creating DB schema)
│
└── README.md # This file

yaml
Copy
Edit

---

## ⚙️ Getting Started

### 1. Clone the Repo

```bash
git clone https://github.com/Abhinavan2004/TaskMate-Java.git
2. Set Up the Database
Create a MySQL database named todo_app_db and run the following SQL:

sql
Copy
Edit
CREATE TABLE tasks (
    id INT AUTO_INCREMENT PRIMARY KEY,
    task VARCHAR(255) NOT NULL
);
3. Configure DB Credentials
In DBConnect.java, update:

java
Copy
Edit
conn = DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/todo_app_db", "root", "your_password"
);
4. Deploy on Apache Tomcat
Import the project into Eclipse or IntelliJ

Add Tomcat Server runtime

Run the project

✨ Future Enhancements
User login & authentication

Task due dates & priorities

Task completion toggle

Dark mode UI

🤝 Contributing
Pull requests are welcome! If you’d like to contribute:

Fork the repo

Create a new branch

bash
Copy
Edit
git checkout -b feature-name
Commit your changes

Push to the branch

Open a Pull Request

📃 License
This project is open-source and available under the MIT License.

📫 Contact
Created by Abhinav
If you like this project, don't forget to ⭐ the repo!
