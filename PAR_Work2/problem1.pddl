;; Problem file for the Robot Waiter - Problem 1
;; Planning and Approximate Reasoning - Exercise 2
;; Authors: Biel Altés and Zoë Finelli

(define (problem robot-waiter-problem1)
  
  (:domain robot-waiter)
  
  (:objects 
    ;; Locations in the restaurant
    K HALL DR1 DR2 DR3 DR4 DR5 - location
    
    ;; The waiter
    waiter - robot
    
    ;; Food items available for delivery
    dish1 - dish
    
    ;; Customer tables to be served
    table1 - table
  )
  
  (:init
    
    ;; Hall (HALL) connections
    (adjacent HALL DR2)
    (adjacent HALL DR5)

    ;; Kitchen (K) connections
    (adjacent K DR1)
    
    ;; Dining Room 1 (DR1) connections
    (adjacent DR1 DR3)
    (adjacent DR1 K)
    
    ;; Dining Room 2 (DR2) connections
    (adjacent DR2 DR1)
    (adjacent DR2 HALL)
    
    ;; Dining Room 3 (DR3) connections
    (adjacent DR3 DR1)
    (adjacent DR3 DR4)
    
    ;; Dining Room 5 (DR5) connections
    (adjacent DR5 DR4)
    (adjacent DR5 HALL)
    
    ;; Initial positions of entities
    (robot-at waiter K)        ;; Robot starts at the Kitchen
    (dish-at dish1 K)          ;; Dish is ready at the Kitchen
    (table-at table1 DR4)      ;; Customer table is at Dining Room 4
    
    ;; Initial robot state
    (hands-free waiter)        ;; Robot starts with empty hands
  )
  
  ;; Goal State: Define what needs to be achieved
  ;; The objective is to serve all customer tables
  (:goal 
    (and
      (served table1)          ;; Table 1 must be served
    )
  )
)
