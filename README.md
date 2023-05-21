# Jamal's Data Analyst Portfolio :wave:

## Microsoft Excell | MySQL | Microsoft SQL Server Management Studio | PostgreSQL | Pycharm (Python) | Jupyter Notebook | Power BI

## Analysis of the Citibikes data in New York city using Excell :bike: jay_Copy of New York Citi Bikes_Raw Data.xlsx
- Set up a spreadsheet on google sheets, where I imported NY citi bike data for the past year,
- Was given a task to find the answers to 5 questions:
..What are the most popular pick-up locations across the city for Bike rental?
..How does the average trip duration vary across different age groups?
..Which age group rents the most bikes?
..How does bike rentalvary across the two user groups (ont-time users vs long-term subscribers) on different days of the week?
..Does user age impact the average impact the average bike trip duration?
- I then cleaned my data by removing duplicates and missing data points by creating a filter,
- Found the mean, median and range for the trip duration and the age of the riders,
- The range for the amount of time spent on the bike indicated an outlier, whose row of data was deleted,
- 4 pivot tables were created,
- Then I created a bar chart for the top 20 NY Citi bike pick-up locations,
- I created a column chart showing the average trip duration across different age groups,
- I created another bar chart for the number of bike rentals per age group,
- I also produced a stacked stepped area chart for weekday and user type (being one-time users or a subscriber),
- The final graph I created was a scatter plot which plottd the age of the riders and the length of the trip,

## Short analysis of science, maths and english marks in a classroom using PostgreSQL :open_book: 1 Project Portfolio Science class.sql
- Description of the steps taken in the project document,

## Analysis of product, customer and sales of a US supermarket using PostgreSQL :chair: Project Portfolio US Supermarket.sql / Line chart comparing plotting total sales on months.png
- Description of the steps taken in the project document,

## Analysis of Hotel Revenue 🏨 SQL data analysis.sql/ Power BI Hotels Presentation.pbix
- I built a visual data dashboard using data from an excell spreadsheet and Power BI to present answers to three questions:
1. Is the hotel revenue growingby year?
2. Should they increase their parkinglot size?
3. What trends can we see in the data?
- Initially uploaded the data to Microsoft SQL Server Management Studio, where I created a column for revenue (SELECT
arrival_date_year,
hotel,
round(sum((stays_in_week_nights+stays_in_weekend_nights)*adr),2) as revenue
from hotels
group by arrival_date_year, hotel),
- I also had to join the hotels table to the market segment and meal cost tables (SELECT * FROM hotels
LEFT JOIN dbo.market_segment$
on hotels.market_segment = market_segment$.market_segment
LEFT JOIN dbo.meal_cost$
on meal_cost$.meal = hotels.meal),
- Data was imported into Power BI,
- Had to create the revenue column in Power BI usig 'stays in the week' and 'stays in the weekend' and the discount,
- I imported this revenue into the visual presentation,
- I imported the adr into the visual presentation and converted it into the average figure,
- I also found the percentage of the average discount of hotel stays, 
- I made a new calculations by combining stays in the week and stays in the wekend for a 'Total Nights' column,
- I added 2 filters, one which allowed a filter by the country the hotels are in and the other which filtered for the type of hotel,
- I created a line graph plotting theaverage adr, the total nights the hotels were stayed in and the average discount applied on the on the revenue,
- I then increased the page size to fit more data,
- I created a measure for the amount of parking percentage used, and created a table to put this in, whilst also creating a pie chart that displayed the revenue of each type of hotel,
- Evidence shows there is nota large need for more parking spaces (2.36% of parking spaces filled on average).

## Analysis of House Pricing using Python in Jupyter Notebook
- Imported data regarding house prices and predictor variables into Jupyter Notebook,
- Used descriptive analysis to describe and cleaned all the data,
- Converted categorical data to integer columns,
- Deleted all outliers,
- Used a correlation matrix to assess for multicollinearity,
- Conducted multiple linear regression on the predictors and the dependent variable of house prices,
