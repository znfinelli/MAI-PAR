;; Domain file for the Robot Waiter problem
;; Planning and Approximate Reasoning - Exercise 2
;; Authors: Biel Altés and Zoë Finelli


(define (domain robot-waiter)
  
  (:requirements :strips :typing)
  
  (:types 
    location    ;; Represents physical areas (kitchen, dining rooms, hall)
    robot       ;; The waiter robot agent
    dish        ;; Food dishes to be delivered
    table       ;; Customer tables that need to be served
  )
  
  (:predicates
    ;; Map: defines which locations are directly connected
    (adjacent ?loc1 - location ?loc2 - location)
    
    ;; Location tracking: where objects are positioned
    (robot-at ?r - robot ?loc - location)
    (dish-at ?d - dish ?loc - location)
    (table-at ?t - table ?loc - location)
    
    ;; Robot state: whether the robot is carrying something or not
    (holding ?r - robot ?d - dish)
    (hands-free ?r - robot)
    
    ;; Service status: whether a table has been served
    (served ?t - table)
  )
  
  ;; Action: Move the robot from one location to an adjacent one
  ;; If holding a dish, the dish moves with the robot.
  (:action move
    :parameters (?r - robot ?from - location ?to - location)
    :precondition (and 
      (robot-at ?r ?from)
      (adjacent ?from ?to)
    )
    :effect (and 
      (robot-at ?r ?to)
      (not (robot-at ?r ?from))
    )
  )
  
  ;; Action: Pick up a dish from the current location
  ;; The robot can only pick up a dish if its hands are free and
  ;; the dish is at the same location as the robot.
  (:action pick-up
    :parameters (?r - robot ?d - dish ?loc - location)
    :precondition (and 
      (robot-at ?r ?loc)
      (dish-at ?d ?loc)
      (hands-free ?r)
    )
    :effect (and 
      (holding ?r ?d)
      (not (hands-free ?r))
      (not (dish-at ?d ?loc))
    )
  )
  
  ;; Action: Deliver/present a dish to a customer table
  ;; The robot presents the dish to a table at the same location,
  ;; marking the table as served and freeing the robot's hands.
  (:action serve
    :parameters (?r - robot ?d - dish ?t - table ?loc - location)
    :precondition (and 
      (robot-at ?r ?loc)
      (table-at ?t ?loc)
      (holding ?r ?d)
    )
    :effect (and 
      (served ?t)
      (hands-free ?r)
      (not (holding ?r ?d))
      ;; dish is implicitly consumed/delivered, no longer tracked
    )
  )
)
