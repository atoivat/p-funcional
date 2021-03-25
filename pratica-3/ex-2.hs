dist :: (Float, Float, Float) -> (Float, Float, Float) -> Float
dist (ax, ay, az) (bx, by, bz) = sqrt (((ax - bx)^2) + ((ay - by)^2) + ((az - bz)^2))