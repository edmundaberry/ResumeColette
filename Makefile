LATEX_FILE = resume
TEX        = pdflatex
TMP_FOLDER = ./tex/tmp/
DOC_FOLDER = ./tex/doc/
TEX_FOLDER = ./tex/tex_files/

TEX_SUB_FILES = $(TEX_FOLDER)/*.tex

$(TMP_FOLDER)$(LATEX_FILE).pdf: $(LATEX_FILE).tex $(TEX_SUB_FILES) 
# Run tex once (hopefully that's all we need)
	$(TEX) -output-directory=$(TMP_FOLDER) $(LATEX_FILE)
# Then copy the files where you want them
	cp $(TMP_FOLDER)$(LATEX_FILE).pdf $(DOC_FOLDER)$(LATEX_FILE).pdf
	cp $(TMP_FOLDER)$(LATEX_FILE).pdf .
pdf	: $(TMP_FOLDER)$(LATEX_FILE).pdf
all	: pdf
clean	:
	rm -f $(TMP_FOLDER)*.pdf 
	rm -f $(TMP_FOLDER)*.log 
	rm -f $(TMP_FOLDER)*.aux 
	rm -f $(DOC_FOLDER)*.pdf 
	rm -f $(DOC_FOLDER)*.ps 
	rm -f $(LATEX_FILE).pdf


