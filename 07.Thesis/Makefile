filename=Thesis

pdf:
	pdflatex -interaction=nonstopmode ${filename}.tex
	bibtex ${filename}||true
	pdflatex -interaction=nonstopmode ${filename}.tex
	pdflatex -interaction=nonstopmode ${filename}.tex


read:
	okular ${filename}.pdf &

aread:
	acroread ${filename}.pdf &

view:
	@xdg-open ${filename}.pdf &

clean:
	rm -f ${filename}.ps || true
	rm -f ${filename}.pdf || true
	rm -f ${filename}.log || true
	rm -f ${filename}.aux || true
	rm -f ${filename}.out || true
	rm -f ${filename}.dvi || true
	rm -f ${filename}.bbl || true
	rm -f ${filename}.blg || true
	rm -f ${filename}.acn || true
	rm -f ${filename}.acr || true
	rm -f ${filename}.alg || true
	rm -f ${filename}.glg || true
	rm -f ${filename}.glo || true
	rm -f ${filename}.gls || true
	rm -f ${filename}.glsdefs || true
	rm -f ${filename}.ist || true
	rm -f ${filename}.synctex.gz || true
	rm -f ${filename}.idx || true
	rm -f ${filename}.lof || true
	rm -f ${filename}.toc || true
	find . -name *-eps-converted-to.pdf -delete || true
	find . -name *.aux -delete || true
	rm -f tex/*.backup || true
	rm -f tex/*.log || true
	rm -f *.backup || true
