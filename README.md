# coding-exercise-carnac
A crazy article got me thinking about bad coding tests - http://raganwald.com/2015/05/08/carnac-the-magnificent.html

However, I thought this might be an interesting exercise to apply some of the Haskell I've been learning!

My haskell solution first works out all the possible expressions exhaustively, and then a simple calculator parses and executes the expressions! There's no eval!

    > make
    ./carnac
    1 + 2 + 3 - 4 + 5 + 6 + 78 + 9 == 100
    1 + 2 + 34 - 5 + 67 - 8 + 9 == 100
    1 + 23 - 4 + 5 + 6 + 78 - 9 == 100
    1 + 23 - 4 + 56 + 7 + 8 + 9 == 100
    12 + 3 + 4 + 5 - 6 - 7 + 89 == 100
    12 + 3 - 4 + 5 + 67 + 8 + 9 == 100
    12 - 3 - 4 + 5 - 6 + 7 + 89 == 100
    123 + 4 - 5 + 67 - 89 == 100
    123 + 45 - 67 + 8 - 9 == 100
    123 - 4 - 5 - 6 - 7 + 8 - 9 == 100
    123 - 45 - 67 + 89 == 100

----
[My other coding exercises](https://github.com/search?q=user%3Apokle+coding-exercise)
