public import Vector

extension Point where Scalar: FloatingPoint {

    /// The Euclidean distance to another point: the length of the componentwise difference, the
    /// same difference `Point.cartesian` gives as a displacement. It is symmetric and zero from a
    /// point to itself.
    @inlinable
    public func distance(to other: Self) -> Scalar {
        (other.coordinates - coordinates).length
    }

    /// The point a share of the way from this point to another: `self · (1 − share) + other · share`
    /// in every component, so a share of 0 gives this point and a share of 1 the other exactly, for
    /// finite components. Shares outside 0 to 1 continue along the same line.
    @inlinable
    public func interpolated(to other: Self, at share: Scalar) -> Self {
        Self(coordinates: coordinates.interpolated(to: other.coordinates, at: share))
    }
}
