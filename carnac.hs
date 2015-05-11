
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
calc s = calcWords ((words s))

calcWords :: [String] -> Int
calcWords ("+":num:rest)  = (read num :: Int) + calcWords rest
calcWords ("-":num:rest)  = (- (read num :: Int)) + calcWords rest
calcWords (num:rest) = (read num :: Int) + (calcWords rest)
calcWords [] = 0

-- Filter by (== 100)
carnac n = [ x ++ " == " ++ show (calc x) 
           | x <- cn n
           , (calc x) == 100 
           ]

main = putStr $ unlines $ carnac 9