Definitions.
D = [0-9]
L = [a-z]
LM = [a-zA-Z]
ID = [A-Za-z_$][A-Za-z0-9_$]*

Rules.
% Numeros
{D}+(_?{D})*([eE][+-]?{D}+(_?{D})*)?n?  :  {token, {number, TokenChars}}. %entero
[+-]?({D}+(_?{D})*\.({D}(_?{D})*)*|({D}(_?{D})*)*\.{D}+(_?{D})*)([eE][+-]?{D}+(_?{D})*)?    :  {token, {number, TokenChars}}. %float


% Identificadores
% {LM}({LM}|{D})*   :  {token, analyze(TokenChars)}. 
{ID}   :  {token, analyze(TokenChars)}. 

%Caracteres Especiales
[\s\t\r]+         :  {token, {space, TokenChars}}. 
[\n]+             :  {token, {breakLine, TokenChars}}.

% Comentarios
//[^\n]*            :  {token, {comment, TokenChars}}.
/\*[^\*/|^/\*]*\*/ :  {token, {comment, TokenChars}}.

% Operadores/Puntuación
\*|\+|\/|\-|=                :  {token, {operadores, TokenChars}}.
;|\.|,|\(|\)              :  {token, {puntuacion, TokenChars}}.

% Strings
(\"|\'|\`)[^\"|^\'|^\`]*(\"|\'|\`)         :  {token, {string, TokenChars}}.
.               :  {token, {mistake, TokenChars}}.

Erlang code.

analyze(TokenChars) ->
    Up = string:lowercase(TokenChars),
    IsKW = lists:member(Up, ["break","case","catch","class","const","continue","debugger","default","delete","do","else","export","extends","finally","for","function","if","import","in","instanceof","new","return","super","switch","this","throw","try","typeof","var","void","while","with","let","package","private","protected","public","static","await","true","false","null","else if"]),
    if
        IsKW -> {keyword, TokenChars};
        true -> {identifier, TokenChars}
    end.




