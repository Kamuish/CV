def main():
    print("Hello from newcv!")

from rendercv.api import create_a_pdf_from_a_python_dictionary, create_a_pdf_from_a_yaml_string
from rendercv.renderer import render_a_pdf_from_typst

from pathlib import Path
import yaml

curr_dir = Path(__file__).parent

# Load YAML file
with open(curr_dir / "André_M._Silva_CV.yaml", "r") as file:
    data = yaml.safe_load(file)

    str_yaml = " ".join(file.readlines())


section_map = {
    "Short bio": curr_dir / "short_bio.yaml",
    "Education": curr_dir / "Education.yaml",
    "Awards": curr_dir / "awards.yaml",
    "Employment": curr_dir / "Employment.yaml",
    "talks": curr_dir / "talks.yaml",
    "supervision": curr_dir / "Supervision.yaml",
    "pubs": curr_dir / "first_author.yaml",
    "copubs": curr_dir / "coAuthor.yaml",
    "post": curr_dir / "Posters.yaml",
    "Grants": curr_dir / "Grants.yaml",
    "org": curr_dir / "Organization.yaml",
    "ref": curr_dir / "referee.yaml",
    "out": curr_dir / "Outreach.yaml",

}

data["cv"]["sections"] = {}

for key, path in section_map.items():
    with open(path) as file:
        dd = yaml.safe_load(file)
    for subkey, entries in dd.items():
        data["cv"]["sections"][subkey] = entries


# For now this function is creating a typst file, rather than pdf
create_a_pdf_from_a_python_dictionary(data, curr_dir / "CV.typ")

render_a_pdf_from_typst(curr_dir / "CV.typ")

if __name__ == "__main__":

    main()
