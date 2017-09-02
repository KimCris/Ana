# GraphDot

GraphDot are a couple of files with modules to produce dot Format sintax from  algebraic graphs in Haskell. 

Two files can be found on the main 
File one uses datas from alga library ,which discribe algebraic graphs by using the following data type

data Graph t a = Empty 
               | Vertex a 
               | Overlay (Graph a) (Graph a) 
               | Connect String String (Graph t a) (Graph t a)  
               | Subgraph String (Graph t a)
               
it was added one more argument for the Graph data and also paramenter  called Subgraph.the Graphdot uses two functions, one to display the Graph data as a string, and other to display it in the dotFormat Sintax. 

File two receive any graph discription in form of a list and display it in a dot format sintax.
