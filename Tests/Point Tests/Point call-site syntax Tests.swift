import Point
import Testing

@Suite struct `Point construction reads naturally at the call site` {
    @Test func `Named components infer one dimensional point storage`() {
        let value = Point(x: 1)
        let typed: Point<1, Int> = value

        #expect(typed.x == 1)
    }

    @Test func `Named components infer two dimensional point storage`() {
        let value = Point(x: 1, y: 2)
        let typed: Point<2, Int> = value

        #expect(typed.x == 1)
        #expect(typed.y == 2)
    }

    @Test func `Named components infer three dimensional point storage`() {
        let value = Point(x: 1, y: 2, z: 3)
        let typed: Point<3, Int> = value

        #expect(typed.x == 1)
        #expect(typed.y == 2)
        #expect(typed.z == 3)
    }

    @Test func `Context selects the scalar type without repeating generic arguments`() {
        let value: Point<3, Double> = .init(x: 1, y: 2, z: 3)

        #expect(value.x == 1.0)
        #expect(value.y == 2.0)
        #expect(value.z == 3.0)
    }

    @Test func `A fixed component list supports dimensions beyond named axes`() {
        let value = Point<8, Double>([1, 2, 3, 4, 5, 6, 7, 8])

        #expect(value[0] == 1.0)
        #expect(value[5] == 6.0)
        #expect(value[7] == 8.0)
    }

    @Test func `Repeated components do not require exposing the storage constructor`() {
        let value = Point<8, Double>(repeating: 2)

        #expect(value[0] == 2.0)
        #expect(value[7] == 2.0)
    }

    @Test func `Existing storage remains usable without changing representation`() {
        let storage = Vector<3, Double>([1, 2, 3])
        let value = Point(coordinates: storage)

        #expect(value.coordinates == storage)
        #expect(value == Point(x: 1.0, y: 2.0, z: 3.0))
    }
}

@Test func `Named point construction does not require numeric scalars`() {
    let point = Point(x: "left", y: "top")

    #expect(point.x == "left")
    #expect(point.y == "top")
}
