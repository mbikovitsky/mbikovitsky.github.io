#charset "utf-8"

#include <adv3.h>
#include <en_us.h>

versionInfo: GameID
    IFID = '07e3c8be-f7e7-49fc-b009-4a9c21085ffa'
    name = 'Demonstration'
    byline = 'by The Almighty Random'
    htmlByline = byline
    version = '1'
    headline = 'An Interactive Fiction'
;

gameMain: GameMainDef
    /* the initial player character is 'me' */
    initialPlayerChar = me
    
    showIntro()
    {
        "Welcome to the house of horrors!\b";
    }
    
    showGoodbye()
    {
        "<.p>Thanks for playing!\b";
    }
;

greatHall: Room 'Great Hall'
;

+ table: Surface, Fixture 'table' 'table'
    desc {
        if (self.contents.length == 0) {
            "It's a table, Jim.";
        }
    }
    isListed = true
    initDesc = "Dammit, Jim! I'm a parser, not a descriptionist!"
    examined = nil
    isInInitState = (!examined)
    contentsListed = true
    contentsListedInExamine {
        if (!examined) {
            examined = true;
            return nil;
        }
        return true;
    }
;

++ book: Readable 'old book' 'old book'
    "An old book. Filled by arcane knowledge, by the looks of it."
    readDesc {
        "You flip through the book, trying to find anything of interest.\n";
        "On page 1337, you find the following statements:\n";
        "1) 2 + 2 = <<2 + 2>>.\n";
        "2) 10 % 3 = <<10 % 3>>.\n";
        "3) INT_MAX = <<intMax()>>.\n";
        "4) INT_MIN = <<~intMax()>>.\n";
    }
;

intMax() {
    local num = 1;
    while (num >= 0) {
        num = num << 1;
    }
    return ~num;
}

+ me: Actor
    desc = "As good-looking as ever."
;


