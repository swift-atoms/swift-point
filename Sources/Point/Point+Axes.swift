public import Vector

// Named components are conveniences for one, two, and three dimensions.
// They do not select a coordinate frame or add an affine interpretation.

extension Point where N == 1 {
    public init(x: Scalar) {
        self.init(coordinates: Vector(x: x))
    }

    public var x: Scalar { coordinates.x }
}

extension Point where N == 2 {
    public init(x: Scalar, y: Scalar) {
        self.init(coordinates: Vector(x: x, y: y))
    }

    public var x: Scalar { coordinates.x }

    public var y: Scalar { coordinates.y }
}

extension Point where N == 3 {
    public init(x: Scalar, y: Scalar, z: Scalar) {
        self.init(coordinates: Vector(x: x, y: y, z: z))
    }

    public var x: Scalar { coordinates.x }

    public var y: Scalar { coordinates.y }

    public var z: Scalar { coordinates.z }
}
