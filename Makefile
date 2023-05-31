all: pt en

SOURCES:	cv.tex \
			refs.bib \
			dictionary.tex

pt: $(SOURCES)
	latexmk -jobname=cv_pt -pdf -pdflatex='pdflatex %O -interaction=nonstopmode -synctex=1 "\newif\ifen\newif\ifpt\pttrue\input{%S}"' cv

en: $(SOURCES)
	latexmk -jobname=cv_en -pdf -pdflatex='pdflatex %O -interaction=nonstopmode -synctex=1 "\newif\ifen\newif\ifpt\entrue\input{%S}"' cv

clean:
	rm -f *{aux,bbl,bcf,blg,fdb_latexmk,fls,log,xml,gz,out,blg,bcf}