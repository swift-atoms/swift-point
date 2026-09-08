# Point

Point<N, Scalar> is a dimension-independent point representation backed directly
by Vector<N, Scalar>, with read-only components and conditional equality, hashing,
and sendability.

Point addition, scaling, ordering, and a universal origin are intentionally absent.
Tagged supplies independent domain identity. A point is not its displacement.

The atom depends only on Vector. Import the swift-point-affine molecule
(Point_Affine) to explicitly select Point.cartesian, lift a relationship through
a tag, or establish a coordinate system relative to a supplied point.

Point and Coordinate each store a Vector directly; neither requires nesting all
of Point, Coordinate, Displacement, and Vector.

## Construction

Importing Point also exports Vector; a separate Vector import is unnecessary.

```swift
import Point

let value = Point(x: 1, y: 2, z: 3)
let precise: Point<3, Double> = .init(x: 1, y: 2, z: 3)
let many = Point<8, Double>([1, 2, 3, 4, 5, 6, 7, 8])
let repeated = Point<8, Double>(repeating: 2)
let stored = Point(coordinates: Vector(x: 1, y: 2, z: 3))

let first = value.x
```

Named components are available in one, two, and three dimensions. Fixed component
lists must match the dimension at compile time. The existing storage initializer
remains available. These conveniences do not select a frame or change arithmetic.
