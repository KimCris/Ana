import qualified Data.List as Dr




dotFile :: Show a => String -> String -> [(a,a)] -> String
dotFile x1 x2 []     = if x1 == "direct" then "Diagraph " ++ x2 ++ " { \n } " else  "graph " ++ x2 ++ " { \n } "
dotFile x1 x2 [(a,b)]  = if x1 == "direct" then "Diagraph " ++ x2 ++ " { " ++ show a ++ "->" ++ show b ++ "; \n } " 
					     else  "graph " ++ x2 ++ " {" ++ show a ++ "--" ++ show b ++ "; \n } "
					   