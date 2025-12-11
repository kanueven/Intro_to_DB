import mysql.connector
from mysql.connector import Error

try:
    #connect to MySQL server
 connection = mysql.connector.connect(
    host='localhost',
    user = 'root',
    password = 'nakuru@40',
)
 if connection.is_connected():
    cursor = connection.cursor()
    cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
    cursor.execute("USE alx_book_store")
    print("Database 'alx_book_store' created successfully")
    
except Error as e:
    print("Error while connecting to MySQL", e)
    
finally:
    #close connection
    if connection.is_connected():
        cursor.close()
        connection.close()
        print("MySQL connection is closed")