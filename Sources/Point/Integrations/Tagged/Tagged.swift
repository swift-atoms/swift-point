#if Tagged
    @_exported public import Tagged

    extension Tagged where Tag: ~Copyable & ~Escapable {
        @inlinable
        public init<Scalar>(x: Scalar)
        where Underlying == Point<1, Scalar> {
            self.init(_unchecked: Point(x: x))
        }

        @inlinable
        public init<Scalar>(x: Scalar, y: Scalar)
        where Underlying == Point<2, Scalar> {
            self.init(_unchecked: Point(x: x, y: y))
        }

        @inlinable
        public init<Scalar>(x: Scalar, y: Scalar, z: Scalar)
        where Underlying == Point<3, Scalar> {
            self.init(_unchecked: Point(x: x, y: y, z: z))
        }
    }
#endif
