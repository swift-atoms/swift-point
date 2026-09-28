#if Affine
public import Affine
public import Displacement


extension Point where Scalar: AdditiveArithmetic {

    public static var cartesian: Affine<Self, Displacement<N, Scalar>, Never> {
        .componentwise(
            coordinates: { $0.coordinates },
            point: Point.init,
            components: { $0.components },
            displacement: Displacement.init,
            translating: +,
            subtracting: { start, end in end - start }
        )
    }
}
#endif
