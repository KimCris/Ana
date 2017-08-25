module One where

import qualified Data.Char         as  Dt
import qualified Data.Graph		   as  Gr
import qualified Control.Monad     as  Cm



data Graph a = Empty
             | Vertex a
             | Overlay [a] [a]
             | Connect [a] [a]
             deriving (Show, Read, Eq)
             
type Vertex  = [Int]
type Edge    = (Vertex, Vertex)
type Graphs  = [Edge] 



connect :: a -> a -> (a, a)
connect x1 x2 = (x1,x2)

overlay :: a -> a -> Maybe ([a],[a])
overlay x1 x2 = Just ([x1],[x2])

showEdges :: (Ord a) => [a] -> [a]  
showEdges [] = []  
showEdges (x:xs) =  (x:xs)

showVertices :: (Ord a) => [a] -> [a]  
showVertices [] = []  
showVertices (x:xs) =   
    let smaller = showVertices [a | a <- xs, a < x]  
        bigger = showVertices [a | a <- xs, a > x]  
    in  smaller ++ [x] ++ bigger
    
    
    
    
    
    
-- Dot format 
 
graphOpen   = "digragrap " 
graphClose  = "\n}"

dotEmpty :: String -> String
dotEmpty x1 = graphOpen ++ x1 ++ " {" ++ "\n" ++ graphClose

--dotDirect :: String -> String 
--dotDirect x1 = 

nodeAtributes :: String -> String -> String
nodeAtributes x1 x2  = x1 ++ " [" ++ x2 ++ "]"

dotEdge :: String -> String -> String
dotEdge x1 x2 = x1 ++ "->" ++ x2



















--main = interact dotNode 

--dotEdges ::[(a,b)] -> string
--dotEdges []  =  []
--dotEdges (xs) =  "alo" ++ (x,y)
--			  where y = head xs


-- later 




{--
visualise :: Graph String -> String
visualise Empty         = empty 
--}