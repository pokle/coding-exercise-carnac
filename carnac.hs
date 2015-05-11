
digits = [1..9]
combine a b = a * 10 + b
ops = [((+),"+")
      , ((-),"-")
      , (combine,"")
      ]

--- Misinterpretation

carnac 1 = [ (show digit, digit) | digit <- digits ]

carnac n =
    [ (instructions ++ opname ++ show digit, op accumulator digit) 
    | (instructions, accumulator) <- carnac (n - 1)
    , (op, opname) <- ops
    , digit <- digits
    ]

carnac_goal digits goal = 
    [ instructions 
    | (instructions, accumulator) <- carnac digits
    , goal == accumulator ]


---

cn :: Int -> [String]
cn 1 = ["1"]
--cn 2 = [("1+2", 3), ("1-2", -1), ("12", 12)]
--cn 3 = [("1+2+3", 6), ("1+2-3", 0),  ("1+23", 24),
--        ("1-2+3", 2), ("1-2-3", -4), ("1-23", -22),
--        ("12+3", 15), ("12-3", 9),   ("123", 123)]
cn n = [ prefix ++ op ++ show n
       | prefix <- cn (n - 1)
       , op <- ["+", "-", ""]
       ]


main = putStr $ unlines $ carnac_goal 2 100