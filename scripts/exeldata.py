import numpy
import pandas
from datetime import datetime

fp = "income.csv"

df = pandas.read_csv(fp)


df.dropna(axis=1,how="all",inplace=True)
df.dropna(axis=0,how="all",inplace=True)

df["date"] = df["date"].apply(lambda x: datetime.strptime(x,"%d.%m.%Y"))
df["date"] = df["date"].apply(lambda x: x.strftime("%Y-%m-%d"))
df["category"] = df["category"].apply(lambda x: x.lower())
df["amount"] = df["amount"].apply(lambda x: x.replace("$","").replace("€","").strip())

print(df.head(5))


df.to_csv("clean_income.csv")