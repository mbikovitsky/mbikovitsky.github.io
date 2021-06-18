"EMPTY GAME main file"

<VERSION 8>
<CONSTANT RELEASEID 1>

"Main loop"

<CONSTANT GAME-BANNER
"Demonstration|
An Interactive Fiction by The Almighty Random"
>

<ROUTINE GO ()
    <INIT-STATUS-LINE>
    <CRLF> <CRLF>
    <TELL "Welcome to the house of horrors!" CR CR>
    <V-VERSION> <CRLF>
    <SETG HERE ,GREAT-HALL>
    <MOVE ,PLAYER ,HERE>
    <V-LOOK>
    <MAIN-LOOP>
>

<INSERT-FILE "parser">

"Objects"

; The main room
<OBJECT GREAT-HALL
    (IN ROOMS)
    (DESC "Great Hall")
    (FLAGS LIGHTBIT)
>

<OBJECT GREAT-HALL-TABLE
    (DESC "table")
    (SYNONYM TABLE)
    (IN GREAT-HALL)
    (FLAGS CONTBIT SURFACEBIT)
    (ACTION TABLE-R)
>

<GLOBAL TABLE-EXAMINED-ONCE <>>
<ROUTINE TABLE-R ()
    <COND (<VERB? EXAMINE>
            <COND (,TABLE-EXAMINED-ONCE
                    <COND (<FIRST? ,PRSO>
                            <DESCRIBE-CONTENTS ,PRSO>)
                          (ELSE
                            <TELL "It's a table, Jim." CR>)
                    >)
                  (ELSE
                    <TELL "Dammit, Jim! I'm a parser, not a descriptionist!" CR>
                    <SETG TABLE-EXAMINED-ONCE T>)
            >
            <RTRUE>)
    >
>

<OBJECT BOOK
    (LOC GREAT-HALL-TABLE)
    (SYNONYM BOOK)
    (ADJECTIVE OLD)
    (FLAGS TAKEBIT READBIT VOWELBIT)
    (DESC "old book")
    (ACTION BOOK-F)
>

<ROUTINE BOOK-F ()
    <COND (<VERB? READ>
            <TELL
"You flip through the book, trying to find anything of interest.|
On page 1337, you find the following statements:" CR>
            <TELL "1) 2 + 2 = " N <+ 2 2> CR>
            <TELL "2) 10 % 3 = " N <MOD 10 3> CR>
            <TELL "3) INT_MAX = " N <INT-MAX> CR>
            <TELL "4) INT_MIN = " N <BCOM <INT-MAX>> CR>
            <CRLF>)
          (<VERB? EXAMINE>
            <TELL "An old book. Filled by arcane knowledge, by the looks of it." CR>)
    >
>

<ROUTINE INT-MAX ("AUX" IDX)
    <SET IDX 1>
    <REPEAT ()
        <COND (<L? .IDX 0>
                <RETURN>)
        >
        <SET IDX <SHIFT .IDX 1>>
    >
    <RETURN <BCOM .IDX>>
>
