(define (problem mining_2x2) (:domain mining-robot)
(:objects a11 a12 a21 a22 m1)

    (:init
        (robot-location a11)

        (minecar-location m1 a12)

        (mineral a21)

        (empty a11)
        (empty a21)
        (empty a22)

        (adjacent a11 a12)
        (adjacent a12 a11)
        (adjacent a11 a21)
        (adjacent a21 a11)
        (adjacent a12 a22)
        (adjacent a22 a12)
        (adjacent a21 a22)
        (adjacent a22 a21)
    )
    (:goal 
        (and 
            (minecar-location m1 a11)
            (depleted a21)
        )
    )

)