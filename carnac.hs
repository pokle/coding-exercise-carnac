
cn :: Int -> [String]
cn n 
   | n < 2     = ["1"]
   | otherwise = [ prefix ++ op ++ show n
                 | prefix <- cn (n - 1)
                 , op <- [" + ", " - ", ""]
                 ]


calc :: String -> Int
calc s = calcWords (words s)

calcWords :: [String] -> Int
calcWords [] = 0
calcWords [s] = (read s :: Int)
--calcWords (lhs:"+":rhs:rest) = (read lhs :: Int) + (read rhs :: Int) + (calcWords rest)
--calcWords (lhs:"-":rhs:rest) = (read lhs :: Int) - (read rhs :: Int) + (calcWords rest)
calcWords (lhs:op:rhs:rest)
          | op == "+" = (read lhs :: Int) + (read rhs :: Int) + (calcWords rest)
          | op == "-" = (read lhs :: Int) - (read rhs :: Int) + (calcWords rest)


carnac n = [ x ++ " == " ++ show (calc x) 
           | x <- cn n
           , (calc x) == 100 
           ]

main = putStr $ unlines $ carnac 9