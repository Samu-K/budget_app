# path to file
fp = "cats.txt"

# read in the categories and their corresponding id's
swd = dict()
with open(fp,"r") as f:
    for line in f:
        spl = line.strip().split(",")
        swd[spl[1]] = spl[0]
    f.close()

# open our file and read it line by line
with open("clean_income.txt","r") as f:
    for line in f:
        # split by comma
        spl = line.strip().split(",")
        
        # we know category is fifth element
        category_txt = spl[4]
        
        # find id from previous dictonary
        category_digit = swd[category_txt]
        
        # replace the text with the correct id
        new_line = line.replace(category_txt,str(category_digit))

        # write the cleaned line to a new file
        with open("clean_income_fixed.txt","a") as n:
            n.write(new_line)
            n.close()
            
    # close the file after processing
    f.close()