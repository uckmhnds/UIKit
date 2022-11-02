# UIControl
This layout has a view controller displaying  UIControl elements such as UIButton, UIDatePicker, UISlider, UIStepper, UISwitch. Each type of UIControl elements are put in UIStackViews

 Radiobuttons on top has UIActions such that selection of button changes enum testType, which then such enum testType changes the button configuration via configurationUpdateHandler. Buttons observe changes on testType by didSet method.
 
 ShoppingCart buttons are in the middle. UIStepper changes both numberOfItemsInTheCart and isCartEmpty variables. These variables are also observed with didSet method and UIButton in the middle changes its config via a configurationUpdateHandler method. Moreover, UISwitch on the right changes doYouHaveCoupon var which also has didSet method. Such Bool also changes config of the UIButton
 
 MusicControl buttons are on the bottom. enum State defines the state of the player, which are play, pause and stop. Config of the Play/Pause and Stop buttons are changed accordingly. Shuffle button is similar to the same button in different Apps. It changes isShuffle Bool. More importantly a UILongPressGestureRecognizer is defined for forwardButton. Therefore, Tapping and Long pressing to the button has different effects.



![](/Assets/gif1.gif)
