import streamlit as st
import pandas as pd
import requests
import matplotlib.pyplot as plt
from datetime import datetime

st.title("Calorie Tracker")
st.subheader("Store basic nutritional information of all your meals")

# Initialize cumulative lists to store meal data
meals_list = []

# Allow users to input meal name (multiple meals separated by comma)
meal_input = st.text_input(
    "Enter Meal Name(s) - Write the weight before each dish (ex: '8 gram Hamburger, 6 oz Salad'). You can also write several ingredients separated by a comma.")

# Select box for time of day
time_of_day = st.selectbox("Select Time of Day", ["Breakfast", "Lunch", "Dinner"])


# Function to get current timestamp
def get_timestamp():
    return datetime.now().strftime("%Y-%m-%d %H:%M:%S")


# Function to update meals_list with new meals
def update_meals_list(new_meals):
    for meal_name in new_meals:
        app_id = "52093577"  # Replace with your actual app ID
        app_key = "0add51f09666a0814924ccb3ceb9a94c"  # Replace with your actual app key
        endpoint = "nutrition-data"
        url = f"https://api.edamam.com/api/{endpoint}"

        params = {
            "app_id": app_id,
            "app_key": app_key,
            "ingr": meal_name
        }

        response = requests.get(url, params=params)

        if response.status_code == 200:
            meal_info = response.json()
            if 'calories' in meal_info and 'totalNutrients' in meal_info:
                calories = meal_info['calories']
                nutrients = meal_info['totalNutrients']

                # Extract Fats, Carbohydrates, Proteins data
                fats = nutrients.get('FAT', {}).get('quantity', 0)
                carbs = nutrients.get('CHOCDF', {}).get('quantity', 0)
                proteins = nutrients.get('PROCNT', {}).get('quantity', 0)

                # Store user input, fetched nutritional information, and calories into a dictionary
                meal_data = {
                    'Meal': meal_name,
                    'Calories': calories,
                    'Fats': fats,
                    'Carbohydrates': carbs,
                    'Proteins': proteins,
                    'Time of Day': time_of_day,
                    'Timestamp': get_timestamp()
                }
                meals_list.append(meal_data)  # Append meal_data to the meals_list

            else:
                st.warning(f"Calories or nutritional information not found for the meal: {meal_name}")
        else:
            st.error(f"Error: {response.status_code} for the meal: {meal_name}. Please check the meal name for any typos or errors.")

    return meals_list


if st.button("Add Meals"):
    if meal_input:
        # Split the input into individual meals
        individual_meals = [meal.strip() for meal in meal_input.split(',')]
        updated_meals = update_meals_list(individual_meals)

        if updated_meals:  # Display only if meals_list is not empty
            # Create a cumulative DataFrame for all meals entered
            df_all_meals = pd.DataFrame(updated_meals)

            # Display updated DataFrame with all meals entered, including calories
            st.write(df_all_meals)

            # Plot the PIE chart based on the cumulative nutritional information
            fig_pie, ax_pie = plt.subplots(figsize=(8, 6))
            cumulative_nutrients = df_all_meals[['Fats', 'Carbohydrates', 'Proteins']].sum()
            labels = ['Fats', 'Carbohydrates', 'Proteins']
            ax_pie.pie(cumulative_nutrients, labels=labels, autopct='%1.1f%%', startangle=90)
            ax_pie.axis('equal')  # Equal aspect ratio ensures that the pie is drawn as a circle.
            ax_pie.set_title('Cumulative Nutrient Distribution')
            ax_pie.grid(True)

            # Plot the LINE chart for cumulative nutritional intake over time
            fig_line, ax_line = plt.subplots(figsize=(8, 6))

            for nutrient in ['Calories', 'Fats', 'Carbohydrates', 'Proteins']:
                ax_line.plot(df_all_meals['Meal'], df_all_meals[nutrient].cumsum(), marker='o', label=nutrient)
            ax_line.set_xlabel('Meal Name')
            ax_line.set_ylabel('Cumulative Nutritional Value')
            ax_line.set_title('Cumulative Nutritional Intake Over Time')
            ax_line.legend()
            ax_line.grid(True)

            # Plot the bar chart for cumulative nutritional intake
            fig_bar, ax_bar = plt.subplots(figsize=(8, 6))

            ax_bar.bar(['Fats', 'Carbohydrates', 'Proteins'], cumulative_nutrients)
            ax_bar.set_xlabel('Nutrients')
            ax_bar.set_ylabel('Cumulative Value')
            ax_bar.set_title('Cumulative Nutritional Value')
            ax_bar.grid(True)

            # Display charts vertically using Streamlit columns
            col1, col2 = st.columns(2)
            with col1:
                st.pyplot(fig_pie)
                st.pyplot(fig_line)
            with col2:
                color = st.color_picker("Choose Bar Color", "#ff5733")
                st.pyplot(fig_bar)

                st.success('Your data has been displayed properly!', icon="✅")

        else:
            st.error('This is an error', icon="🚨")