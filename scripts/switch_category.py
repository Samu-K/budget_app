fp = "cats.txt"

swd = dict()
with open(fp,"r") as f:
    for line in f:
        spl = line.strip().split(",")
        swd[spl[1]] = spl[0]
    f.close()

with open("clean_income.txt","r") as f:
    for line in f:
        spl = line.strip().split(",")
        category_txt = spl[4]
        category_digit = swd[category_txt]
        new_line = line.replace(category_txt,str(category_digit))

        with open("clean_income_fixed.txt","a") as n:
            n.write(new_line)
            n.close()
    f.close()