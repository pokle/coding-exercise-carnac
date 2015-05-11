
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
cn n 
   | n < 2     = ["1"]
   | otherwise = [ prefix ++ op ++ show n
                 | prefix <- cn (n - 1)
                 , op <- ["+", "-", ""]
                 ]


main = putStr $ unlines $ carnac_goal 2 100