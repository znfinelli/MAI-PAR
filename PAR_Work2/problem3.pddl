;; Problem file for the Robot Waiter - Problem 3 (Complex Challenge)
;; Planning and Approximate Reasoning - Exercise 2
;; Authors: Biel Altés and Zoë Finelli

(define (problem robot-waiter-problem3)
  
  (:domain robot-waiter)
  
  (:objects 
    ;; Locations in the restaurant
    K1 K2 K3                                    ;; Multiple kitchens
    HALL1 HALL2 HALL3                          ;; Multiple halls
    DR1 DR2 DR3 DR4 DR5 DR6 DR7 DR8 DR9       ;; Dining rooms 1-9
    DR10 DR11 DR12 DR13 DR14 DR15 - location   ;; Dining rooms 10-15
    
    ;; The waiters
    waiter1 waiter2 - robot
    
    ;; Food items available for delivery
    dish1 dish2 dish3 dish4 dish5 - dish
    
    ;; Customer tables to be served
    table1 table2 table3 table4 table5 - table
  )
  
  (:init
    ;; Hall 1 connections (Central hub)
    (adjacent HALL1 DR1)
    (adjacent HALL1 DR2)
    (adjacent HALL1 DR3)
    (adjacent HALL1 K1)
    (adjacent HALL1 HALL2)
    
    ;; Hall 2 connections (East wing)
    (adjacent HALL2 DR4)
    (adjacent HALL2 DR5)
    (adjacent HALL2 DR6)
    (adjacent HALL2 K2)
    (adjacent HALL2 HALL3)
    
    ;; Hall 3 connections (West wing)
    (adjacent HALL3 DR7)
    (adjacent HALL3 DR8)
    (adjacent HALL3 DR9)
    (adjacent HALL3 K3)
    
    ;; Dining room interconnections (creating loops and alternative paths)
    (adjacent DR1 DR2)
    (adjacent DR2 DR3)
    (adjacent DR3 DR4)
    (adjacent DR4 DR5)
    (adjacent DR5 DR6)
    (adjacent DR6 DR7)
    (adjacent DR7 DR8)
    (adjacent DR8 DR9)
    (adjacent DR9 DR1)  ;; Creating a circle
    
    ;; Additional dining room connections (creating shortcuts)
    (adjacent DR10 DR1)
    (adjacent DR10 DR4)
    (adjacent DR11 DR2)
    (adjacent DR11 DR5)
    (adjacent DR12 DR3)
    (adjacent DR12 DR6)
    (adjacent DR13 DR7)
    (adjacent DR13 DR10)
    (adjacent DR14 DR8)
    (adjacent DR14 DR11)
    (adjacent DR15 DR9)
    (adjacent DR15 DR12)
    
    ;; Make all connections bidirectional
    ;; Dining room connections
    (adjacent DR2 DR1)
    (adjacent DR3 DR2)
    (adjacent DR4 DR3)
    (adjacent DR5 DR4)
    (adjacent DR6 DR5)
    (adjacent DR7 DR6)
    (adjacent DR8 DR7)
    (adjacent DR9 DR8)
    (adjacent DR1 DR9)
    (adjacent DR4 DR10)
    (adjacent DR1 DR10)
    (adjacent DR5 DR11)
    (adjacent DR2 DR11)
    (adjacent DR6 DR12)
    (adjacent DR3 DR12)
    (adjacent DR10 DR13)
    (adjacent DR7 DR13)
    (adjacent DR11 DR14)
    (adjacent DR8 DR14)
    (adjacent DR12 DR15)
    (adjacent DR9 DR15)

    ;; Hall 1 bidirectional connections
    (adjacent DR1 HALL1)
    (adjacent DR2 HALL1)
    (adjacent DR3 HALL1)
    (adjacent K1 HALL1)
    (adjacent HALL2 HALL1)
    (adjacent HALL1 HALL2)

    ;; Hall 2 bidirectional connections
    (adjacent DR4 HALL2)
    (adjacent DR5 HALL2)
    (adjacent DR6 HALL2)
    (adjacent K2 HALL2)
    (adjacent HALL3 HALL2)
    (adjacent HALL2 HALL3)

    ;; Hall 3 bidirectional connections
    (adjacent DR7 HALL3)
    (adjacent DR8 HALL3)
    (adjacent DR9 HALL3)
    (adjacent K3 HALL3)
    
    ;; Initial positions of entities
    (robot-at waiter1 K1)
    (robot-at waiter2 K2)
    
    ;; Initial dish locations (scattered across kitchens)
    (dish-at dish1 K1)
    (dish-at dish2 K1)
    (dish-at dish3 K2)
    (dish-at dish4 K2)
    (dish-at dish5 K3)
    
    ;; Initial table locations (strategic placement)
    (table-at table1 DR3)
    (table-at table2 DR7)
    (table-at table3 DR11)
    (table-at table4 DR13)
    (table-at table5 DR15)
    
    ;; Initial robot states
    (hands-free waiter1)
    (hands-free waiter2)
  )
  
  ;; Goal State: Define what needs to be achieved
  ;; The objective is to serve all customer tables
  (:goal 
    (and
      ;; All tables must be served
      (served table1)
      (served table2)
      (served table3)
      (served table4)
      (served table5)
      
      ;; Final positions for waiters
      (robot-at waiter1 K1)
      (robot-at waiter2 K2)
    )
  )
)
