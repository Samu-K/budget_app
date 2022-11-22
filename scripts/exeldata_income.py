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
        "debt": "payback",
        "loans": "loan",
        "support": "social benefits",
        "investments": "investment income",
        "other": "other income",
}

cat_ids = {
        "investment income":24,
        "salary":14, 
        "loan": 15,
        "social benefits":16,
        "payback":17,
        "other income": 18,
}

# change category names
for old, new in cats_to_change.items():
    df.loc[df["category"] == old,"category"] = new

for cat, id in cat_ids.items():
    df.loc[df["category"] == cat, "category"] = id

# Save the cleaned csv to new file
df.to_csv(output)
