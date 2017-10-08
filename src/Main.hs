module DotSintax
(
dotGraph
,dotSintax
,cluster
,dotOpen
,dotClose
,dotSintax
)where

{- The 'Graph' datatype is a deep embedding of the core graph construction
primitives 'empty', 'vertex', 'overlay' and 'connect'. We define a 'Num'
instance as a convenient notation for working with graphs:
    > 0           == Vertex 0
    > 1 + 2       == Overlay (Vertex 1) (Vertex 2)
    > 1 * 2       == Connect (Vertex 1) (Vertex 2)
    > 1 + 2 * 3   == Overlay (Vertex 1) (Connect (Vertex 2) (Vertex 3))
    > 1 * (2 + 3) == Connect (Vertex 1) Subgraph ((Overlay (Vertex 2) (Vertex 3)))
    
   
    * 'overlay' has 'empty' as the identity and is idempotent:
        >   x + empty == x
        >   empty + x == x
        >       x + x == x
 
 -}

import qualified Data.Graph as Gr
import  Data.Char
import Control.Applicative


data Graph a = Empty
              | Vertex a
              | Overlay (Graph a) (Graph a)
              | Connect (Graph a) (Graph a)
              | Subgraph (Graph a)
               deriving (Show, Read, Eq)
	       
	       
	             
-- Num istances for the Graph a 

instance Num a => Num (Graph a) where
    fromInteger = Vertex . fromInteger
    (+)         = Overlay
    (*)         = Connect
    signum      = const Empty
    abs         = undefined
    negate      = Subgraph
               
-- Approach to see Graph data in dot Sintax   

dotGraph ::Graph Int -> String
dotGraph (Empty)     =  " \n " 													
dotGraph (Vertex x)  = show x 
dotGraph (Overlay n1 n2 )  =  dotOpen ++ simpleGraph n1 ++ simpleGraph n2 ++ dotClose						
dotGraph (Connect n1 n2 )  = dotOpen ++ simpleGraph n1 ++ simpleGraph n2 ++ simpleConnect n1 ++ "->" ++ simpleGraph n2 ++ dotClose						
dotGraph (Subgraph n1 )  = cluster n1 

simpleGraph :: Graph Int -> String 
simpleGraph n =  dotGraph n ++ ";\n "

simpleConnect :: Graph Int -> String 
simpleConnect n =  dotGraph n 

cluster :: Graph Int -> String 
cluster n = "Cluster {" ++ dotGraph n ++ "\n } "

cluster :: Graph Int -> String 
cluster n = "Cluster {" ++ dotGraph n ++ "\n } "

--Define Visualise 

dotOpen :: String
dotOpen = " Diagraph {\n"

dotClose :: String
dotClose = "}\n"

dotSintax :: Show a => Graph a -> String 
dotSintax n = dotOpen ++ dotGraph n ++ dotClose
               
							
						
