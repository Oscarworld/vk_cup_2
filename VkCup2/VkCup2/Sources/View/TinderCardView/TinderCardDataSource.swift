protocol TinderCardDataSource: AnyObject {

    func numberOfCards() -> Int

    func card(atIndex: Int) -> TinderCardView

    func viewForEmptyCards() -> UIView?

}
