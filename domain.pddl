(define (domain mining-robot)

    (:requirements :strips :equality :adl)
    
    (:predicates
        (robot-location ?area)
        (minecar-location ?minecar ?area)
        (mineral ?area)
        (depleted ?area)
        (empty ?area)
        (adjacent ?area1 ?area2)
    )
    
    (:action collect
        :parameters (?area)
        :precondition 
            (and 
                (robot-location ?area)
                (mineral ?area)
                (not (depleted ?area)))
        :effect 
            (and 
                (not (mineral ?area))
                (depleted ?area)
            )
    )
    
    (:action push 
       :parameters (?minecar ?area1 ?area2)
       :precondition 
        (and 
            (robot-location ?area1)
            (minecar-location ?minecar ?area1)
            (adjacent ?area1 ?area2)
            (empty ?area2)
            (not(empty ?area1))
        )
       :effect 
        (and
            (not(robot-location ?area1))
            (robot-location ?area2)
            (minecar-location ?minecar ?area2)
            (not (minecar-location ?minecar ?area1))
            (empty ?area1)
            (not(empty ?area2))
        )
    )
    (:action move
        :parameters (?area1 ?area2)
        :precondition 
            (and 
            (robot-location ?area1)
            (adjacent ?area1 ?area2))
        :effect 
            (and
                (not(robot-location ?area1))
                (robot-location ?area2)
            )
        )

   
 )