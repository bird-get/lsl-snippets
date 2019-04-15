#define FONT_TEXTURE "867288f9-940e-a7cf-ac7d-5596ea7fb2c5"

string CHARS;
float charAlpha = 1.0;
vector charColor = <1,1,1>;

setChar(integer link, integer face, string char)
{
    integer charPos = llSubStringIndex(CHARS, char);
    if(~charPos){}
    else charPos == 68; // 68 = "?"
    
    llSetLinkPrimitiveParamsFast(link, [
        PRIM_TEXTURE, face, FONT_TEXTURE, <0.03125, 0.0625, 0.0>,
            <0.0390625 * (charPos % 25), -0.0703125 * (charPos / 25), 0.0>, 0.0,
        PRIM_COLOR, face, charColor, charAlpha
    ]);
}

initChars()
{
    CHARS = llBase64ToString(
        "IGFiY2RlZmdoaWprbG1ub3BxcnN0dXZ3eHl6QUJDREVGR0hJSktMTU5PUFFS" +
        "U1RVVldYWVowMTIzNDU2Nzg5Liw6OyE/IifCtGBefistKi9cfCgpW117fTw+" +
        "PUAkJSYjX8Ogw6HDosOjw6TDpcOmwqrDp8Oww6jDqcOqw6vDrMOtw67Dr8Ox" +
        "w7LDs8O0w7XDtsO4xZPCusOexaHDn8O5w7rDu8O8w73Dv8W+w4DDgcOCw4PD" +
        "hMOFw4bDh8OQw4jDicOKw4vDjMONw47Dj8ORw5LDk8OUw5XDlsOYxZLDvsWg" +
        "w5nDmsObw5zDncW4xb3CosKj4oKswqXCp8K1wqHCv8Kpwq7CscOXw7fCt8Kw" +
        "wrnCssKzwqvCu8Ks4oCm4oC54oC64oCTwrzCvcK+4oSi4oCiICAgICAgICAg" +
        "ICAgICAgICAgICAgICAgICAgIOKUjOKUrOKUkOKUj+KUs+KUk+KVlOKVpuKV" +
        "l+KVtuKUgOKVtOKVt+KVuyDilK/ilrLil4Dilrzilrbil4vil5Til5Hil5Xi" +
        "l4/ilJzilLzilKTilKPilYvilKvilaDilazilaPilbrilIHilbjilILilIPi" +
        "lZHilL/ihpHihpDihpPihpLihrrihrvimJDimJHimJLilJTilLTilJjilJfi" +
        "lLvilJvilZrilanilZ0g4pWQIOKVteKVuSDilLfilKDilYLilKjihpXihpTi" +
        "mYDimYLimqDihLninYzijJbiiKHijJvijJrimarimavimaDimaPimaXimabi" +
        "moDimoHimoLimoPimoTimoXinJTinJjimLrimLnilqDil77ilqzilq7ilog="
    );
}