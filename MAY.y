%{
       #include <stdio.h>
	#include <stdlib.h>
	#include <math.h>
	
      
       
       
        void yyerror(char *);
    	int yylex(void);
	int factorial(int);
%}

%union				//to define possible symbol types
{ 
double p;
int i;
}
%token<p>num
%token SIN COS TAN LOG SQRT ASIN ACOS ATAN FACTORIAL SINH COSH TANH SEC COT CSC POW PI E

/*Defining the Precedence and Associativity*/
 %left '+''-'			//lowest precedence
%left '*''/'			//highest precedenc
%nonassoc uminu			//no associativity
%type<p>exp			//Sets the type for non - terminal
%%

/* for storing the answer */
ss: exp {printf(" Answer =%g\n",$1);}

/* for binary arithmatic operators */
exp :    exp'+'exp      { $$=$1+$3; }
       |exp'-'exp      { $$=$1-$3; }
       |exp'*'exp      { $$=$1*$3; }
       |exp'/'exp      {
                               if($3==0)
                               {
                                       printf("Divide By Zero\n");
				       exit(0);
                               }
                               else $$=$1/$3;
                       }
       |'-'exp         {$$=-$2;}
      

       |SIN'('exp')'   {$$=sin($3);}
       |SEC'('exp')'   {$$=1/cos($3);}
       |COT'('exp')'   {$$=1/tan($3);}
       |CSC'('exp')'   {$$=1/sin($3);}
       |COS'('exp')'   {$$=cos($3);}
       |TAN'('exp')'   {$$=tan($3);}
       |LOG'('exp')'   {$$=log10($3);}
       |SQRT'('exp')'  {$$=sqrt($3);}
       |ASIN'('exp')'  {$$=asin($3);}
       |ACOS'('exp')'  {$$=acos($3);}
       |ATAN'('exp')'  {$$=atan($3);}
       |SINH'('exp')'  {$$=sinh($3);}
       |COSH'('exp')'  {$$=cosh($3);}
       |TANH'('exp')'  {$$=tanh($3);}
       |POW'('exp','exp')'{$$=pow($3,$5);}
       |PI              {$$=3.14159;}
       |E               {$$=2.71828;}
       |FACTORIAL '('exp')' {
				
				if($3>0)
						
					$$=factorial($3);
				else if($3==0)
                                              $$=1;
					
				else 
				     {
 					printf("Invalid value.\n");
					exit(0);
				     }
			    
			    }//Call factorial method
       |num;
       |'('exp')'      {$$=$2;}
 	
%%

int factorial(int number)//This is factorial method 
{
int result =1;
int i = 0;
for (i = 1 ; i<=number ; i++)
{
result *= i;

}
return result;
}

/* extern FILE *yyin; */
int main()
{
       do
       {
	printf("Enter your operation:");
       		yyparse();	
       }while(1);

}

void yyerror(s)			

char *s;
{/*We print error if error occurs and system will exit*/        
       printf("ERROR\n");
       exit(0);
    

}

