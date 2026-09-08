import Point
import Tagged
import Testing

private enum Screen {}
private enum World {}
private final class LocalScalar {}

@Suite struct `Points preserve representation and domain identity` {
    private func dimension<let N: Int>(_ type: Vector<N, Int>.Type) {
        let point = Point(coordinates: Vector<N, Int>(InlineArray { $0 }))
        for i in 0..<N { #expect(point[i] == i) }
        #expect(Set([point, point]).count == 1)
    }
    @Test func `Points preserve components in one two three and eight dimensions`() {
        dimension(Vector<1, Int>.self)
        dimension(Vector<2, Int>.self)
        dimension(Vector<3, Int>.self)
        dimension(Vector<8, Int>.self)
    }
    @Test func `Point domains have independent identities`() {
        let p = Point(coordinates: Vector<2, Int>([1, 2]))
        let screen = Tagged<Screen, Point<2, Int>>(_unchecked: p)
        let world = Tagged<World, Point<2, Int>>(_unchecked: p)
        #expect(screen.underlying == world.underlying)
    }
    @Test func `Point storage accepts scalars without arithmetic or sendability requirements`() {
        let value = LocalScalar()
        let point = Point(coordinates: Vector<2, LocalScalar>(repeating: value))
        #expect(point[0] === value)
    }
}
