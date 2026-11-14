import Point
import Testing

enum `Point measure Tests` {}

extension `Point measure Tests` {
    @Suite struct `Distance is Euclidean and symmetric` {
        @Test func `Distance is the length of the componentwise difference`() {
            let start = Point<3, Double>(x: 1, y: 2, z: 3)
            let end = Point<3, Double>(x: 3, y: 5, z: 9)
            #expect(start.distance(to: end) == 7)
        }

        @Test func `Distance is symmetric and zero from a point to itself`() {
            let start = Point<2, Double>(x: -1, y: 4)
            let end = Point<2, Double>(x: 2, y: 0)
            #expect(start.distance(to: end) == end.distance(to: start))
            #expect(start.distance(to: start) == 0)
        }
    }

    @Suite struct `Interpolation runs a share of the way between two points` {
        @Test func `Interpolation at zero one and one half gives the start the end and the midpoint`() {
            let start = Point<2, Double>(x: 0.25, y: -3)
            let end = Point<2, Double>(x: 0.75, y: 5)
            #expect(start.interpolated(to: end, at: 0) == start)
            #expect(start.interpolated(to: end, at: 1) == end)
            #expect(start.interpolated(to: end, at: 0.5) == Point(x: 0.5, y: 1))
        }

        @Test func `The interpolated point divides the distance by the share`() {
            let start = Point<2, Double>(x: 0, y: 0)
            let end = Point<2, Double>(x: 6, y: 8)
            let point = start.interpolated(to: end, at: 0.25)
            #expect(start.distance(to: point) == 2.5)
            #expect(point.distance(to: end) == 7.5)
        }
    }
}
