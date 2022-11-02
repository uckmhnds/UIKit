# Sheet Presentation
This sheet presentation contains a UILabel and a UIButton. primaryAction of the button is to present a UIViewController via a UISheetPresentationController. The sheetPresentationContoller has 4 detents, 2 of them .medium() and .large() are defaults, other 2 of the are custom specified programmatically with respect to screen height. There is a protocol between SheetViewController and UIViewController such that clicking on UITableViewCells on the sheetPresentation changes the textLabel of UILabel in the UIStackView container. There is a UITapGestureRecognizer defined on SheetViewController. Tapping outside of the sheetView simply dismisses the SheetViewController.



![](/Assets/gif1.gif)
