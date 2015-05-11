
-- Generate all combos
cn :: Int -> [String]
cn n 
   | n < 2     = ["1"]
   | otherwise = [ prefix ++ op ++ show n
                 | prefix <- cn (n - 1)
                 , op <- [" + ", " - ", ""]
                 ]


-- Simple calculator 
calc :: String -> Int
calc s = calcWords (reverse (words s))

calcWords :: [String] -> Int
calcWords (lhs:"+":rest)  = (read lhs :: Int) + calcWords rest
calcWords (lhs:"-":rest)  = (-(read lhs :: Int)) + calcWords rest
calcWords (num:[]) = (read num :: Int)

-- Filter by (== 100)
carnac n = [ x ++ " == " ++ show (calc x) 
           | x <- cn n
           , (calc x) == 100 
           ]

main = putStr $ unlines $ carnac 9
