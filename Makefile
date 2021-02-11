all:begin mid end
begin:MAY.l
	lex MAY.l
	yacc -d MAY.y
mid:lex.yy.c y.tab.c
	cc lex.yy.c y.tab.c -ll -ly -lm -o output.may

end:output.may
	./output.may
