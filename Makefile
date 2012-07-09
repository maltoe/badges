BASE_NAME=badges
TEMPORARIES=*aux *toc *log *blg *bbl *out *lol *lot *lof parts/*aux parts/*log
ARTIFACTS=*pdf *dvi *.ps
LATEX_OPTS=-interaction=nonstopmode

all: clean compile removetemporaries

logo.eps: logo.svg
	inkscape -C -E logo.eps logo.svg

compile: logo.eps
	latex ${LATEX_OPTS} ${BASE_NAME}.tex

pdf: compile removetemporaries
	dvips ${BASE_NAME}.dvi
	ps2pdf ${BASE_NAME}.ps

clean:
	rm -f $(TEMPORARIES) $(ARTIFACTS)
	
removetemporaries:
	rm -f $(TEMPORARIES)
