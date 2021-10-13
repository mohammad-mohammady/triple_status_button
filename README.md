# triple_status_button

Triple Status Button.
Flutter Triple Status Button can use toggle button but in three statuses.


<img src="https://user-images.githubusercontent.com/32927238/111130699-cead5300-8577-11eb-8759-7b07b2c4d28c.gif" width="32%">

| Property | Description |
| --- | --- |
| `height` | height of widget, height of widget. the width will be height * 2. it's required. |
| `leftIcon` | leftIcon will show left of widget |
| `rightIcon` | rightIcon will show right of widget |
| `hasIcon` | if hasIcon=true leftWidget and rightWidget will show. default value is [true]. |
| `circleColor` | circleColor is color of circle in middle of widget. it's required.  |
| `backgroundColor` | backgroundColor is color of main (background) widget. it's required.  |
| `circleAnimState` | with circleAnimState you can get state of widget. [left,middle,right].  |



Usage
-----

```dart
TripleStatusButton(
            height: 20,
            hasIcon: false,
            backgroundColor: const Color(0xffA28DF8).withOpacity(.4),
            circleColor: Colors.white,
            circleAnimState: (state) {
              if (state == CircleAnimState.right) {
                print('right');
              } else if (state == CircleAnimState.middle) {
                print('middle');
              } else if (state == CircleAnimState.left) {
                print('left');
              }
            },
          )
```
thanks to https://dribbble.com/Volorf for nice design.
