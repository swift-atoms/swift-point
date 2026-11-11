public import Vector

public struct Point<let N: Int, Scalar> {
    public let coordinates: Vector<N, Scalar>

    @inlinable
    public init(coordinates: Vector<N, Scalar>) { self.coordinates = coordinates }
}

extension Point {
    @inlinable
    public subscript(index: Int) -> Scalar { coordinates[index] }
}

extension Point: Equatable where Scalar: Equatable {}
extension Point: Hashable where Scalar: Hashable {}
extension Point: Sendable where Scalar: Sendable {}

#if Affine
    public import Coordinate
    public import Affine
    public import Displacement

    extension Point {

        @inlinable
        public func coordinateSystem<DisplacementScalar, Failure: Swift::Error>(
            using affine: Affine<Self, Displacement<N, DisplacementScalar>, Failure>
        ) -> Coordinate<N, DisplacementScalar>.System<Self, Failure> {
            .init(
                coordinates: { (point) throws(Failure) in
                    Coordinate(components: try affine.displacement(from: self, to: point).components)
                },
                point: { (coordinates) throws(Failure) in
                    try affine.translated(self, by: Displacement(components: coordinates.components))
                }
            )
        }
    }
#endif

extension Point {

    @inlinable
    public init(_ components: consuming InlineArray<N, Scalar>) {
        self.init(coordinates: Vector(components))
    }

    @inlinable
    public init(repeating value: Scalar) {
        self.init(coordinates: Vector(repeating: value))
    }
}
