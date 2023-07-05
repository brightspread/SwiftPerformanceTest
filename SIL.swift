class SuperView {
    func background() {
        print("초록")
    }
}

final class SubView: SuperView {
    override func background() {
        print("와웅")
    }
    func test() {
        print("굿")
    }
}

//class SubView: SuperView {
//    override func background() {
//        print("파랑")
//    }
//}
//
//let view1: SuperView = SuperView()
//view1.background() // 1 Dynamic - 초록
//
//let view2: SubView = SubView()
//view2.background() // 2 Dynamic - 파랑
//
//let view3: SuperView = SubView()
//view3.background() // 3 Dynamic - 파랑
