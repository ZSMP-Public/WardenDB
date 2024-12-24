<p align="center">
  <a href="https://github.com/ZSMP-Public/WardenDB">
    <img src="https://github.com/ZSMP-Public/Warden/raw/main/assets/project/warden.png" alt="Warden" width="40%" />
  </a>
</p>
<p align="center">
  <strong>Database Core of <a href="https://github.com/ZSMP-Public/Warden">Warden</a></strong>
</p>


# ⚙️ Setup

## 🛠️ Prerequisites
Before you begin, make sure you have the following installed:

### 🔹 Warden Discord Bot
This project is only the database for [Warden](https://github.com/ZSMP-Public/Warden?tab=readme-ov-file), make sure to install it first.
### 🔹 Docker & Docker Compose
You'll need Docker and Docker Compose to run the PostgreSQL database and potentially other components of the system.

1. Install **Docker** from [here](https://docs.docker.com/get-docker/).
2. Install **Docker Compose** from [here](https://docs.docker.com/compose/install/).

### 🔹 A Server w/ Exposed Ports
You'll need a server to host both the Discord bot and the PostgreSQL database (unless you're running everything locally).

1. **Cloud VPS/Server**: Consider a cloud service like [DigitalOcean](https://www.digitalocean.com/), [AWS](https://aws.amazon.com/), or [Linode](https://www.linode.com/) for hosting.
2. **Local Machine**: You can also run it on a local machine or dedicated server if preferred.

---

## 🗄️ Installation
The PostgreSQL Database serves as both the storage and middleman between the MC Server & Discord Bot, facilitating the connection without requiring an additional Server Port.

This implementation is only as secure as you make it; you'll need to change the Database username and password.

1. You can start the container, and it will automatically create the schema:
    ```bash
    docker-compose up -d
    ```

2. To verify it worked, you can connect to the database:
    ```bash
    # Connect to the container
    docker-compose exec db psql -U yourusername -d mclink
    
    # Once connected, list the tables
    \dt
    
    # View the schema of a specific table
    \d linking_requests
    \d linked_accounts 
    ```

If for some reason you find yourself needing to reset everything and start fresh:
```bash
# Stop and remove containers, networks, volumes, and images
docker-compose down -v

# Then start again
docker-compose up -d
```

_🔐 Make sure you change your credentials in the **`.env`** file, and ensure it matches across both the database and bot._

