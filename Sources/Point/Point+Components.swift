public import Vector

extension Point {
    /// Constructs a value from exactly N components.
    public init(_ components: consuming InlineArray<N, Scalar>) {
        self.init(coordinates: Vector(components))
    }

    public init(repeating value: Scalar) {
        self.init(coordinates: Vector(repeating: value))
    }
}
