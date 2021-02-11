%{
       #include<math.h>
       #include"y.tab.h"	
%}


%%

[0-9]+|[0-9]*\.[0-9]+	{
                       		yylval.p = atof(yytext);
                       		return num;		
                       	}
				
"sin" {return SIN;}	 //we send tokens to yacc 
"cos" {return COS;}	
"tan" return TAN;		
"log" return LOG;
"sec" return SEC;
"cot" return COT;
"csc" return CSC;
"sqrt" return SQRT;
"factorial" return FACTORIAL;
"sinh" return SINH;
"cosh" return COSH;
"tanh" return TANH;
"acos" return ACOS;
"asin" return ASIN;
"atan" return ATAN;
"pow"  return POW;
"pi"   return PI;
"e"    return E;
	
[\t];
\n      return 0;
.       return yytext[0];

%%
