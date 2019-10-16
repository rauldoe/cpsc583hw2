(deffacts initial-state
  (ontopof nothing A)
  (ontopof A B) 
  (ontopof B C) 
  (ontopof C floor) 
  (ontopof nothing D) 
  (ontopof D E) 
  (ontopof E F) 
  (ontopof F floor)
  (goal C F)
)
  
(defrule move-directly
  ?goal <- (goal ?block1 ?block2&~floor)
  (ontopof nothing ?block1)
  ?stack1 <- (ontopof ?block1 ?block3)
  ?stack2 <- (ontopof nothing ?block2)
=>
  (retract ?goal ?stack1 ?stack2)
  (assert (ontopof ?block1 ?block2))
  (assert (ontopof nothing ?block3))
  (printout t ?block1 " moved on top of " ?block2 crlf)
)

(defrule move-to-floor
  ?goal <- (goal ?block1 floor)
  (ontopof nothing ?block1)
  ?stack1 <- (ontopof ?block1 ?block3)
=>
  (retract ?goal ?stack1)
  (assert (ontopof ?block1 floor))
  (assert (ontopof nothing ?block3))
  (printout t ?block1 " moved to floor" crlf)
)

(defrule move-to-floor-subgoal
  (goal ?block floor)
  (ontopof ?blockontop&~nothing ?block)
=>
  (assert (goal ?blockontop floor))
)
  
(defrule clear-stack-1
  (goal ?block ?)
  (ontopof ?blockontop&~nothing ?block)
=>
  (assert (goal ?blockontop floor))
)
  
(defrule clear-stack-2
  (goal ? ?block&~floor)
  (ontopof ?blockontop&~nothing ?block)
=>
  (assert (goal ?blockontop floor))
)
