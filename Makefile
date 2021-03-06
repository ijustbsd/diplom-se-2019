THEME = Разработка системы управления умным конференц-залом
STUDENT = С.Д. Бабошин
DEGREE = ген. дир.
DIRECTOR = Д.Д. Бронякин

SED = "s/{{theme}}/${THEME}/; s/{{student}}/${STUDENT}/; s/{{degree}}/${DEGREE}/; s/{{director}}/${DIRECTOR}/"

all:
	# титульный лист
	sed -e ${SED} titlepage.fodt > tp-output.fodt
	libreoffice --headless --convert-to pdf tp-output.fodt

	# .tex
	pdflatex diplom.tex
	biber diplom
	pdflatex diplom.tex
	evince diplom.pdf &

clean:
	rm *.aux *.log *.out *.toc *.pdf *.bbl *.bcf *.blg *.xml
	rm tp-output.*
