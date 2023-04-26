Definitions.
D = [0-9]
L = [a-z]
LM = [a-zA-Z]
ID = [A-Za-z_$][A-Za-z0-9_$]*

Rules.
% Numeros
{D}+(_?{D})*([eE][+-]?{D}+(_?{D})*)?n?  :  {token, {number, TokenChars}}. %entero
[+-]?({D}+(_?{D})*\.({D}(_?{D})*)*|({D}(_?{D})*)*\.{D}+(_?{D})*)([eE][+-]?{D}+(_?{D})*)?    :  {token, {number, TokenChars}}. %float
0[bB](_?[0-1])+n?                                   :   {token, {number, TokenChars}}. %Binario
0[oO](_?[0-7])+n?                                 :   {token, {number, TokenChars}}. %Octales
0[xX](_?[0-9a-fA-F])+n?                           :   {token, {number, TokenChars}}. %Hexadecimales 

% Identificadores
% {LM}({LM}|{D})*   :  {token, analyze(TokenChars)}. 
{ID}   :  {token, analyze(TokenChars)}. 

%Caracteres Especiales
[\s\t\r]+         :  {token, {space, TokenChars}}. 
[\n]+             :  {token, {breakLine, TokenChars}}.

% Comentarios
//[^\n]*            :  {token, {comment, TokenChars}}.
\/\*([^*]*\*+[^*/])*[^*]*\*+\/ :  {token, {comment, TokenChars}}.

% Operadores/Puntuación
\{|\(|\)|\[|\]|\.|\.\.\.|\;|\,|\<|\>|\<\=|\>\=|\=\=|\!\=|\=\=\=|\!\=\=|\+|\-|\*|\*\*|\+\+|\-\-|\<\<|\>\>|\>\>\>|\&|\||\^|\!|\~|\&\&|\|\||\?\?|\?|\:|\=|\+\=|\-\=|\*\=|\*\*\=|\<\<\=|\>\>\=|\>\>\>\=|\&\=|\|\=|\^\=|\&\&\=|\|\|\=|\?\?\=|\=\>    :  {token, {operadores, TokenChars}}. %operadores

|\%|\%\=       :  {token, {operadores, TokenChars}}. %operadores con %
\/|\/\=|\}      :  {token, {operadores, TokenChars}}. %operadores EXTRA

%Expresiones Regulares
/[^\n]*/(g|i)?      :  {token, {regex, TokenChars}}.

% Strings
\"([^\"]|(\\\"))*\"         :  {token, {string, TokenChars}}.
\'([^\']|(\\\'))*\'         :  {token, {string, TokenChars}}.
\"`([^\"`]|(\\\"`))*\"`         :  {token, {string, TokenChars}}.
.               :  {token, {mistake, TokenChars}}.

Erlang code.

analyze(TokenChars) ->

    IsKW = lists:member(TokenChars, ["abstract","arguments","await","boolean","break" ,"byte" ,"case" ,"catch","char" ,"class","const","continue","debugger","default","delete" ,"do","double" ,"else" 	,"enum" ,"eval","export" ,"extends" ,"false" ,"final","finally" ,"float" ,"for","function","goto","if","implements" ,"import","in" ,"instanceof" ,"int" ,"interface","let" ,"long","native","new","null","package" ,"private" ,"protected","public" ,"return","short" ,"static","super" ,"switch" ,"synchronized","this","throw" ,"throws" ,"transient" ,"true","try" ,"typeof","var","void","volatile","while","with","yield","Array","Date","eval","function","hasOwnProperty","Infinity","isFinite","isNaN","isPrototypeOf","length","Math","NaN","Number","Object","prototype","String","toString","undefined","valueOf","forEach","getClass","java","JavaArray","javaClass","JavaObject","JavaPackage","alert","all","anchor","anchors","area","assign","blur","button","checkbox","clearInterval","clearTimeout","clientInformation","close","closed","confirm","constructor","crypto","decodeURI","decodeURIComponent","defaultStatus","document","console","element","elements","embed","embeds","encodeURI","encodeURIComponent","escape","event","fileUpload","focus","form","forms","frame","innerHeight","innerWidth","layer","layers","link","location","mimeTypes","navigate","navigator","frames","frameRate","hidden","history","image","images","offscreenBuffering","open","opener","option","outerHeight","outerWidth","packages","pageXOffset","pageYOffset","parent","parseFloat","parseInt","password","pkcs11","plugin","prompt","propertyIsEnum","radio","reset","screenX","screenY","scroll","secure","select","self","setInterval","setTimeout","status","submit","taint","textarea","top","unescape","untaint","window","onblur","onclick","onerror","onfocus","onkeydown","onkeypress","onkeyup","onmouseover","onload","onmouseup","onmousedown","onsubmit"]),
    if
        IsKW -> {keyword, TokenChars};
        true -> {identifier, TokenChars}
    end.

%Punctuators
% \{|\(|\)|\[|\]|\.|\.\.\.|\;|\,|\<|\>|\<\=|\>\=|\=\=|\!\=|\=\=\=|\!\=\=|\+|\-|\*|\%|\*\*|\+\+|\-\-|\<\<|\>\>|\>\>\>|\&|\||\^|\!|\~|\&\&|\|\||\?\?|\?|\:|\=|\+\=|\-\=|\*\=|\%\=|\*\*\=|\<\<\=|\>\>\=|\>\>\>\=|\&\=|\|\=|\^\=|\&\&\=|\|\|\=|\?\?\=|\=\>|\/|\/\=|\} 

% Principales Keywords
% "abstract","arguments","await","boolean","break" 	,"byte" 	,"case" 	,"catch","char" ,"class" 	,"const" 	,"continue","debugger","default","delete" ,"do","double" 	,"else" 	,"enum" ,"eval","export" ,"extends" ,"false" 	,"final","finally" ,"float" ,"for","function","goto","if","implements" 	,"import","in" ,"instanceof" ,"int" ,"interface","let" ,"long" 	,"native","new","null","package" ,"private" 	,"protected","public" 	,"return" ,"short" ,"static","super" ,"switch" 	,"synchronized","this","throw" ,"throws" ,"transient" ,"true","try" 	,"typeof" 	,"var"	,"void","volatile","while","with","yield"

% Keywords de Objects, Properties, and Methods
% ,"Array","Date","eval","function","hasOwnProperty","Infinity","isFinite","isNaN","isPrototypeOf","length","Math","NaN","Number","Object","prototype","String","toString","undefined","valueOf","forEach"

% Java Reserved Words
% ,"getClass","java","JavaArray","javaClass","JavaObject","JavaPackage"

% Other Reserved Words
% ,"alert","all","anchor","anchors","area","assign","blur","button","checkbox","clearInterval","clearTimeout","clientInformation","close","closed","confirm","constructor","crypto","decodeURI","decodeURIComponent","defaultStatus","document","console","element","elements","embed"","embeds","encodeURI","encodeURIComponent","escape","event","fileUpload","focus","form","forms","frame","innerHeight","innerWidth","layer","layers","link","location","mimeTypes","navigate","navigator","frames","frameRate","hidden","history","image","images","offscreenBuffering","open","opener","option","outerHeight","outerWidth","packages","pageXOffset","pageYOffset","parent","parseFloat","parseInt","password","pkcs11","plugin","prompt","propertyIsEnum","radio","reset","screenX","screenY","scroll","secure","select","self","setInterval","setTimeout","status","submit","taint","textarea","top","unescape","untaint","window"

% HTML Event Handlers
% ,"onblur","onclick","onerror","onfocus","onkeydown","onkeypress","onkeyup","onmouseover","onload","onmouseup","onmousedown","onsubmit"