filename=Enhancement-report

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
	rm -f ${filename}.ps
	rm -f ${filename}.pdf
	rm -f ${filename}.log
	rm -f ${filename}.aux
	rm -f ${filename}.out
	rm -f ${filename}.dvi
	rm -f ${filename}.bbl
	rm -f ${filename}.blg
	rm -f ${filename}.acn
	rm -f ${filename}.acr
	rm -f ${filename}.alg
	rm -f ${filename}.glg
	rm -f ${filename}.glo
	rm -f ${filename}.gls
	rm -f ${filename}.glsdefs
	rm -f ${filename}.ist
	rm -f ${filename}.synctex.gz
	find -name *-eps-converted-to.pdf | xargs rm
	rm -f tex/*.backup
	rm -f *.backup
