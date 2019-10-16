; Ken Hsu, Khoa Do

(deffacts gandhis "some members of the Gandhi family"
  (parent Rajeev Indira)
  (parent Sanjay Indira)
  (parent Rahul Rajeev)
  (parent Priyanka Rajeev)
  (parent Rahul Sonia)
  (parent Priyanka Sonia)
  (parent Varun Sanjay)
)

(defrule sibling
  (parent ?x ?y)
  (parent ?z&~?x ?y)
  (not (sibling ?z ?x))
  (not (sibling ?x ?z))
=>
  (assert (sibling ?x ?z))
  (printout t ?x " and " ?z " are siblings" crlf )
)

; Question 1a: Add one rule to family.clp to only print a list of all people who are parents (i.e., do not add/remove new facts).  
(defrule get-parent
  (parent ? ?x)

=>
  (printout t "Parent: " ?x crlf)
)

(defrule get-unique-parent
  (parent ? ?x)
  (not (unique-parent ?x))
=>
  (assert (unique-parent ?x))
  (printout t "Unique Parent: " ?x crlf)
)

; Question 1b: Add one rule to family.clp to print a list of all pairs of persons who are cousins and assert new facts of the form "(cousin Varun Rahul)". 
; 	Two persons are cousins if their parents are siblings. (You do not have to prevent duplicate pairs.) 
(defrule cousin
  (parent ?x ?y)
  (parent ?z&~?x ?a&~?y)
  (sibling ?y ?a)
  (not (cousin ?x ?z))
  (not (cousin ?z ?x))
=>
  (assert (cousin ?x ?z))
  (printout t ?x " and " ?z " are cousins" crlf )
)

