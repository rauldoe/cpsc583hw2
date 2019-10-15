(deffacts gandhis "some members of the Gandhi family"
  (parent Rajeev Indira)
  (parent Sanjay Indira)
  (parent Rahul Rajeev)
  (parent Priyanka Rajeev)
  (parent Rahul Sonia)
  (parent Priyanka Sonia)
  (parent Varun Sanjay)
)

(defrule printallparents
	(parent ?x ?y)
=>
	(printout t ?x " " ?y " is a parent." crlf)
)

; Varun Sanjay is a parent.
; Priyanka Sonia is a parent.
; Rahul Sonia is a parent.
; Priyanka Rajeev is a parent.
; Rahul Rajeev is a parent.
; Sanjay Indira is a parent.
; Rajeev Indira is a parent.











