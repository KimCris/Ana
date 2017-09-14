module DotSintax
(

dotSintax
,visualise
,visualiseCluster
,dotDirect
,dotNodes
,dotEdges
,main

)where

import qualified Data.Graph as Gr
import  Data.Char
import Control.Monad
import System.IO



data Graph t a = Empty
               | Vertex a
               | Overlay (Graph t a) (Graph t a)
               | Connect String String (Graph t a) (Graph t a)
               | Subgraph String (Graph t a)
               deriving (Show, Read, Eq)
               
-- Approach to see Graph data in dot Sintax              
               
dotSintax :: String -> String -> Graph String Int -> String
dotSintax x1 x2 (Empty)     = if x1 == "direct" 
							then "Diagraph " ++ x2 ++ " { \n } " 
							else  "graph " ++ x2 ++ " { \n } " 
							
dotSintax x1 x2 (Vertex x)  = if x1 == "direct" 
							then "Diagraph " ++ x2 ++ " {" ++ show x ++ "\n } "
							else  "graph " ++ x2 ++ " {" ++ show x ++ " \n } "  

dotSintax x1 x2 (Overlay n1 n2 )  = if x1 == "direct" 
							then "Diagraph " ++ x2 ++ " {" ++ visualise n1 ++ visualise n2 ++ "\n } "
							else  "graph " ++ x2 ++ " {" ++ visualise n1 ++ visualise n2 ++ "\n } "
							
dotSintax x1 x2 (Connect x3 x4 n1 n2 )  = if x1 == "direct" 
							then "Diagraph " ++ x2 ++ " {" ++ visualiseCluster x3 n1 ++ visualiseCluster x4 n2 ++ "\n } "
							else  "graph " ++ x2 ++ " {" ++ visualiseCluster x3 n1 ++ visualiseCluster x4 n2 ++ "\n } "
							
dotSintax x1 x2 (Subgraph x3 n1 )  = if x1 == "direct" 
							then "Diagraph " ++ x2 ++ " {" ++ visualiseCluster x3 n1 ++ "\n } "
							else  "graph " ++ x2 ++ " {" ++ visualiseCluster x3 n1 ++  "\n } "						


--Define Visualise 
visualise :: Graph String Int -> String
visualise Empty = error "nothing to visualise"
visualise (Vertex x) = show x 
 

visualiseCluster :: String  -> Graph String Int -> String 
visualiseCluster x n   = "Diagraph " ++ show x ++ " {" ++ visualise n ++ "\n } "
							
							
-- Approach for Direct Dot Files 


dotDirect  :: String -> String
dotDirect  = show 
 
dotNodes    :: String -> String
dotNodes    = show

dotEdges    ::Show a => (a,a) -> String
dotEdges  (a,b) = show a ++ "->" ++ show b

{--
main  = do 
	line <- getLine
	line1 <- getLine
	if null line 
		then return ()
		else do putStrLn $ dotDirect line ++ "{" 
	
	if null line1 
		then return ()
		else do putStrLn ( "node [" ++ dotNodes  line1 ++ "]")
		
 --}
 
main  = do 
	edges <- forM [xs] (\a -> do 
		putStrLn $ "Node [" ++ show a ++ "]"
		edge <- getLine
		return edge)
	putStrLn " the edges are"	
	mapM putStrLn edges		

