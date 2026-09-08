@_exported public import Vector

/// A point represented in N dimensions. Its domain/frame can be supplied by Tagged.
/// Storage does not grant vector arithmetic, an ordering, or a distinguished origin.
public struct Point<let N: Int, Scalar> {
    public let coordinates: Vector<N, Scalar>

    public init(coordinates: Vector<N, Scalar>) { self.coordinates = coordinates }
    public subscript(index: Int) -> Scalar { coordinates[index] }
}

extension Point: Equatable where Scalar: Equatable {}
extension Point: Hashable where Scalar: Hashable {}
extension Point: Sendable where Scalar: Sendable {}
