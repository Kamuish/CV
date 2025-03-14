"""
Generate the publications.text file from the .bib files!!!

"""


from pathlib import Path 
import bibtexparser
from collections import defaultdict

curr = Path(__file__).parent
data_map = {
            "coAuthor": curr / "CoAuthor.bib",
            "first_author": curr / "first_author.bib",
            "Posters": curr / "posters.bib"
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
    return f"[{doi}]" + "(http://dx.doi.org/" + doi + ")"

latex_entries = defaultdict(list)

output_info = {}

for name, file in data_map.items():
    print("Starting", name)
    out = bibtexparser.parse_file(file)
    print("out")
    output_info[name] = []
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

        out = {}

        if name in ["first_author", "coAuthor"]:
            if block.entry_type == "inproceedings":
                vol = data.get("Volume", "")
                journal = f"Proc. {data['publisher']} {vol}"
            else:
                journal = data["journal"]
        
        out["title"] = data["title"]
        out["title"] = out["title"].replace("{", "").replace("}", "").replace("\\textit", "")
        journal = journal.replace("\\", "").replace("{", "").replace("}", "")

        if name != "Posters":
            doi = data["doi"]
        # out["journal"] = journal
        out["date"] = data["year"]

        if name == "first_author" :
            out["authors"] = {"André M. Silva et al"}
        elif name == "Posters":
            out["authors"] = {f"André M. Silva et al, {data['location']}"}
        elif name == "coAuthor":
            out["authors"] = {data["author"].split(",")[0] + f" et al; ({journal}, {gen_DOI(doi)})"}
            
        output_info[name].append(out)

print(data_map)

def add_space(number, file):
    file.write(number * "\n")
import yaml
curr_folder = Path(__file__).parent.parent 

for entry in sorted(latex_entries["first_author"], key=lambda x: x[0])[::-1]:
    print(entry[1])

sorted_dict = {}

for entry_type in ["first_author", "coAuthor", "Posters"]:
    entries = output_info[entry_type]
    name_map = {"first_author": "First author publications",
                "coAuthor": "Co-authored publications",
                "Posters": "Posters"
                }
    
    sorted_dict[name_map[entry_type]] = []
    print(entries)
    for entry in sorted(entries, key=lambda x: x["date"])[::-1]:
        sorted_dict[name_map[entry_type]].append(entry)

    with open(curr_folder / f"{entry_type}.yaml", "w") as to_write:
        yaml.safe_dump(sorted_dict, to_write)