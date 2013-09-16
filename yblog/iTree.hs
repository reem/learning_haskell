iTree = Node 0 (dec iTree) (inc iTree)
        where
            dec (Node x l r) = Node (x-1) (dec l) (dec r)
            inc (Node x l r) = Node (x-1) (inc l) (inc r)
