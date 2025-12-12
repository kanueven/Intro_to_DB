import mysql.connector
# from mysql.connector import Error

# Define a function that creates a database
def create_database(): 
    try:
    #connect to MySQL server
        connection = mysql.connector.connect(
        host='localhost',
        user = 'root',
        password = 'nakuru@40',
    )
         # Check if the connection to MySQL was successful
        if connection.is_connected():
            # Create a cursor object to execute SQL queries
         cursor = connection.cursor()
         
        # SQL command to create a new database if it doesn't already exist
         cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
         # Print confirmation message if the database creation succeeds
         print("Database 'alx_book_store' created successfully")
         
    # Handle any errors that occur during connection or database creation
    except mysql.connector.Error as e:
     print("Error while connecting to MySQL", e)
    
    # The 'finally' block runs whether or not an error occurred
    # It ensures we properly close the connection to free up resources
    finally:
        # Close the cursor if it was created
        if 'cursor' in locals():
            cursor.close()
        # Close the connection if it's still active
        if 'connection' in locals() and connection.is_connected():
            connection.close()
            
# This ensures the function only runs when the file is executed directly,
# not when it's imported into another Python module
if __name__ == "__main__":
    create_database()