#!/usr/bin/env python
# coding: utf-8

# # Logistic Regession

# In[24]:


from sklearn.datasets import make_classification
from matplotlib import pyplot as plt
from sklearn.linear_model import LogisticRegression
from sklearn.model_selection import train_test_split
from sklearn.metrics import confusion_matrix
import pandas as pd

data = pd.read_csv("ecommerce_customer_data_filled.csv")

data.head()


# # ตรวจสอบตัวแปร X ที่เลือกมาว่าเหมาะสมหรือไม่

# วิธี VIF (Variance Inflation Factor)

# In[25]:


from sklearn.preprocessing import LabelEncoder
from statsmodels.stats.outliers_influence import variance_inflation_factor

# เลือก features
features = ['Product Category', 'Product Price', 'Quantity', 'Total Purchase Amount', 'Payment Method', 'Returns', 'Age', 'Gender']
X = data[features]

# เข้ารหัสข้อมูลหมวดหมู่ features ('Product Category', 'Payment Method', 'Gender')
label_encoders = {}
for col in ['Product Category', 'Payment Method', 'Gender']:
    le = LabelEncoder()
    X[col] = le.fit_transform(X[col])
    label_encoders[col] = le

# คำนวณค่า VIF เพื่อเช็ค multicollinearity
vif_data = pd.DataFrame()
vif_data['Feature'] = X.columns
vif_data['VIF'] = [variance_inflation_factor(X.values, i) for i in range(len(X.columns))]

# Display the VIF values
print(vif_data)


# พบว่าค่า VIF น้อยกว่า 5 ซึ่งหมายความว่าไม่มีปัญหาเรื่อง multicollinearity (ไม่เสถียร) ที่รุนแรงในข้อมูลนี้ ตัวแปรทั้งหมดจึงถือว่าเป็นตัวแปรที่เหมาะสมที่จะนำไปใช้ใน Logistic Regression ได้

# Likelihood Ratio Test Statistic

# In[26]:


import statsmodels.api as sm

# เตรียมข้อมูล (X และ y)
X = data[['Product Category', 'Product Price', 'Quantity', 'Total Purchase Amount', 'Payment Method', 'Returns', 'Age', 'Gender']]
y = data['Churn']

# แปลงตัวแปร categorical ให้เป็นตัวเลข
X = pd.get_dummies(X, drop_first=False)


# ตรวจสอบชื่อคอลัมน์ทั้งหมดที่สร้างขึ้น
print(X.columns)  # ดูว่ามีคอลัมน์อะไรบ้างหลังจากการแปลง

# Split data
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# สร้าง Full Model (โมเดลที่มีทุกตัวแปร)
logit_full = sm.Logit(y_train, sm.add_constant(X_train)).fit()

X_train_reduced = X_train.drop(['Age'], axis=1)

# สร้าง Reduced Model (โมเดลที่ไม่มีตัวแปรที่ต้องการทดสอบ)
logit_reduced = sm.Logit(y_train, sm.add_constant(X_train_reduced)).fit()

from scipy.stats import chi2

# ทำ Likelihood Ratio Test
lr_stat = 2 * (logit_full.llf - logit_reduced.llf)  # ค่า LR Statistic
df_diff = logit_full.df_model - logit_reduced.df_model  # ความต่างของ degrees of freedom

# คำนวณ p-value
p_value = chi2.sf(lr_stat, df_diff)

# แสดงผลลัพธ์
print(f"Likelihood Ratio Test Statistic: {lr_stat}")
print(f"p-value: {p_value}")


# # สร้างโมเดล

# In[39]:


# นำเข้าไลบรารีที่จำเป็น
from sklearn.metrics import accuracy_score, confusion_matrix, classification_report
from sklearn.model_selection import train_test_split
import pandas as pd

# กำหนดตัวแปรอิสระ (X) และตัวแปรเป้าหมาย (y)
# เลือกคอลัมน์ต้นฉบับที่เป็นข้อมูลดิบ
X = data[['Product Price', 'Quantity', 'Total Purchase Amount', 'Returns', 'Age', 
          'Product Category', 'Payment Method', 'Gender']]
y = data['Churn']

# แปลงฟีเจอร์ที่เป็นประเภท (categorical features) ให้เป็นตัวเลขด้วย get_dummies
X = pd.get_dummies(X, drop_first=False)  # drop_first=False เพื่อไม่ให้ลบ dummy variable ตัวแรก

# แบ่งข้อมูลเป็น train และ test
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# ตรวจสอบคอลัมน์ที่ถูกสร้างขึ้นหลังการแปลง
print(X_train.columns)


# In[40]:


# สร้างโมเดล LogisticRegression
model = LogisticRegression(solver = 'liblinear', max_iter=100, class_weight='balanced')  # ปรับสมดุลของคลาส
model.fit(X_train, y_train)

# ทำนายผลจาก train และ test
y_train_pred = model.predict(X_train)
y_test_pred = model.predict(X_test)

# คำนวณค่าความแม่นยำและ confusion matrix สำหรับ train set
train_accuracy = accuracy_score(y_train, y_train_pred)
train_conf_matrix = confusion_matrix(y_train, y_train_pred)

# คำนวณค่าความแม่นยำและ confusion matrix สำหรับ test set
test_accuracy = accuracy_score(y_test, y_test_pred)
test_conf_matrix = confusion_matrix(y_test, y_test_pred)

# คำนวณสัดส่วนของค่า 0 และ 1 ใน y_train และ y_test
train_churn_0 = (y_train == 0).sum()
train_churn_1 = (y_train == 1).sum()
test_churn_0 = (y_test == 0).sum()
test_churn_1 = (y_test == 1).sum()

train_total = len(y_train)
test_total = len(y_test)

train_churn_0_percent = (train_churn_0 / train_total) * 100
train_churn_1_percent = (train_churn_1 / train_total) * 100
test_churn_0_percent = (test_churn_0 / test_total) * 100
test_churn_1_percent = (test_churn_1 / test_total) * 100

# แสดงผลลัพธ์
print("========================== Logistic Classifier ========================")
print("Train confusion matrix:")
print(train_conf_matrix)
print(f"Train accuracy: {train_accuracy * 100:.3f} %")

print(f"Train set: Churn 0 = {train_churn_0} ({train_churn_0_percent:.2f}%) | Churn 1 = {train_churn_1} ({train_churn_1_percent:.2f}%)")

print("\nTest confusion matrix:")
print(test_conf_matrix)
print(f"Test accuracy: {test_accuracy * 100:.3f} %")

print(f"Test set: Churn 0 = {test_churn_0} ({test_churn_0_percent:.2f}%) | Churn 1 = {test_churn_1} ({test_churn_1_percent:.2f}%)")
print("=======================================================================")


# In[41]:


from imblearn.over_sampling import SMOTE
print("Classification Report:")
print(classification_report(y_test, y_test_pred))


# In[42]:


# ดึงค่าสัมประสิทธิ์ของตัวแปร (Beta coefficients) และค่า intercept
coefficients = model.coef_[0]  # ค่าสัมประสิทธิ์ของแต่ละตัวแปร
intercept = model.intercept_[0]  # ค่า intercept

# แสดงผลค่าสัมประสิทธิ์อย่างเป็นระเบียบ
print("\n========================== Coefficients (Beta) ========================")
print(f"{'Variable':<30} {'Coefficient (Beta)':>20}")  # หัวตาราง
print(f"{'Intercept (β0)':<30} {intercept:>20.4f}")  # แสดงค่า intercept
print("-" * 50)

for i, col in enumerate(X_train.columns):
    print(f"{col:<30} {coefficients[i]:>20.4f}")
    
print("=======================================================================")


# In[32]:


from sklearn.tree import DecisionTreeClassifier
from sklearn.metrics import accuracy_score, confusion_matrix

# สร้างโมเดล Decision Tree
model = DecisionTreeClassifier(random_state=42)
model.fit(X_train, y_train)

# ทำนายผลจาก train และ test
y_train_pred = model.predict(X_train)
y_test_pred = model.predict(X_test)

# คำนวณค่าความแม่นยำและ confusion matrix สำหรับ train set
train_accuracy = accuracy_score(y_train, y_train_pred)
train_conf_matrix = confusion_matrix(y_train, y_train_pred)

# คำนวณค่าความแม่นยำและ confusion matrix สำหรับ test set
test_accuracy = accuracy_score(y_test, y_test_pred)
test_conf_matrix = confusion_matrix(y_test, y_test_pred)

# คำนวณสัดส่วนของค่า 0 และ 1 ใน y_train และ y_test
train_churn_0 = (y_train == 0).sum()
train_churn_1 = (y_train == 1).sum()
test_churn_0 = (y_test == 0).sum()
test_churn_1 = (y_test == 1).sum()

train_total = len(y_train)
test_total = len(y_test)

train_churn_0_percent = (train_churn_0 / train_total) * 100
train_churn_1_percent = (train_churn_1 / train_total) * 100
test_churn_0_percent = (test_churn_0 / test_total) * 100
test_churn_1_percent = (test_churn_1 / test_total) * 100

# แสดงผลลัพธ์
print("========================== Decision Tree Classifier ========================")
print("Train confusion matrix:")
print(train_conf_matrix)
print(f"Train accuracy: {train_accuracy * 100:.3f} %")

print(f"Train set: Churn 0 = {train_churn_0} ({train_churn_0_percent:.2f}%) | Churn 1 = {train_churn_1} ({train_churn_1_percent:.2f}%)")

print("\nTest confusion matrix:")
print(test_conf_matrix)
print(f"Test accuracy: {test_accuracy * 100:.3f} %")

print(f"Test set: Churn 0 = {test_churn_0} ({test_churn_0_percent:.2f}%) | Churn 1 = {test_churn_1} ({test_churn_1_percent:.2f}%)")
print("=======================================================================")


# จะเห็นว่าต้นไม้เกิดการโอเวอร์ฟิต ต้องหาวิธีเพิ่มประสิทธิภาพ ใช้ XGB เพื่อปรับความแปรปรวนของข้อมูล

# In[43]:


from xgboost import XGBClassifier
from sklearn.metrics import accuracy_score, confusion_matrix

# สร้างโมเดล XGBoost
model = XGBClassifier(random_state=42, use_label_encoder=False, eval_metric='logloss')
model.fit(X_train, y_train)

# ทำนายผลจาก train และ test
y_train_pred = model.predict(X_train)
y_test_pred = model.predict(X_test)

# คำนวณค่าความแม่นยำและ confusion matrix สำหรับ train set
train_accuracy = accuracy_score(y_train, y_train_pred)
train_conf_matrix = confusion_matrix(y_train, y_train_pred)

# คำนวณค่าความแม่นยำและ confusion matrix สำหรับ test set
test_accuracy = accuracy_score(y_test, y_test_pred)
test_conf_matrix = confusion_matrix(y_test, y_test_pred)

# คำนวณสัดส่วนของค่า 0 และ 1 ใน y_train และ y_test
train_churn_0 = (y_train == 0).sum()
train_churn_1 = (y_train == 1).sum()
test_churn_0 = (y_test == 0).sum()
test_churn_1 = (y_test == 1).sum()

train_total = len(y_train)
test_total = len(y_test)

train_churn_0_percent = (train_churn_0 / train_total) * 100
train_churn_1_percent = (train_churn_1 / train_total) * 100
test_churn_0_percent = (test_churn_0 / test_total) * 100
test_churn_1_percent = (test_churn_1 / test_total) * 100

# แสดงผลลัพธ์
print("========================== XGBoost Classifier ==========================")
print("Train confusion matrix:")
print(train_conf_matrix)
print(f"Train accuracy: {train_accuracy * 100:.3f} %")

print(f"Train set: Churn 0 = {train_churn_0} ({train_churn_0_percent:.2f}%) | Churn 1 = {train_churn_1} ({train_churn_1_percent:.2f}%)")

print("\nTest confusion matrix:")
print(test_conf_matrix)
print(f"Test accuracy: {test_accuracy * 100:.3f} %")

print(f"Test set: Churn 0 = {test_churn_0} ({test_churn_0_percent:.2f}%) | Churn 1 = {test_churn_1} ({test_churn_1_percent:.2f}%)")
print("=======================================================================")


# เมื่อดูค่าประมวลผลของโมเดลแล้ว จะมาสร้างสมการโมเดลกันต่อ

# หาค่าคงที่และค่าสัมประสิทธิ์

# In[13]:


# แสดงค่าสัมประสิทธิ์และขนาดของ coefficients
print(f'จำนวนค่าสัมประสิทธิ์: {coefficients.shape}')


# In[14]:


import numpy as np

# แปลงตัวแปรหมวดหมู่เป็นตัวเลขด้วย One-hot encoding (ไม่ลบคอลัมน์แรก)
data_encoded = pd.get_dummies(data, columns=['Product Category', 'Payment Method', 'Gender'], drop_first=False)

# ตรวจสอบคอลัมน์ที่มีหลังจากการเข้ารหัส
print(data_encoded.columns)

# คัดเลือกคอลัมน์ที่ต้องใช้สำหรับการคำนวณ
features_for_calculation = data_encoded[['Product Price', 'Quantity', 'Total Purchase Amount', 'Returns', 'Age',
                                        'Product Category_Electronics', 'Product Category_Books', 'Product Category_Home', 
                                        'Product Category_Clothing', 'Payment Method_PayPal', 'Payment Method_Credit Card', 
                                        'Payment Method_Cash', 'Gender_Male', 'Gender_Female']]

# ฟังก์ชันคำนวณ churn ใหม่
def calculate_churn_probability_all(intercept, coefficients, feature_values):
    z = intercept + np.dot(feature_values, coefficients.T)
    probability = 1 / (1 + np.exp(-z))
    return probability

# คำนวณ churn สำหรับข้อมูลทั้งหมด
churn_probabilities = calculate_churn_probability_all(intercept, coefficients.flatten(), features_for_calculation)

# สร้างคอลัมน์ใหม่ใน DataFrame สำหรับค่า churn ที่คำนวณใหม่
data_encoded['Churn_Calculated'] = churn_probabilities

# แสดงผลลัพธ์ของข้อมูลที่มีคอลัมน์ churn ที่คำนวณใหม่
data_encoded[['Customer ID', 'Churn_Calculated']].head()


# In[17]:


# บันทึกผลลัพธ์ที่มีคอลัมน์ 'Churn_Calculated' ลงในไฟล์ CSV ใหม่
output_file_path = 'ecommerce_customer_data_with_churn_calculated.csv'

# บันทึก DataFrame ที่มีคอลัมน์ Churn_Calculated ลงในไฟล์ CSV
data_encoded.to_csv(output_file_path, index=False)


# # ตัวอย่าง

# In[17]:


import numpy as np
# ฟังก์ชัน sigmoid สำหรับคำนวณความน่าจะเป็น
def sigmoid(z):
    return 1 / (1 + np.exp(-z))

# ฟังก์ชันสำหรับคำนวณ logit (z) และนำไปผ่าน sigmoid function
def calculate_probability(intercept, coefficients, X):
    # คำนวณ logit (z)
    logit = intercept + np.dot(coefficients, X)
    
    # คำนวณค่าความน่าจะเป็นโดยใช้ฟังก์ชัน sigmoid
    probability = sigmoid(logit)
    
    return probability

# ดึงค่า Intercept และ Coefficients (ที่ได้จากการฝึกโมเดล)
intercept = 0.0100
coefficients = np.array([ 0.0000, -0.0045,  0.0000, -0.0092,
                         -0.0002,  0.0076,  0.0148,  0.0009,
                         -0.0133,  0.0097, -0.0148,  0.0151,
                          0.0106, -0.0005])

# สมมุติว่าคุณมีข้อมูล X สำหรับลูกค้า (เช่น Customer ID 1)
# คุณสามารถปรับเปลี่ยนค่าของ X ตามต้องการได้
X_new = np.array([456,5,5148,0,67,0,1,0,0,0,1,0,0,1])

# คำนวณค่าความน่าจะเป็น
probability = calculate_probability(intercept, coefficients, X_new)

# แสดงผลลัพธ์
print(f"Predicted probability: {probability}")


# In[ ]:





# In[ ]:





# In[ ]:





# In[ ]:





# In[ ]:





# In[ ]:





# In[ ]:





# In[ ]:





# In[ ]:





# In[ ]:





# In[ ]:





# In[ ]:





# In[ ]:





# In[ ]:





# In[ ]:





# In[ ]:





# In[ ]:





# # หาค่า Churn ใหม่

# # Validateกับไฟล์ที่ 2

# In[23]:


import numpy as np
import pandas as pd

data = pd.read_csv("ecommerce_customer_data_ratios2.csv")

# แปลงตัวแปรหมวดหมู่เป็นตัวเลขด้วย One-hot encoding (ไม่ลบคอลัมน์แรก)
data_encoded = pd.get_dummies(data, columns=['Product Category', 'Payment Method', 'Gender'], drop_first=False)

# ตรวจสอบคอลัมน์ที่มีหลังจากการเข้ารหัส
print(data_encoded.columns)

# คัดเลือกคอลัมน์ที่ต้องใช้สำหรับการคำนวณ
features_for_calculation = data_encoded[['Product Price', 'Quantity', 'Total Purchase Amount', 'Returns', 'Age',
                                        'Product Category_Electronics', 'Product Category_Books', 'Product Category_Home', 
                                        'Product Category_Clothing', 'Payment Method_PayPal', 'Payment Method_Credit Card', 
                                        'Payment Method_Cash', 'Gender_Male', 'Gender_Female']]

# ฟังก์ชันคำนวณ churn ใหม่
def calculate_churn_probability_all(intercept, coefficients, feature_values):
    z = intercept + np.dot(feature_values, coefficients.T)
    probability = 1 / (1 + np.exp(-z))
    return probability

# ดึงค่า Intercept และ Coefficients (ที่ได้จากการฝึกโมเดล)
intercept = -0.53388139
coefficients = np.array([0.0000, -0.0045,  0.0000, -0.0092,
                         -0.0002,  0.0076,  0.0148,  0.0009,
                         -0.0133,  0.0097, -0.0148,  0.0151,
                          0.0106, -0.0005])

# คำนวณ churn สำหรับข้อมูลทั้งหมด
churn_probabilities = calculate_churn_probability_all(intercept, coefficients.flatten(), features_for_calculation)

# สร้างคอลัมน์ใหม่ใน DataFrame สำหรับค่า churn ที่คำนวณใหม่
data_encoded['Churn_Calculated'] = churn_probabilities

# แสดงผลลัพธ์ของข้อมูลที่มีคอลัมน์ churn ที่คำนวณใหม่
data_encoded[['Customer ID', 'Churn_Calculated']].head()


# In[20]:


# บันทึกผลลัพธ์ที่มีคอลัมน์ 'Churn_Calculated' ลงในไฟล์ CSV ใหม่
output_file_path = 'ecommerce_customer_data_with_Validate.csv'

# บันทึก DataFrame ที่มีคอลัมน์ Churn_Calculated ลงในไฟล์ CSV
data_encoded.to_csv(output_file_path, index=False)


# # sigmoid ของไฟล์ที่ 2

# In[5]:


# ฟังก์ชัน sigmoid สำหรับคำนวณความน่าจะเป็น
def sigmoid(z):
    return 1 / (1 + np.exp(-z))

# ฟังก์ชันสำหรับคำนวณ logit (z) และนำไปผ่าน sigmoid function
def calculate_probability(intercept, coefficients, X):
    # คำนวณ logit (z)
    logit = intercept + np.dot(coefficients, X)
    
    # คำนวณค่าความน่าจะเป็นโดยใช้ฟังก์ชัน sigmoid
    probability = sigmoid(logit)
    
    return probability

# ดึงค่า Intercept และ Coefficients (ที่ได้จากการฝึกโมเดล)
intercept = -0.53388139
coefficients = np.array([-9.11459131e-05, -1.55800795e-02, -9.17552099e-06, -2.06271614e-01,
                         -1.98543002e-03, -1.37279999e-01, -1.30545654e-01, -1.40813176e-01,
                         -1.25235991e-01, -1.50792385e-01, -2.31204839e-01, -1.51877596e-01,
                         -2.91181653e-01, -2.42693166e-01])

# สมมุติว่าคุณมีข้อมูล X สำหรับลูกค้า (เช่น Customer ID 1)
# คุณสามารถปรับเปลี่ยนค่าของ X ตามต้องการได้
X_new = np.array([169,5,3491,1,70,0,1,0,0,1,0,0,1,0])

# คำนวณค่าความน่าจะเป็น
probability = calculate_probability(intercept, coefficients, X_new)

# แสดงผลลัพธ์
print(f"Predicted probability: {probability}")


# In[21]:


# สร้างโมเดล Logistic Regression
model = LogisticRegression(solver='liblinear')
model.fit(X_train, y_train)

# ทำนายผลจาก train และ test
y_train_pred = model.predict(X_train)
y_test_pred = model.predict(X_test)

# คำนวณค่าความแม่นยำและ confusion matrix สำหรับ train set
train_accuracy = accuracy_score(y_train, y_train_pred)
train_conf_matrix = confusion_matrix(y_train, y_train_pred)

# คำนวณค่าความแม่นยำและ confusion matrix สำหรับ test set
test_accuracy = accuracy_score(y_test, y_test_pred)
test_conf_matrix = confusion_matrix(y_test, y_test_pred)

# แสดงผลลัพธ์แบบที่ต้องการ
print("========================== Logistic Classifier ==========================")
print("Train confusion matrix:")
print(train_conf_matrix)
print(f"Train accuracy: {train_accuracy * 100:.3f} %")

print("\nTest confusion matrix:")
print(test_conf_matrix)
print(f"Test accuracy: {test_accuracy * 100:.3f} %")
print("=========================================================================")


# In[24]:


from sklearn.linear_model import LogisticRegression
from sklearn.metrics import accuracy_score, confusion_matrix, classification_report

# สร้างโมเดล Logistic Regression
model = LogisticRegression(solver='liblinear')
model.fit(X_train, y_train)

# ทำนายผลจาก train และ test
y_train_pred = model.predict(X_train)
y_test_pred = model.predict(X_test)

# คำนวณค่าความแม่นยำและ confusion matrix สำหรับ train set
train_accuracy = accuracy_score(y_train, y_train_pred)
train_conf_matrix = confusion_matrix(y_train, y_train_pred)

# คำนวณค่าความแม่นยำและ confusion matrix สำหรับ test set
test_accuracy = accuracy_score(y_test, y_test_pred)
test_conf_matrix = confusion_matrix(y_test, y_test_pred)

# แสดงผลลัพธ์แบบที่ต้องการ
print("========================== Logistic Classifier ==========================")
print("Train confusion matrix:")
print(train_conf_matrix)
print(f"Train accuracy: {train_accuracy * 100:.3f} %")

# แสดงผล precision, recall, f1-score, และ support สำหรับ train set
train_classification_report = classification_report(y_train, y_train_pred)
print("\nTrain classification report:")
print(train_classification_report)

print("\nTest confusion matrix:")
print(test_conf_matrix)
print(f"Test accuracy: {test_accuracy * 100:.3f} %")

# แสดงผล precision, recall, f1-score, และ support สำหรับ test set
test_classification_report = classification_report(y_test, y_test_pred)
print("\nTest classification report:")
print(test_classification_report)
print("=========================================================================")


# In[29]:


from sklearn.tree import DecisionTreeClassifier
from sklearn.metrics import accuracy_score, confusion_matrix, classification_report

# สร้างโมเดล Decision Tree
model = DecisionTreeClassifier(random_state=42)
model.fit(X_train, y_train)

# ทำนายผลจาก train และ test
y_train_pred = model.predict(X_train)
y_test_pred = model.predict(X_test)

# คำนวณค่าความแม่นยำและ confusion matrix สำหรับ train set
train_accuracy = accuracy_score(y_train, y_train_pred)
train_conf_matrix = confusion_matrix(y_train, y_train_pred)

# คำนวณค่าความแม่นยำและ confusion matrix สำหรับ test set
test_accuracy = accuracy_score(y_test, y_test_pred)
test_conf_matrix = confusion_matrix(y_test, y_test_pred)

# คำนวณสัดส่วนของค่า 0 และ 1 ใน y_train และ y_test
train_churn_0 = (y_train == 0).sum()
train_churn_1 = (y_train == 1).sum()
test_churn_0 = (y_test == 0).sum()
test_churn_1 = (y_test == 1).sum()

train_total = len(y_train)
test_total = len(y_test)

train_churn_0_percent = (train_churn_0 / train_total) * 100
train_churn_1_percent = (train_churn_1 / train_total) * 100
test_churn_0_percent = (test_churn_0 / test_total) * 100
test_churn_1_percent = (test_churn_1 / test_total) * 100

# แสดงผลลัพธ์
print("========================== Decision Tree Classifier ========================")
print("Train confusion matrix:")
print(train_conf_matrix)
print(f"Train accuracy: {train_accuracy * 100:.3f} %")

print(f"Train set: Churn 0 = {train_churn_0} ({train_churn_0_percent:.2f}%) | Churn 1 = {train_churn_1} ({train_churn_1_percent:.2f}%)")

print("\nTest confusion matrix:")
print(test_conf_matrix)
print(f"Test accuracy: {test_accuracy * 100:.3f} %")

print(f"Test set: Churn 0 = {test_churn_0} ({test_churn_0_percent:.2f}%) | Churn 1 = {test_churn_1} ({test_churn_1_percent:.2f}%)")

# แสดงผล classification report
print("\n======================= Classification Report (Train) =======================")
print(classification_report(y_train, y_train_pred, target_names=['Churn 0', 'Churn 1']))

print("\n======================= Classification Report (Test) =======================")
print(classification_report(y_test, y_test_pred, target_names=['Churn 0', 'Churn 1']))

print("=======================================================================")


# In[28]:


from xgboost import XGBClassifier
from sklearn.metrics import accuracy_score, confusion_matrix, classification_report

# สร้างโมเดล XGBoost
model = XGBClassifier(random_state=42, use_label_encoder=False, eval_metric='logloss')
model.fit(X_train, y_train)

# ทำนายผลจาก train และ test
y_train_pred = model.predict(X_train)
y_test_pred = model.predict(X_test)

# คำนวณค่าความแม่นยำและ confusion matrix สำหรับ train set
train_accuracy = accuracy_score(y_train, y_train_pred)
train_conf_matrix = confusion_matrix(y_train, y_train_pred)

# คำนวณค่าความแม่นยำและ confusion matrix สำหรับ test set
test_accuracy = accuracy_score(y_test, y_test_pred)
test_conf_matrix = confusion_matrix(y_test, y_test_pred)

# คำนวณสัดส่วนของค่า 0 และ 1 ใน y_train และ y_test
train_churn_0 = (y_train == 0).sum()
train_churn_1 = (y_train == 1).sum()
test_churn_0 = (y_test == 0).sum()
test_churn_1 = (y_test == 1).sum()

train_total = len(y_train)
test_total = len(y_test)

train_churn_0_percent = (train_churn_0 / train_total) * 100
train_churn_1_percent = (train_churn_1 / train_total) * 100
test_churn_0_percent = (test_churn_0 / test_total) * 100
test_churn_1_percent = (test_churn_1 / test_total) * 100

# แสดงผลลัพธ์
print("========================== XGBoost Classifier ==========================")
print("Train confusion matrix:")
print(train_conf_matrix)
print(f"Train accuracy: {train_accuracy * 100:.3f} %")

print(f"Train set: Churn 0 = {train_churn_0} ({train_churn_0_percent:.2f}%) | Churn 1 = {train_churn_1} ({train_churn_1_percent:.2f}%)")

print("\nTest confusion matrix:")
print(test_conf_matrix)
print(f"Test accuracy: {test_accuracy * 100:.3f} %")

print(f"Test set: Churn 0 = {test_churn_0} ({test_churn_0_percent:.2f}%) | Churn 1 = {test_churn_1} ({test_churn_1_percent:.2f}%)")

# แสดงผล classification report
print("\n======================= Classification Report (Train) =======================")
print(classification_report(y_train, y_train_pred, target_names=['Churn 0', 'Churn 1']))

print("\n======================= Classification Report (Test) =======================")
print(classification_report(y_test, y_test_pred, target_names=['Churn 0', 'Churn 1']))

print("=======================================================================")


#  # ต้นไม้ Total Purchase Amount 

# In[39]:


import pandas as pd
from sklearn.tree import DecisionTreeClassifier
from sklearn.preprocessing import LabelEncoder
from sklearn.model_selection import train_test_split
from sklearn import tree
import matplotlib.pyplot as plt

# นำเข้าข้อมูล
df = pd.read_csv("Newchurn.csv")

# จัดกลุ่ม Total Purchase Amount เป็น "น้อยกว่า 2725" และ "มากกว่า 2725"
df['Total_Purchase_Amount_Group'] = pd.cut(df['Total Purchase Amount'], 
                                           bins=[0, 2725, df['Total Purchase Amount'].max()], 
                                           labels=['<2725', '>=2725'], right=False)

# เข้ารหัสข้อมูลประเภทเพื่อเตรียมสำหรับการสร้าง decision tree
le_purchase_amount = LabelEncoder()
le_Churn_Calculated = LabelEncoder()

# เข้ารหัสข้อมูล 'Total_Purchase_Amount_Group' และ 'Churn_Calculated'
df['Total_Purchase_Amount_Group'] = le_purchase_amount.fit_transform(df['Total_Purchase_Amount_Group'])
df['Churn_Calculated'] = le_Churn_Calculated.fit_transform(df['Churn_Calculated'])

# กำหนด X (ข้อมูลคุณลักษณะ) และ y (เป้าหมายที่ต้องการทำนาย)
X = df[['Total_Purchase_Amount_Group']]  # คุณลักษณะที่ใช้: กลุ่มจำนวนเงินในการซื้อ
y = df['Churn_Calculated']  # ค่าที่ต้องการทำนาย: การคำนวณ Churn

# แบ่งข้อมูลออกเป็นชุดการฝึกฝน (training set) และชุดการทดสอบ (testing set)
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# สร้างโมเดล Decision Tree
dt_model = DecisionTreeClassifier(random_state=42)
dt_model.fit(X_train, y_train)

# วาดกราฟ Decision Tree
plt.figure(figsize=(12,8))
tree.plot_tree(dt_model, 
               feature_names=['Total_Purchase_Amount_Group'], 
               class_names=le_Churn_Calculated.classes_.astype(str),  # แปลงคลาสเป็นสตริง
               filled=True)
plt.title('Decision Tree: Churn Calculated Prediction based on Total Purchase Amount')
plt.show()


# In[ ]:





# In[ ]:





# In[ ]:


#ค่าเฉลี่ยAge max=18 ,min=70
average_age = df['Age'].mean()
average_age


# In[5]:


import seaborn as sns
import matplotlib.pyplot as plt

# สร้าง correlation matrix
corr_matrix = data.corr()

# สร้าง heatmap
plt.figure(figsize=(10,8))
sns.heatmap(corr_matrix, annot=True, cmap="coolwarm")
plt.show()


# In[24]:


# นำเข้าห้องสมุดที่จำเป็น
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import accuracy_score, precision_score, recall_score, f1_score, roc_auc_score, roc_curve, confusion_matrix, classification_report
import matplotlib.pyplot as plt

# อ่านข้อมูล (คุณสามารถใส่ path ของไฟล์ข้อมูลของคุณเอง)
data = pd.read_csv("ecommerce_customer_data_filled.csv")

# เลือกเฉพาะตัวแปรที่ต้องการใช้สร้างโมเดล
X = data[['Product Price', 'Quantity', 'Total Purchase Amount', 'Returns', 'Age']]
y = data['Churn']  # ตัวแปรเป้าหมาย

# แบ่งข้อมูลเป็นชุดฝึกสอนและชุดทดสอบ
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# สเกลข้อมูลด้วย StandardScaler
scaler = StandardScaler()
X_train = scaler.fit_transform(X_train)
X_test = scaler.transform(X_test)

# สร้างและฝึกโมเดล Logistic Regression
model = LogisticRegression()
model.fit(X_train, y_train)

# ทำนายผลลัพธ์สำหรับชุดทดสอบ
y_pred = model.predict(X_test)
y_pred_proba = model.predict_proba(X_test)[:, 1]  # ค่าความน่าจะเป็นของคลาสที่เป็น 1

# ประเมินผลลัพธ์ของโมเดล

# Accuracy
accuracy = accuracy_score(y_test, y_pred)
print(f'Accuracy: {accuracy:.2f}')

# Precision
precision = precision_score(y_test, y_pred)
print(f'Precision: {precision:.2f}')

# Recall
recall = recall_score(y_test, y_pred)
print(f'Recall: {recall:.2f}')

# F1-Score
f1 = f1_score(y_test, y_pred)
print(f'F1-Score: {f1:.2f}')

# ROC-AUC
roc_auc = roc_auc_score(y_test, y_pred_proba)
print(f'ROC-AUC: {roc_auc:.2f}')

# Confusion Matrix
conf_matrix = confusion_matrix(y_test, y_pred)
print('Confusion Matrix:')
print(conf_matrix)

# Classification Report
class_report = classification_report(y_test, y_pred)
print('Classification Report:')
print(class_report)

# สร้าง ROC Curve
fpr, tpr, thresholds = roc_curve(y_test, y_pred_proba)

plt.figure(figsize=(8, 6))
plt.plot(fpr, tpr, label=f'ROC Curve (AUC = {roc_auc:.2f})')
plt.plot([0,1], [0,1], 'k--')  # เส้นทแยงมุมแสดงถึงการทำนายแบบสุ่ม
plt.xlabel('False Positive Rate')
plt.ylabel('True Positive Rate')
plt.title('ROC Curve')
plt.legend(loc='lower right')
plt.show()


# In[25]:


import pandas as pd
from sklearn.tree import DecisionTreeClassifier
from sklearn.preprocessing import LabelEncoder
from sklearn.model_selection import train_test_split
from sklearn import tree
import matplotlib.pyplot as plt

# นำเข้าข้อมูล
prepared_data = pd.read_csv("Newchurn.csv")

# จัดกลุ่มช่วงอายุเป็น "น้อยกว่า 44" และ "มากกว่า 44"
prepared_data['Age_Group'] = pd.cut(prepared_data['Age'], bins=[0, 44, 100], labels=['<44', '>=44'], right=False)

# จัดกลุ่ม Total Purchase Amount เป็น "น้อยกว่า 2725" และ "มากกว่า 2725"
prepared_data['Total_Purchase_Amount_Group'] = pd.cut(prepared_data['Total Purchase Amount'], 
                                                     bins=[0, 2725, prepared_data['Total Purchase Amount'].max()], 
                                                     labels=['<2725', '>=2725'], right=False)

# เข้ารหัสข้อมูลประเภทเพื่อเตรียมสำหรับการสร้าง decision tree
le_gender = LabelEncoder()
le_purchase_amount = LabelEncoder()
le_Churn_Calculated = LabelEncoder()

# เข้ารหัสข้อมูล 'Age_Group', 'Total_Purchase_Amount_Group', และ 'Product Category'
prepared_data['Gender'] = le_gender.fit_transform(prepared_data['Gender'])
prepared_data['Total_Purchase_Amount_Group'] = le_purchase_amount.fit_transform(prepared_data['Total_Purchase_Amount_Group'])
prepared_data['Churn_Calculated'] = le_Churn_Calculated.fit_transform(prepared_data['Churn_Calculated'])

# กำหนด X (ข้อมูลคุณลักษณะ) และ y (เป้าหมายที่ต้องการทำนาย)
X = prepared_data[['Gender', 'Total_Purchase_Amount_Group']]  # คุณลักษณะที่ใช้: กลุ่มอายุ และ กลุ่มจำนวนเงินในการซื้อ
y = prepared_data['Churn_Calculated']  # ค่าที่ต้องการทำนาย: ประเภทสินค้า

# แบ่งข้อมูลออกเป็นชุดการฝึกฝน (training set) และชุดการทดสอบ (testing set)
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# สร้างโมเดล Decision Tree
dt_model = DecisionTreeClassifier(random_state=42)
dt_model.fit(X_train, y_train)

# Convert class names to string to avoid the error
class_names = [str(class_name) for class_name in le_Churn_Calculated.classes_]

# วาดกราฟ Decision Tree
plt.figure(figsize=(12,8))
tree.plot_tree(dt_model, feature_names=['Gender', 'Total_Purchase_Amount_Group'], class_names=class_names, filled=True)
plt.title('Decision Tree: Churn_Calculated Prediction based on Gender and Purchase Amount')
plt.show()


# In[ ]:





# In[44]:


# นำเข้าไลบรารีที่จำเป็น
import pandas as pd
from sklearn.linear_model import LogisticRegression
from sklearn.model_selection import train_test_split
from sklearn.metrics import accuracy_score, confusion_matrix, classification_report
from imblearn.over_sampling import SMOTE  # สำหรับแก้ไขปัญหาข้อมูลที่ไม่สมดุล

# นำเข้าข้อมูล
prepared_data = pd.read_csv("Newchurn.csv")

# แบ่งข้อมูลเป็น train และ test
X = data[['Product Category', 'Product Price', 'Quantity', 'Total Purchase Amount', 'Payment Method', 'Returns', 'Age', 'Gender']]
y = data['Churn']

# แปลงฟีเจอร์ที่เป็นประเภท (categorical) ให้เป็นตัวเลขด้วย get_dummies
X = pd.get_dummies(X, drop_first=True)

# ใช้ SMOTE เพื่อแก้ไขปัญหาคลาสที่ไม่สมดุลกัน
smote = SMOTE(random_state=42)
X_resampled, y_resampled = smote.fit_resample(X, y)

# แบ่งข้อมูลเป็น train และ test
X_train, X_test, y_train, y_test = train_test_split(X_resampled, y_resampled, test_size=0.2, random_state=42)

# สร้างโมเดล Logistic Regression
model = LogisticRegression(solver='liblinear')
model.fit(X_train, y_train)

# ทำนายผล
y_pred = model.predict(X_test)

# ประเมินผลลัพธ์
print("ความแม่นยำ (Accuracy):", accuracy_score(y_test, y_pred))
print("Confusion Matrix:\n", confusion_matrix(y_test, y_pred))
print("Classification Report:\n", classification_report(y_test, y_pred))


# In[ ]:




