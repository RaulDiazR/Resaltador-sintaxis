Definitions.
D = [0-9]
L = [a-z]
LM = [a-zA-Z]

Rules.
{D}+              :  {token, {integer, TokenChars}}. 
[+-]?({D}+\.{D}*|{D}*\.{D}+)([eE][+-]?{D}+)?              :  {token, {float, TokenChars}}. 
{LM}({LM}|{D})*   :  {token, analyze(TokenChars)}. 

[\s\t\r]+         :  {token, {space, TokenChars}}. 
[\n]+             :  {token, {breakLine, TokenChars}}.
//[^\n]*|/\*[^\n]*\*/             :  {token, {comment, TokenChars}}.
=|;|\.|,|\(|\)|\*|\+               :  {token, {normal, TokenChars}}.
(\"|\')[^\"|^\']*(\"|\')         :  {token, {string, TokenChars}}.
.               :  {token, {mistake, TokenChars}}.

Erlang code.

analyze(TokenChars) ->
    Up = string:lowercase(TokenChars),
    IsKW = lists:member(Up, ["break","case","catch","class","const","continue","debugger","default","delete","do","else","export","extends","finally","for","function","if","import","in","instanceof","new","return","super","switch","this","throw","try","typeof","var","void","while","with","yield","enum","implements","interface","let","package","private","protected","public","static","await","true","false","null"]),
    if
        IsKW -> {keyword, TokenChars};
        true -> {identifier, TokenChars}
    end.




