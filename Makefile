.POSIX:

tmp/ms.pdf: ms.bib ms.tex
	docker container run \
		--rm \
		--user `id -u`:`id -g` \
		--volume $(dir $(realpath Makefile)):/workspace/ \
		ghcr.io/pbizopoulos/texlive-full \
		latexmk -gg -pdf -usepretex="\pdfinfoomitdate=1\pdfsuppressptexinfo=-1\pdftrailerid{}" -outdir=tmp/ -cd /workspace/ms.tex

clean:
	rm -rf tmp/
