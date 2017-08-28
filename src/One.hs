module One where

import qualified Data.Char         as  Dt
import qualified Data.Graph		   as  Gr
import qualified Control.Monad     as  Cm


data Graph t a = Empty
               | Vertex a
               | Overlay String (Graph t a) (Graph t a)
               | Connect String String (Graph t a) (Graph t a)
               | Subgraph String (Graph t a)
               deriving (Show, Read, Eq)



-- Visualisation of Graph as strings 


visualise :: Graph String Int -> String
visualise Empty         		= "\n"
visualise (Vertex i)    		= show i
visualise (Overlay n1 x y) 		= n1 ++ "[(" ++ visualise x ++ ")" ++ "," ++  "(" ++ visualise y ++ ")]"
visualise (Connect n1 n2 x y) 	= visualiseAsCluster n1 x ++ visualiseAsCluster n2 y ++ n1 ++ " -> " ++ n2 ++ "\n"
visualise (Subgraph n x)  		= visualiseAsCluster n x
visualiseAsCluster :: String -> Graph String Int -> String
visualiseAsCluster n g = "cluster " ++ n ++ " {\n" ++ visualise g ++ "}\n"


-- element to display the graph as a list  
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
    
    
    
      
-- Dot format, get list from previous sections and display as a dot format  
 
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

