build:
	uv run python scripts/generate_publication_file.py
	uv run python construct_CV.py