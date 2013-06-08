// cypher text for initializing the data model

create (node
   {
    name    : "human",
    str     : 12,
    dex     : 12,
    end     : 10,
    int     : 8,
    cha     : 113
   }
);


// make sure you have the ending semicolon


// you can get the query back with 

start q = node(*) where q.name! = "human" return q;
