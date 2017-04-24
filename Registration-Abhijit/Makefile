filename=Registration-report

pdf: 
	pdflatex ${filename}.tex
	bibtex ${filename}||true
	pdflatex ${filename}.tex
	pdflatex ${filename}.tex


read:
	okular ${filename}.pdf &

aread:
	acroread ${filename}.pdf &

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
	rm -f */*-eps-converted-to.pdf
	rm -f img/*/*-eps-converted-to.pdf
	rm -f img/dec/*-eps-converted-to.pdf
	rm -f img/inc/*-eps-converted-to.pdf
	rm -f graphs/*-eps-converted-to.pdf
	rm -f tex/*.backup
	rm -f *.backup
