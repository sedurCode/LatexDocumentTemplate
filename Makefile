PDFLATEX = pdflatex -interaction=batchmode -synctex=1 -file-line-error #
PDFLATEX_VERBOSE = pdflatex -synctex=1 -file-line-error #-interaction=batchmode 
SH 		 = /bin/bash
ASCRIPT  = /usr/bin/osascript

SOURCE   = document.tex
BASE     = "$(basename $(SOURCE))"

default : pdf

all : clean pdf

.PHONY: pdf graphics
pdf: $(SOURCE)
	# run pdflatex and bibtex multiple times to get references right
	@echo "Starting first build"
	$(PDFLATEX_VERBOSE) $(BASE)
	# @echo "Starting bibtex"
	# bibtex $(BASE) 
	# @echo "Starting second build"
	# $(PDFLATEX) $(BASE)
	# @echo "Starting third build"
	# $(PDFLATEX) $(BASE)

# .PHONY: view
# view: 
# 	# reload the document in Skim
# 	$(SH) skim-view.sh $(BASE)

.PHONY: clean
clean :
	# remove all TeX-generated files in your local directory
	$(RM) -f -- *.aux *.bak *.bbl *.blg *.log *.out *.toc *.tdo _region.* $(BASE).pdf *.acn *.brf *.glo *.ist *.lof *.lot *.synctex.gz
	find ./ -name "*.aux" -delete

# PDFLATEX = pdflatex -interaction=batchmode -synctex=1
# DIFFTOOL = latexdiff
# SH 		 = /bin/bash
# ASCRIPT  = /usr/bin/osascript

# SOURCE   = file.tex
# BASE     = "$(basename $(SOURCE))"

# default : file.pdf diff.pdf view 

# # .PHONY: file.pdf pdf graphics
# # pdf: $(SOURCE)
# # 	# run pdflatex and bibtex multiple times to get references right
# # 	$(PDFLATEX) $(BASE) && bibtex $(BASE) && $(PDFLATEX) $(BASE) && $(PDFLATEX) $(BASE)

# file.pdf: file.tex
# 	$(PDFLATEX) file && bibtex file && $(PDFLATEX) file && $(PDFLATEX) file

# diff.pdf: diff.tex
# 	$(PDFLATEX) diff && bibtex diff && $(PDFLATEX) diff && $(PDFLATEX) diff

# diff.tex: oldfile.tex file.tex
# 	$(DIFFTOOL) oldfile.tex file.tex > diff.tex

# .PHONY: view
# view: 
# 	# reload the document in Skim
# 	$(SH) skim-view.sh file

# .PHONY: clean
# clean :
# 	# remove all TeX-generated files in your local directory
# 	$(RM) -f -- *.aux *.bak *.bbl *.blg *.log *.out *.toc *.tdo _region.* *.pdf *.synctex.gz