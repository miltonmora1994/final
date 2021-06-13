import mysql.connector

config = {
    'host': 'localhost',
    'user': 'root',
    'password': 'sistemas',
    'port': '3306',
    'database': 'db',
}

DB = mysql.connector.connect(**config)
DB.autocommit = True
