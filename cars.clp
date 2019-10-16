; Ken Hsu, Khoa Do

(deffacts cars "some cars: Brand Price Color"
  (car Honda 18000 Red)
  (car Toyota 18000 White)
  (car Ford 25000 Red)
  (car Acura 50000 White)
  (car BMW 60000 Red)
)

(defrule get-age
  (not (age ?))
=>
  (printout t "What is the person's age? " )
  (assert (age =(read)))  ; Read answer and add it as a fact
)

; Question 2a: Modify the rule such that the recommendation for a person younger than 25 years of  age is a car that costs less than $30,000 and red in color.
(defrule recommend-car
  (age ?a)
  (test (<= ?a 25)) ; test if age <= 25
  (car ?car ?price Red)
  (test (<= ?price 30000)) 
=>
  (printout t " Recommeding " ?car " for the Young Crowd" crlf )
)

; Question 2b: Add a new rule that recommends for a person older than 25 years a white car. 
(defrule recommend-car-for-older
  (age ?a)
  (test (> ?a 25)) ; test if age > 25
  (car ?car ? White)
=>
  (printout t " Recommeding " ?car " for the Older Generation" crlf )
)
