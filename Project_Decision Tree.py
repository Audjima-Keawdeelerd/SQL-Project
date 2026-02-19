#!/usr/bin/env python
# coding: utf-8

# In[55]:


import numpy as np
import pandas as pd
import seaborn as sns
from sklearn.model_selection import train_test_split
from sklearn.tree import DecisionTreeClassifier
from sklearn import tree
import matplotlib.pyplot as plt
from sklearn.preprocessing import LabelEncoder
from sklearn.metrics import accuracy_score, classification_report, confusion_matrix
from sklearn.tree import plot_tree


# In[56]:


#แสดงตัวอย่างข้อมูล
df = pd.read_csv("ecommerce_customer_data_large.csv")
df.head()


# In[30]:


#เช็คค่าที่ไม่ซ้ำกัน
df.nunique()


# In[31]:


#เช็ครายละเอียดของข้อมูล
df.info()


# In[32]:


#หา Missing Value
df.isnull().sum()


# # Cleansing Data

# In[33]:


#แทนที่ NaN ทั้งหมดเป็น 0 ในคลอลัมน์ Returns และ แปลง dtype เป็นจำนวนเต็ม
df['Returns'] = df['Returns'].fillna(0).astype(int)
#เช็คข้อมูล
df['Returns'].info()


# In[34]:


#แปลง`Purchase Date` dtype to Datetime 
df['Purchase Date'] = pd.to_datetime(df['Purchase Date'])


# In[35]:


#หา Missing Value
df.isnull().sum()


# In[ ]:


#บันทึกไฟล์ที่ทำการCleanแล้วออกมา
cleaned_data.to_csv('/mnt/data/ecommerce_customer_data_filled.csv', index=False)


# In[37]:


#แสดงตัวอย่างข้อมูล
df = pd.read_csv("ecommerce_customer_data_filled.csv")
df.head()


# # ติดตั้ง graphviz, graphviz pydotplus

# In[38]:


get_ipython().system('pip install graphviz')
get_ipython().system('pip install graphviz pydotplus')


# In[39]:


from sklearn.tree import export_graphviz
import graphviz


# In[40]:


#ค่าเฉลี่ยAge max=18 ,min=70
average_age = df['Age'].mean()
average_age


# In[41]:


# จัดกลุ่มช่วงอายุเป็น "น้อยกว่า 44" และ "มากกว่า 44"
df['Age_Group'] = pd.cut(df['Age'], bins=[0, 44, 100], labels=['<44', '>=44'], right=False)


# In[42]:


#ค่าเฉลี่ย total_purchase_amount
average_total_purchase_amount = df['Total Purchase Amount'].mean()
average_total_purchase_amount


# In[43]:


# จัดกลุ่ม Total Purchase Amount เป็น "น้อยกว่า 2725" และ "มากกว่า 2725"
df['Total_Purchase_Amount_Group'] = pd.cut(df['Total Purchase Amount'], 
                        bins=[0, 2725, df['Total Purchase Amount'].max()], 
                      labels=['<2725', '>=2725'], right=False)


# # สร้าง Decision Tree

# In[44]:


# เข้ารหัสข้อมูล 'Gender' และ 'Payment Method' เป็นตัวเลข
df['Gender'] = LabelEncoder().fit_transform(df['Gender'])
df['Payment_Method'] = LabelEncoder().fit_transform(df['Payment Method'])


# In[45]:


# เข้ารหัสข้อมูลประเภทหมวดหมู่เพื่อเตรียมสำหรับการสร้าง decision tree
le_age = LabelEncoder()
le_purchase_amount = LabelEncoder()
le_product_category = LabelEncoder()


# In[46]:


# เข้ารหัสข้อมูล 'Age_Group', 'Total_Purchase_Amount_Group', 'Gender', 'Payment_Method', และ 'Product Category'
df['Age_Group'] = le_age.fit_transform(df['Age_Group'])
df['Total_Purchase_Amount_Group'] = le_purchase_amount.fit_transform(df['Total_Purchase_Amount_Group'])
df['Product Category'] = le_product_category.fit_transform(df['Product Category'])


# In[47]:


# กำหนด X (ข้อมูลคุณลักษณะ) และ y (เป้าหมายที่ต้องการทำนาย)
X = df[['Age_Group', 'Total_Purchase_Amount_Group', 'Gender', 'Payment_Method']]  
y = df['Product Category']

# แบ่งข้อมูลออกเป็นชุดการฝึกฝน (training set) และชุดการทดสอบ (testing set)
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# ตรวจสอบขนาดของชุดข้อมูล
print(f'Training set size: {X_train.shape}')
print(f'Testing set size: {X_test.shape}')


# In[48]:


# ตรวจสอบการเข้ารหัสของ Gender
le_gender = LabelEncoder()
le_gender.fit(df['Gender'])

# แสดงการเข้ารหัสของ 'Gender'
print(dict(zip(le_gender.classes_, le_gender.transform(le_gender.classes_))))


# In[49]:


# สร้างโมเดลต้นไม้ตัดสินใจ
model = DecisionTreeClassifier(random_state=42)

# ฝึกสอนโมเดลด้วยชุดข้อมูลฝึกสอน
model.fit(X_train, y_train)

# ทำนายผลด้วยชุดข้อมูลทดสอบ
y_pred = model.predict(X_test)

from sklearn.metrics import confusion_matrix, classification_report

# สร้าง Confusion Matrix
conf_matrix = confusion_matrix(y_test, y_pred)

# แสดงผล Confusion Matrix
print("Confusion Matrix:")
print(conf_matrix)

# สร้างรายงานการประเมินผล
print("Classification Report:")
print(classification_report(y_test, y_pred))


# In[50]:


# สร้างโมเดล Decision Tree
dt_model = DecisionTreeClassifier(max_depth=5,random_state=42)
dt_model.fit(X_train, y_train)

# วาดกราฟ Decision Tree
plt.figure(figsize=(12,8))
tree.plot_tree(dt_model, feature_names=['Age_Group', 'Total_Purchase_Amount_Group', 'Gender', 'Payment_Method'], class_names=le_product_category.classes_, filled=True)
plt.title('Decision Tree: Product Category Prediction with Payment Method and Gender')
plt.show()


# # เปลี่ยนสี

# In[51]:


import graphviz
from sklearn.tree import export_graphviz
import pydotplus
from IPython.display import Image

# สร้างไฟล์ DOT จากโมเดล Decision Tree
dot_data = export_graphviz(dt_model, out_file=None,
                           feature_names=['Age_Group', 'Total_Purchase_Amount_Group', 'Gender', 'Payment_Method'],
                           class_names=le_product_category.classes_,
                           filled=True, rounded=True,
                           special_characters=True)

# แปลงเป็นกราฟ
graph = pydotplus.graph_from_dot_data(dot_data)

# กำหนดสีสำหรับแต่ละฟีเจอร์
feature_colors = {
    'Age_Group': 'lightblue',
    'Total_Purchase_Amount_Group': 'lightgreen',
    'Gender': 'lightyellow',
    'Payment_Method': 'lightcoral'
}

# ปรับแต่งสีของโหนดตามฟีเจอร์
for node in graph.get_nodes():
    node_name = node.get_name()
    
    # ตรวจสอบว่าโหนดนี้เป็นโหนดข้อมูลหรือไม่ (node ที่ไม่ใช่พื้นฐาน)
    if node_name not in ('node', 'edge'):
        # ดึง label ของโหนดนั้นเพื่อตรวจสอบฟีเจอร์
        node_label = node.get_label()

        # ตรวจสอบว่า label ไม่เป็น None
        if node_label is not None:
            # ตรวจสอบและกำหนดสีให้โหนดตามฟีเจอร์ที่พบใน label
            for feature, color in feature_colors.items():
                if feature in node_label:  # หากฟีเจอร์นี้อยู่ใน label ของโหนด
                    node.set_fillcolor(color)  # กำหนดสีให้โหนดนั้น
                    node.set_style('filled')  # กำหนดให้โหนดมีการเติมสี

# บันทึกเป็นไฟล์ PNG และแสดง
graph.write_png("decision_tree_feature_colored.png")
Image(graph.create_png())


# In[ ]:




