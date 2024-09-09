"""
Generate the publications.text file from the .bib files!!!

"""


from pathlib import Path 
import bibtexparser
from collections import defaultdict

data_map = {"first_author": "first_author.bib",
            "coAuthor": "CoAuthor.bib",
            "Posters": "posters.bib"
            }


info_map = {"first_author": {"title": "\langen{First-author Papers}\langpt{Autor principal}"
                             },
            "coAuthor": {"title": "\langen{Co-authored Papers}\langpt{Co-autor}"},
            "Posters": {"title": "Posters"},
            
            }

out_file = "/home/amiguel/CV/publications.tex"

def load_from_field(field) -> str:
    out = dict()
    for entry in field:
        out[entry.key] = entry.value
    return out    


def gen_DOI(doi):
    return "\href{http://dx.doi.org/" + doi + "}{" + doi + "}"

latex_entries = defaultdict(list)


for name, file in data_map.items():
    out = bibtexparser.parse_file(file)

    if name == "first_author":
        base_format = "André M. Silva et al, {0} - '{1}', {2} ({4} DOI: {3})"
    elif name == "coAuthor":
        base_format = "{4} et al, {0} - '{1}', {2} ( {5} DOI: {3})"
    elif name == "Posters":
        base_format = "'{0}', {1}, {2}"
    else:
        raise Exception
    
    
    for block in out.blocks:
        data = load_from_field(block.fields)
        print(data["title"])
        
        if name == "first_author":
            entry = base_format.format(data["year"], data["title"], data["journal"], gen_DOI(data["doi"]), r"\textcolor{MarkerColour!80!black}{\scriptsize\faLink}")
            
        elif name == "coAuthor":
            try:
                entry = base_format.format(data["year"], data["title"], data["journal"], gen_DOI(data["doi"]), 
                                       data["author"].split(",")[0], r"\textcolor{MarkerColour!80!black}{\scriptsize\faLink}")
            except:
                print("Couldn't add this")
                continue 
        elif name == "Posters":
            entry = base_format.format(data["title"], data["location"], data["date"])
        else:
            raise Exception
                
        latex_entries[name].append((data["year"] + data["month"], entry) )


for entry in sorted(latex_entries["first_author"], key=lambda x: x[0])[::-1]:
    print(entry[1])

def add_space(number, file):
    file.write(number * "\n")

with open(out_file, mode="w") as to_write:
    to_write.write(r"\section{Research outputs}")
    add_space(2, to_write)
    
    for entry_type, entries in latex_entries.items():
        title = info_map[entry_type]["title"]
        to_write.write(r"\mysubsection{" + title + "}")
        add_space(2, to_write)
        to_write.write(r"\vspace*{0.2cm}")
        add_space(2, to_write)
        current = len(entries)
        
        for entry in sorted(entries, key=lambda x: x[0])[::-1]:
            to_write.write(r"\circled{" + f"{current}" + "}" + f"  {entry[1]}")
            add_space(2, to_write)
            to_write.write(r"\vspace*{0.3cm}")
            add_space(2, to_write)
            current -= 1
            
        to_write.write(r"\vspace*{0.2cm}")
        add_space(2, to_write)

    to_write.write(r"\end{rubric}")