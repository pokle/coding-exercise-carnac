
digits = [1..9]
combine a b = a * 10 + b
ops = [((+),"+"), ((-),"-"), (combine,"")]


carnac 1 = [ (show digit, digit) | digit <- digits ]

--carnac 2 = 
--    [ (show d1 ++ opname ++ show d2, d1 `op` d2) 
--    | d1 <- digits
--    , d2 <- digits
--    , (op, opname) <- ops
--    ]


carnac n =
    [ (instructions ++ opname ++ show digit, accumulator `op` digit) 
    | (instructions, accumulator) <- carnac (n - 1)
    , (op, opname) <- ops
    , digit <- digits
    ]

carnac_goal digs goal = 
    [ (instructions,accumulator) 
    | (instructions, accumulator) <- carnac digs
    , goal == accumulator ]
