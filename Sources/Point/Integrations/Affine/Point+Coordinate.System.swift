#if Affine
public import Coordinate
public import Affine
public import Displacement

extension Point {

    public func coordinateSystem<DisplacementScalar, Failure: Swift.Error>(
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
