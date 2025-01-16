# Server Provisioning Automation with Best Security Practices

This project automates the **secure installation** of a web server (Apache/Nginx) on a Linux instance.  
It follows **security best practices** to protect against common vulnerabilities.

##  Features
-  **Automated Installation** of Apache/Nginx
-  **Non-Root User** for server management
-  **Firewall Setup** (Allows only SSH, HTTP, HTTPS)
-  **Fail2Ban** to prevent brute-force attacks
-  **Automatic Security Updates**
-  **Hardened Web Server Configuration**

---

##  Prerequisites
Before running this script, ensure:
- You have **a Linux server** (Ubuntu, Debian, CentOS).
- You have **sudo/root access**.

---

##  Installation & Usage

1 **Clone the Repository**
```sh
git clone https://github.com/yourusername/secure-webserver-setup.git
cd secure-webserver-setup
```

2 **Make the Script Executable**
```sh
chmod +x setup_webserver_secure.sh
```

3 **Run the Script**
```sh
./setup_webserver_secure.sh
```

---

##  Security Enhancements
This script implements **several security best practices**:
| Security Feature       | Description |
|------------------------|-------------|
| **Non-Root User**      | Prevents privilege escalation |
| **Firewall Rules**     | Blocks unwanted traffic |
| **Fail2Ban**           | Prevents brute-force attacks |
| **Automatic Updates**  | Ensures security patches are installed |
| **Apache Hardening**   | Disables unnecessary information leaks |

---

##  Project Structure
```
 automated-webserver-setup
 ┣  setup_webserver_secure.sh  # Secure Shell Script
 ┣  README.md                  # Documentation
```

---

##  Screenshots
After running the script, access your server in a browser:
```
http://your-server-ip
```
You should see:
```
Secure Web Server
```

---

##  Contributing
Feel free to **fork** this repository and improve it!

---

##  License
This project is **open-source** under the **MIT License**.
