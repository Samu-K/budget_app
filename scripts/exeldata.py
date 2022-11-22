# Imports
import numpy
import pandas
from datetime import datetime

# Read our data to a dataframe
fp = input("Give file path: ")
output = input("Output file: ")

df = pandas.read_csv(fp)

# Drop rows and columns that are only nan
df.dropna(axis=1,how="all",inplace=True)
df.dropna(axis=0,how="all",inplace=True)

# Convert date to correct format
df["date"] = df["date"].apply(lambda x: datetime.strptime(x,"%d.%m.%Y"))
df["date"] = df["date"].apply(lambda x: x.strftime("%Y-%m-%d"))

# set category names to all lowrcase
df["category"] = df["category"].apply(lambda x: x.lower())

# set amounts to euros
df["amount"] = df["amount"].apply(lambda x: x.replace("$","").replace('"',"").replace("€","").replace(" ","").replace(",",".").strip())

cats_to_change = {
        "vehicle maintenence": "utility",
        "electric scooters": "e-scooters",
        "vinyl": "entertainment",
        "debt": "payback",
        "gas": "utility",
        "gifts": "shopping",
        "gym memberships": "subscriptions (gym etc)",
        "cleaning supplies": "utility",
        "insurance": "subscriptions (gym etc)",
        "subscriptions": "subscriptions (non-essential)",
        "public transportation": "public transport",
        "internet": "utility",
        "utilities": "utility",
        "furniture": "apartment",
        "gambling": "entertainment",
        "games": "entertainment",
        "books": "entertainment",
        "clothing": "clothes",
        "investements": "investments",
        "other": "other expenses"
}

cat_ids = {
        "groceries":1,
        "school food":2,
        "clothes":3,
        "rent":4,
        "electronics":5,
        "work":6,
        "going out":7,
        "subscriptions (gym etc)":8,
        "public transport":9,
        "travel":10,
        "shopping":11,
        "investments":12,
        "entertainment":13,
        "utility":19,
        "subscriptions (non-essential)":20,
        "e-scooters":21,
        "apartment":22,
        "eating out":23,
        "other expenses":25

}

# changei category names
for old, new in cats_to_change.items():
    df.loc[df["category"] == old,"category"] = new

for cat, id in cat_ids.items():
    df.loc[df["category"] == cat, "category"] = id

# Save the cleaned csv to new file
df.to_csv(output)
