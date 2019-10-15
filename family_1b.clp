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
=>
  (assert (sibling ?x ?z))
)

(defrule buildRelationship
  (parent ?x ?y)
  (sibling ?z ?y)
=>
  (assert (buildRelationship ?x ?z))
)

(defrule cousin
  (buildRelationship ?x ?y)
  (parent ?z ?y)
=>
  (printout t ?x " and " ?z " are cousins" crlf )
  (assert (cousin ?x ?z))
)

; Rahul and Varun are cousins
; Priyanka and Varun are cousins
; Varun and Priyanka are cousins
; Varun and Rahul are cousins

; grand    > parent > kid
; ==========================
; Varun    > Sanjay > Indira
; Rahul    > Rajeev > Indira
; Priyanka > Rajeev > Indira












