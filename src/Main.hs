module DotSintax
(
dotGraph
,dotSintax
,cluster
,dotOpen
,dotClose
,dotSintax
)where

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
dotGraph (Overlay n1 n2 )  =  cluster n1 ++ cluster n2						
dotGraph (Connect n1 n2 )  = cluster n1 ++ cluster n2							
dotGraph (Subgraph n1 )  = cluster n1 

cluster :: Graph Int -> String 
cluster n = "Cluster {" ++ dotGraph n ++ "\n } "

--Define Visualise 

dotOpen :: String
dotOpen = " Diagraph {\n"

dotClose :: String
dotClose = "}\n"

dotSintax :: Show a => Graph a -> String 
dotSintax n = dotOpen ++ dotGraph n ++ dotClose
               
							
						
