all: graffle2pdf.scpt

graffle2pdf.scpt: graffle2pdf.applescript
	osacompile -o $@ $<

clean:
	rm -f graffle2pdf.scpt
