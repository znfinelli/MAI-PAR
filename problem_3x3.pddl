(define (problem mining_3x3) (:domain mining-robot)
(:objects a1 a2 a3 a4 a5 a6 a7 a8 a9 m1 m2 m3 m4)

    (:init
        (robot-location a4)

        (minecar-location m1 a1) (minecar-location m2 a3)(minecar-location m3 a6)(minecar-location m4 a8)
        (mineral a2)(mineral a4)(mineral a9)

        (empty a2)(empty a4)(empty a5)(empty a7)(empty a9)

        (adjacent a1 a2) (adjacent a2 a1)
        (adjacent a2 a3) (adjacent a3 a2)
        
        (adjacent a4 a5) (adjacent a5 a4)
        (adjacent a5 a6) (adjacent a6 a5)
        
        (adjacent a7 a8) (adjacent a8 a7)
        (adjacent a8 a9) (adjacent a9 a8)
        
        (adjacent a1 a4) (adjacent a4 a1)
        (adjacent a4 a7) (adjacent a7 a4)
        
        (adjacent a2 a5) (adjacent a5 a2)
        (adjacent a5 a8) (adjacent a8 a5)
        
        (adjacent a3 a6) (adjacent a6 a3)
        (adjacent a6 a9) (adjacent a9 a6)
        
        
    )
    (:goal 
        (and 
            (robot-location a3)
            (minecar-location m1 a9) (minecar-location m2 a7)(minecar-location m3 a1)(minecar-location m4 a3)
            (depleted a2) (depleted a4) (depleted a9)
        )
    )

)