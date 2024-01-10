`ifndef _FUNCTIONS_SVH_
`define _FUNCTIONS_SVH_

function shortint min_of_2(shortint a, b);
    return a < b ? a : b;
endfunction

function shortint min_of_4(shortint a, b, c, d);
    return min_of_2(min_of_2(a, b), min_of_2(c, d));
endfunction

function shortint max_of_2(shortint a, b);
    return a > b ? a : b;
endfunction

function shortint max_of_4(shortint a, b, c, d);
    return max_of_2(max_of_2(a, b), max_of_2(c, d));
endfunction

`endif