#if Affine
import Affine
import Coordinate
import Displacement
import Point
import Testing

@Suite struct `Cartesian points translate and subtract componentwise` {
    @Test func `Displacement between points is the componentwise difference`() {
        let start = Point(x: 1, y: 2)
        let end = Point(x: 4, y: -3)
        let displacement = Point<2, Int>.cartesian.displacement(from: start, to: end)
        #expect(displacement == Displacement(components: Vector(x: 3, y: -5)))
    }

    @Test func `Translating by the displacement reaches the end point`() {
        let start = Point(x: 1, y: 2)
        let end = Point(x: 4, y: -3)
        let affine = Point<2, Int>.cartesian
        #expect(affine.translated(start, by: affine.displacement(from: start, to: end)) == end)
    }

    @Test func `A coordinate system centred on a point maps it to the zero coordinate`() {
        let origin = Point(x: 5, y: 5)
        let system = origin.coordinateSystem(using: Point<2, Int>.cartesian)
        #expect(system.coordinates(of: origin) == Coordinate(components: Vector(x: 0, y: 0)))
        #expect(system.point(at: Coordinate(components: Vector(x: 1, y: -1))) == Point(x: 6, y: 4))
    }
}
#endif
