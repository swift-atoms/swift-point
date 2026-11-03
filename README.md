# swift-point

Use this package when a fixed-dimension tuple of scalars means a position: a place you can measure from and move to, but never add to another place. Start from `Point<N, Scalar>`. Use swift-vector's `Vector<N, Scalar>` for a tuple with componentwise arithmetic and no positional meaning, swift-displacement's `Displacement<N, Scalar>` for the difference between two points, and swift-coordinate's `Coordinate<N, Scalar>` for a position read relative to an origin. To keep points from different spaces apart (screen and world), wrap them in `Tagged`; with the `Affine` trait, `Point<N, Scalar>.cartesian` relates points to displacements.

## Laws

- A `Point<N, Scalar>` carries no frame or domain of its own: two points with equal components are equal and hash alike whatever space they were meant for. Domain identity comes only from a `Tagged` wrapper.
- `Point<N, Scalar>.cartesian` is componentwise: the displacement from a start to an end is end minus start in every component, translating adds the displacement in every component, and translating a start by its displacement to an end reaches that end.
- `coordinateSystem(using:)` makes the receiving point the origin: the coordinates of a point are the given affine's displacement from the origin to it, the point at given coordinates is the origin translated by them, and the origin itself sits at the zero coordinate. A failure of the affine relation passes through unchanged.
