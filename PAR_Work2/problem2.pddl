;; Problem file for the Robot Waiter - Problem 1
;; Planning and Approximate Reasoning - Exercise 2
;; Authors: Biel Altés and Zoë Finelli

(define (problem robot-waiter-problem2)
  
  (:domain robot-waiter)
  
  (:objects 
    ;; Locations in the restaurant
    K HALL DR1 DR2 DR3 DR4 DR5 DR6 DR7 DR8 DR9 DR10 - location
    
    ;; The waiter
    waiter - robot
    
    ;; Food items available for delivery
    dish1 dish2 - dish
    
    ;; Customer tables to be served
    table1 table2 - table
  )
  
  (:init
    
    ;; Hall (HALL) connections
    (adjacent HALL DR2)
    (adjacent HALL DR5)
    (adjacent HALL DR8)

    ;; Kitchen (K) connections
    (adjacent K DR1)
    (adjacent K DR6)
    
    ;; Dining Room 1 (DR1) connections
    (adjacent DR1 DR3)
    (adjacent DR1 K)
    
    ;; Dining Room 2 (DR2) connections
    (adjacent DR2 DR1)
    (adjacent DR2 HALL)
    (adjacent DR2 DR7)
    
    ;; Dining Room 3 (DR3) connections
    (adjacent DR3 DR1)
    (adjacent DR3 DR4)
    
    ;; Dining Room 4 (DR4) connections
    (adjacent DR4 DR3)
    (adjacent DR4 DR5)
    (adjacent DR4 DR9)
    
    ;; Dining Room 5 (DR5) connections
    (adjacent DR5 DR4)
    (adjacent DR5 HALL)
    
    ;; Dining Room 6 (DR6) connections
    (adjacent DR6 K)
    (adjacent DR6 DR7)
    (adjacent DR6 DR10)
    
    ;; Dining Room 7 (DR7) connections
    (adjacent DR7 DR2)
    (adjacent DR7 DR6)
    (adjacent DR7 DR8)
    
    ;; Dining Room 8 (DR8) connections
    (adjacent DR8 HALL)
    (adjacent DR8 DR7)
    (adjacent DR8 DR9)
    
    ;; Dining Room 9 (DR9) connections
    (adjacent DR9 DR4)
    (adjacent DR9 DR8)
    (adjacent DR9 DR10)
    
    ;; Dining Room 10 (DR10) connections
    (adjacent DR10 DR6)
    (adjacent DR10 DR9)
    
    ;; Initial positions of entities
    (robot-at waiter K)        ;; Robot starts at the Kitchen
    (dish-at dish1 K)          ;; First dish is ready at the Kitchen
    (dish-at dish2 K)          ;; Second dish is ready at the Kitchen
    (table-at table1 DR4)      ;; First customer table is at Dining Room 4
    (table-at table2 DR9)      ;; Second customer table is at Dining Room 9
    
    ;; Initial robot state
    (hands-free waiter)        ;; Robot starts with empty hands
  )
  
  ;; Goal State: Define what needs to be achieved
  ;; The objective is to serve all customer tables
  (:goal 
    (and
      (served table1)          ;; Table 1 must be served
      (served table2)          ;; Table 2 must be served
    )
  )
)
