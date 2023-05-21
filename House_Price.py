#!/usr/bin/env python
# coding: utf-8

# In[1]:


pwd


# Import Libraries into Jupyter file

# In[37]:


import numpy as np
import pandas as pd
import seaborn as sns


# In[ ]:





# In[6]:


df = pd.read_csv('C:/Users/J96Pi/OneDrive/Documents/Data Analysis Training/Data Analyst Skillpath Zero to Hero in Excell, SQL & Python/Part 3 - Regression using Python/house_price.csv', header=0)


# In[7]:


df.head()


# I want to find the number or rows and columns in the data set.

# In[8]:


df.shape


# I found the Extended Data Dictionary of the variables
# 

# In[9]:


df.describe()


# I found issues with the rainfall and hotel room data, so converted them to scatterplots to further analyse the data

# In[10]:


sns.jointplot(x='n_hot_rooms', y='price', data=df)


# I found 2 outliers.
# 

# In[11]:


sns.jointplot(x='rainfall', y='price', data=df)


# I found 1 outlier.
# 

# I wanted to plot a graph for the airport column, which is categorical data
# 

# In[12]:


sns.countplot(x='airport', data=df) 


# In[13]:


sns.countplot(x='waterbody', data = df)


# In[14]:


sns.countplot(x='bus_ter', data=df)


#  I found 4 observations from these graphs/EDD
#  1. There were missing values in n_hot_beds,
#  2. There was either a skewness or outliers in crime_rate,
#  3. There were outliers in n_hot_rooms and rainfall,
#  4. There was only the answer 'YES' in bus_ter,
#  

# In[16]:


df.info()


# Wanted to find the 99th and 1st percentile with the variables 'rainfall' and 'n_hot_rooms' so that I can cap the outliers off.
# 

# In[18]:


np.percentile(df.n_hot_rooms,[99])


# In[19]:


np.percentile(df.n_hot_rooms,[99])[0]


# In[20]:


uv = np.percentile(df.n_hot_rooms,[99])[0]


# In[21]:


df[(df.n_hot_rooms>uv)]


# The outliers have been identified, I will now single out the outliers that will not be included in my statistical analysis

# In[22]:


df.n_hot_rooms[(df.n_hot_rooms>3*uv)] = 3*uv


# Now I had to find the outliers for rainfall

# In[23]:


np.percentile(df.rainfall,[1])[0]


# In[24]:


lv = np.percentile(df.rainfall,[1])[0]


# In[28]:


df[(df.rainfall<lv)]


# In[27]:


df.rainfall[(df.rainfall <0.3*lv)] = 0.3*lv


# Need to check the crime rate variable

# In[30]:


sns.jointplot(x='crime_rate', y='price', data=df)


# In[31]:


df.describe()


# The  for n_hot_rooms is much lower now at 46 and their mean and median values are closer. For rainfall the lower value is now 6 and it's mean and median values are closer also.

# I now wanted to impute missing values into n_hot_beds.

# In[32]:


df.n_hos_beds = df.n_hos_beds.fillna(df.n_hos_beds.mean())


# The count in n_hos_beds is now 506, so all values are filled out,

# In[33]:


df.info()


# Wants to transform the crime rate variable due to its skewness.

# In[39]:


sns.jointplot(x='crime_rate', y='price', data=df)


# In[40]:


df.crime_rate = np.log(1+df.crime_rate)


# In[41]:


sns.jointplot(x='crime_rate', y='price', data=df)


# I chose to create a new variable, combining the four 'dist' variables

# In[42]:


df['avg_dist'] = (df.dist1+df.dist2+df.dist3+df.dist4)/4


# In[43]:


df.describe()


# I then deleted the 4 individual 'dist' variables,

# In[44]:


del df['dist1']


# In[45]:


del df['dist2']


# In[47]:


del df['dist3']


# In[48]:


del df['dist4']


# In[49]:


del df['bus_ter']


# I created dummy variables, for the categorical variables, so that I could run a regression analysis

# In[50]:


df = pd.get_dummies(df)


# In[51]:


del df['airport_NO']


# In[52]:


del df['waterbody_None']


# In[54]:


df.head()


# I created a correlation matrix to find variables that were important, and others that were less improtant for my analysis

# In[55]:


df.corr()


#  I wanted to avoid multicollinearity, so I looked for variables that correlated highly and found that parks and air quality did. I then deleted the parks variable as this did not correlate as strongly with house price.

# In[57]:


del df['parks']


# In[59]:


import statsmodels.api as sn


# In[60]:


x = sn.add_constant(df['room_num'])


# In[61]:


lm = sn.OLS(df['price'], x).fit()


# In[62]:


lm.summary()


# The p, of the T value is less than 0.01, indicating the variables 'room_num' and 'price' have a significant relationship with one another. The r squared indicates is just below the ideal point of 0.5 for a simple regression model using one variable.

# In[63]:


sns.jointplot(x=df['room_num'], y = df['price'], data = df, kind = 'reg')


# I planned to create a multiple linear regression model with all the variables in the dataset

# In[69]:


y_multi = df['price']


# In[68]:


x_multi = df.drop("price",axis=1)


# In[70]:


x_multi_cons = sn.add_constant(x_multi)


# In[73]:


lm_multi = sn.OLS(y_multi, x_multi_cons).fit()


# In[75]:


lm_multi.summary()


# From the multiple linear regression model I found:
# * A significant regression equation was found (F (490,15) = 84.32, p = 4.19e-125) so the independent variables have some impact on the dependent variable,
# * The adjusted R**2 to be 0.721, which indicates the model is an significant predictor of house prices,
# * The predictors that were most significant at determining 'house_price' were air quality, room numbers, amount of teachers, proportion of the poor population and the average distance from work offices.
# * As air quality increases, house prices decrease,
# * As the amount of rooms increases, the house prices increase also,
# * As the amount of teachers increase, the house prices increase,
# * As the portion of poorer poulations increase, the house prices decrease,
# * As the average distance from work offices increases, house prices decrease,

# In[ ]:


conda install -c conda-forge nbconvert-webpdf


# In[ ]:


conda install -c "conda-forge/label/broken" nbconvert-webpdf


# In[ ]:


py -m pip install "SomeProject"


# In[ ]:




