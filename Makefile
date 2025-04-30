file:= lex_analyzer

all:
	lex ${file}.l
	gcc lex.yy.c -o ${file} -ll

clean:
	rm -rf lex.yy.c
	rm -rf ${file}

test: all
	python3 code_generator.py > example.ac
	./${file} example.ac