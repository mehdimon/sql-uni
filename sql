import mysql.connector

# وصل شدن به پایگاه داده
db = mysql.connector.connect(
  host="localhost",
  user="username",
  password="password",
  database="shop_management"
)


cursor = db.cursor()

# جدول محصولات 
cursor.execute("CREATE TABLE IF NOT EXISTS Products (product_id INT AUTO_INCREMENT PRIMARY KEY, product_name VARCHAR(255), category_id INT, price INT, quantity INT)")

# جدول دسته بندی
cursor.execute("CREATE TABLE IF NOT EXISTS Categories (category_id INT AUTO_INCREMENT PRIMARY KEY, category_name VARCHAR(255))")

# اضافه کردن ورودی
def add_product(product_name, category_id, price, quantity):
  sql = "INSERT INTO Products (product_name, category_id, price, quantity) VALUES (%s, %s, %s, %s)"
  val = (product_name, category_id, price, quantity)
  cursor.execute(sql, val)
  db.commit()

def add_category(category_name):
  sql = "INSERT INTO Categories (category_name) VALUES (%s)"
  val = (category_name,)
  cursor.execute(sql, val)
  db.commit()

# حذف محصولات 
def remove_product(product_id):
  sql = "DELETE FROM Products WHERE product_id = %s"
  val = (product_id,)
  cursor.execute(sql, val)
  db.commit()

def remove_category(category_id):
  sql = "DELETE FROM Categories WHERE category_id = %s"
  val = (category_id,)
  cursor.execute(sql, val)
  db.commit()

# ویرایش محصولات
def edit_product(product_id, product_name, category_id, price, quantity):
    sql = "UPDATE Products SET product_name=%s , category_id=%s , price=%s , quantity=%s WHERE product_id=%s"
    val = (product_name , category_id , price , quantity , product_id)
    cursor.execute(sql,val)
    db.commit()

def edit_category(category_id , category_name):
    sql= "UPDATE Categories SET category_name=%s WHERE category_id=%s"
    val=(category_name , category_id )
    cursor.execute(sql,val)
    db.commit()


# جست و جو محصولات
def search_products(name_or_category):
    sql= "SELECT * FROM Products WHERE product_name LIKE %s OR category LIKE %s"
    val= ('%' + name_or_category + '%', '%' + name_or_category + '%')
    cursor.execute(sql,val)
    result=cursor.fetchall()
    for row in result:
        print(row)

def search_categories(category_name):
    sql= "SELECT * FROM Categories WHERE category LIKE %s"
    val= ('%' + name_or_category + '%')
    cursor.execute(sql,val)
    result=cursor.fetchall()
    for row in result:
        print(row)


# نمایش محصولات 
def display_products():
   cursor.execute("SELECT * FROM Products")
   result=cursor.fetchall()
   for row in result:
       print(row)

def display_categories():
   cursor.execute("SELECT * FROM Categories")
   result=cursor.fetchall()
   for row in result:
       print(row)
