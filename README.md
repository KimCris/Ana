# GraphDot

Ana are a couple of files with modules to produce dot Format sintax from  algebraic graphs in Haskell. 

Consider the following data type from Alga Library, which is defined in the top-level module Algebra.

data Graph a = Empty 
               | Vertex a 
               | Overlay (Graph a) (Graph a) 
               | Connect(Graph a) (Graph a)  
               | Subgraph (Graph a)
 
The files in Ana, can respresent simple direct dot Format graphs without showing the name of the graph.it also can represent clusters by using the parameters Overlay, Connect and Subgraph. Where the Subgraph paramenter displays Graph with one induvidual Subgraph, and connect and overlay display multiples subgraph which can be conneceted by using the Connect or ovelyed creating one cluster with multipple cluster inside.


The files still in Constrution so fedback is much appreciated.
 



