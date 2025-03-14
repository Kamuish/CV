# \langen{
# \cventry{Mar - Jul 23}{Co-supervisor}{Research Initiation Fellowship (BII) of  Diogo Marques (ref CIAAUP-03/2023-BII)}{ Development of a tool for the normalization of stellar spectra: application to ESPRESSO data}{CAUP}{}
# }

# \langpt{
# \cventry{Mar - Jul 23}{Co-supervisor}{Bolsa de Iniciação para a Investigação (BII) do  Diogo Marques (ref CIAAUP-03/2023-BII)}{ Development of a tool for the normalization of stellar spectra: application to ESPRESSO data}{CAUP}{}
# }

from typing import Iterable
from collections import defaultdict

available_categories = ["PhD", "MsC", "OTHER"]

headers = [
    ("PhD thesis", "Teses de Doutoramento"),
    ("MsC thesis", "Teses de Mestrado"),
    ("Other projects", "Outros projetos"),
]

default_types = {
    "PhD": (),
    "MsC": ("Tese de Mestrado", "MsC thesis"),
    "PEEC": (
        r"projeto \textit{extra-curricular} (PEEC)",
        r"\textit{extra-curricular} project (PEEC)",
    ),
}


import json

with open("supervision.json", "r") as to_read:
    MAPA = json.load(to_read)


def get_language(entry, field_name, lang_index):
    print("entry", entry)
    try:
        value = entry[field_name]
    except KeyError as e:
        try:
            value = default_types[field_name]
        except KeyError as f:
            if "sub-cat" in entry:
                value = default_types[entry["sub-cat"]]
            else:
                raise e from f

    if isinstance(value, (list, tuple)):
        return value[lang_index]
    else:
        return value


all_entries = defaultdict(list)
start_dates = defaultdict(list)

thesis_fmt = ["written_dates", "status", "title", "name", "location"]
other_fmt = ["written_dates", "status", "type", "title", "location"]

for entry in MAPA:
    for lang_index in range(2):
        cat = get_language(entry, "cat", lang_index)
        format = other_fmt if cat == "OTHER" else thesis_fmt
        if lang_index == 0:
            line = "\n\langpt{\n"
        else:
            line = "\n\langen{\n"
        line += "\cventry{"

        for kw in format:
            val = get_language(entry, kw, lang_index)

            if kw == "type":
                if lang_index == 0:
                    con = "de"
                else:
                    con = "of"
                val += f" {con} {entry['name']}"
            line += val + "}{"

        line += "}\n}\n"
        all_entries[cat].append(line)

        start_dates[cat].append(entry["start_date"])

from pathlib import Path

p = Path(__file__).parent.parent
with open(p / "Supervision.tex", "w") as to_write:
    to_write.write(
        """
%!TEX encoding = UTF8
%!TEX root =cv-llt.tex

\section{\langen{Supervision}\langpt{Supervisão}}
"""
    )
    for cat_index, category in enumerate(available_categories):
        head = headers[cat_index]
        line = r"\mysubsection{\langen{" + head[0] + r"}\langpt{" + head[1] + "}}\n"
        entries = all_entries.get(category, [])
        if len(entries) != 0:
            to_write.write(line)
        for entry in entries:
            to_write.write(entry)
