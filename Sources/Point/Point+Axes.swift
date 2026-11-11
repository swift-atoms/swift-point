import Vector

extension Point where N == 1 {
    @inlinable
    public init(x: Scalar) {
        self.init(coordinates: Vector(x: x))
    }

    @inlinable
    public var x: Scalar { coordinates.x }
}

extension Point where N == 2 {
    @inlinable
    public init(x: Scalar, y: Scalar) {
        self.init(coordinates: Vector(x: x, y: y))
    }

    @inlinable
    public var x: Scalar { coordinates.x }

    @inlinable
    public var y: Scalar { coordinates.y }
}

extension Point where N == 3 {
    @inlinable
    public init(x: Scalar, y: Scalar, z: Scalar) {
        self.init(coordinates: Vector(x: x, y: y, z: z))
    }

    @inlinable
    public var x: Scalar { coordinates.x }

    @inlinable
    public var y: Scalar { coordinates.y }

    @inlinable
    public var z: Scalar { coordinates.z }
}
