TARGET    = Extension-report
TEXFILES  = $(wildcard tex/*.tex)

.PHONY: all view spell clean fresh figx cleanx freshx

all: $(TARGET).pdf

$(TARGET).pdf: $(TEXFILES) $(TARGET).bib
	pdflatex -interaction=nonstopmode -halt-on-error $(TARGET)
	bibtex $(TARGET)
	pdflatex -interaction=nonstopmode -halt-on-error $(TARGET)
	pdflatex -interaction=nonstopmode -halt-on-error $(TARGET)

view: $(TARGET).pdf
	open $(TARGET).pdf

spell:
	ispell *.tex

clean:
	rm -fv *.dvi *.aux *.log *~ *.bbl *.blg *.toc *.ps *.pdf *.ent || true
	rm *.synctex.gz || true
	find . -name "*eps-converted-to.pdf" -delete || true

fresh: clean all

# Create the gnuplot generated figures

PLOTFILES = $(wildcard plot/*.plot)
FIGURESX = $(patsubst plot/%.plot, figx/%.tex, $(PLOTFILES))

figx: $(FIGURESX)

figx/%.tex: plot/%.plot
	gnuplot $^

allx: figx all

cleanx:
	rm -fv figx/*.tex figx/*.pdf

freshx: clean cleanx figx all

