@_exported public import Vector

public struct Point<let N: Int, Scalar> {
    public let coordinates: Vector<N, Scalar>

    public init(coordinates: Vector<N, Scalar>) { self.coordinates = coordinates }
    public subscript(index: Int) -> Scalar { coordinates[index] }
}

extension Point: Equatable where Scalar: Equatable {}
extension Point: Hashable where Scalar: Hashable {}
extension Point: Sendable where Scalar: Sendable {}
