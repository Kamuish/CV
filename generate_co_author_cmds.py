biblio_file = "CoAuthor.bib"


mapping = {}

new_line = r"\item \fullcite{"

def within_brackets(line:str) -> str:
	return line.split("{")[-1].split("}")[0]

with open(biblio_file) as to_read:
	in_entry = False
	paper_key = None 

	for line in to_read:
		if "@" in line and ("article" in line or "misc" in line or "inproceedings" in line):
			paper_key = within_brackets(line)
			paper_key = paper_key.replace(",", "")
			paper_key = paper_key.replace("\n", "")
			print("--", paper_key,"..",)

		if "year =" in line:
			paper_year = int(within_brackets(line))

			if paper_year not in mapping:
				mapping[paper_year] = []

			mapping[paper_year].append(paper_key)

print(mapping.keys(), list(mapping.keys()), list(mapping.keys()).sort())

years = list(mapping.keys())
years.sort()

for key in years[::-1]:
	for paper in mapping[key]:
		print(new_line + f"{paper}" + r"}")
