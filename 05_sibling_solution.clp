(deffacts gandhis "some members of the Gandhi family"
  (parent Rajeev Indira)
  (parent Sanjay Indira)
  (parent Rahul Rajeev)
  (parent Priyanka Rajeev)
  (parent Rahul Sonia)
  (parent Priyanka Sonia)
)

(defrule sibling-simple
  (parent ?x ?y)
  (parent ?z ?y)
=>
  (printout t ?x " and " ?z " are siblings" crlf)
  (assert (sibling ?z ?x))
)

