import 'package:intl/intl.dart';

import 'package:assignment/core/utils/common_import.dart';

import 'package:assignment/core/widgets/cta_button.dart';
import 'package:assignment/core/widgets/stack_icon_btn.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../domain/entities/plan_selection_entity.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ValueNotifier<int> stackNumber = ValueNotifier<int>(0);
  ValueNotifier<int> creditAmount = ValueNotifier<int>(0);
  ValueNotifier<int> selectedPlan = ValueNotifier<int>(0);

  ValueNotifier<Map<String, int>> selectionPeriod =
      ValueNotifier<Map<String, int>>({"duration": 0, "amount": 0});
  ValueNotifier<Map<String, dynamic>> selectionAccount =
      ValueNotifier<Map<String, dynamic>>({"bankName": "", "accountNumber": 0});

  //it can be change or modify based on the previous page value or same page API hit
  int totalAmount = 487891;
  String userName = "nikunj";

  List<PlanSelectionEntity> listOfPlanSelectionEntity = [
    const PlanSelectionEntity(amount: 4247, month: 12, isRecommened: false),
    const PlanSelectionEntity(amount: 5580, month: 9, isRecommened: true),
    const PlanSelectionEntity(amount: 8245, month: 6, isRecommened: false),
  ];

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Stack(
          children: [
            Column(children: [
              AppSizedBox.h20,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    stackIconButton(
                        callBackFunction: () {},
                        icon: const Icon(
                          Icons.close,
                        ),
                        iconColor: AppColors.whiteColor,
                        filledColor: AppColors.stackBackgroundColor),
                    stackIconButton(
                        callBackFunction: () {},
                        icon: const Icon(
                          Icons.question_mark,
                        ),
                        iconColor: AppColors.whiteColor,
                        filledColor: AppColors.stackBackgroundColor)
                  ],
                ),
              )
            ]),
            Positioned(bottom: 50, child: assembleWidget()),
            Positioned(
              bottom: 0,
              child: Container(
                height: 50,
                width: screenWidth,
                color: AppColors.whiteColor,
              ),
            ),
            Positioned(
              bottom: 0,
              child: CTAButton(
                callbackFunction: () {
                  stackNumber.value = 1;
                },
                buttonText: ConstString.kAmountSelectionButton,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget assembleWidget() {
    return ValueListenableBuilder(
        valueListenable: stackNumber,
        builder: ((context, value, child) {
          return Column(
            children: [
              AnimatedContainer(
                height: value == 0 ? screenHeight * 0.77 : 50,
                width: screenWidth,
                alignment: Alignment.topLeft,
                duration: const Duration(seconds: 1),
                curve: Curves.easeIn,
                color: value == 0
                    ? AppColors.stackBackgroundColor
                    : value == 1
                        ? AppColors.stackBackgroundColor.withOpacity(0.9)
                        : AppColors.stackBackgroundColor.withOpacity(0.8),
                child: amountSelectionWidget(selectedStackIndex: value),
              ),
              AnimatedContainer(
                height: value == 0
                    ? 0
                    : value == 1
                        ? screenHeight * 0.77
                        : 50,
                width: screenWidth,
                alignment: Alignment.topLeft,
                duration: const Duration(seconds: 1),
                curve: Curves.easeIn,
                color: value == 1
                    ? AppColors.stackBackgroundColor
                    : AppColors.stackBackgroundColor.withOpacity(0.9),
                child: planSelectionWidget(),
              ),
            ],
          );
        }));
  }

  Widget amountSelectionWidget({required int selectedStackIndex}) {
    if (selectedStackIndex == 0) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 50),
        child: Wrap(
          children: [
            Text("$userName, ${ConstString.kAmountSelectionQuestion}"),
            AppSizedBox.h15,
            Text(
              "${ConstString.kAmountSelectionMessage} ₹${NumberFormat('#,##,##0').format(totalAmount)}",
              style: const TextStyle(height: 1.7),
            ),
            AppSizedBox.h45,
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: screenHeight * 0.35,
                width: screenWidth * 0.80,
                decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(30)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        height: 200,
                        child: SfRadialGauge(axes: <RadialAxis>[
                          RadialAxis(
                              minimum: 0,
                              maximum: 100,
                              startAngle: 270,
                              endAngle: 270,
                              showLabels: false,
                              showTicks: false,
                              radiusFactor: 0.6,
                              axisLineStyle: const AxisLineStyle(
                                  cornerStyle: CornerStyle.bothFlat,
                                  color: Colors.black12,
                                  thickness: 12),
                              pointers: <GaugePointer>[
                                const RangePointer(
                                    value: 100,
                                    cornerStyle: CornerStyle.bothFlat,
                                    width: 12,
                                    sizeUnit: GaugeSizeUnit.logicalPixel,
                                    color: Colors.orangeAccent,
                                    gradient: SweepGradient(colors: <Color>[
                                      Color(0XFFFFD180),
                                      Color(0XFFFFAB40)
                                    ], stops: <double>[
                                      0.25,
                                      0.75
                                    ])),
                                MarkerPointer(
                                    value: 10,
                                    enableDragging: true,
                                    onValueChanged: (val) {
                                      //TODO
                                    },
                                    markerHeight: 20,
                                    markerWidth: 20,
                                    markerType: MarkerType.image,
                                    imageUrl: 'assets/images/star.png',
                                    color: const Color(0XFFFFAB40),
                                    borderWidth: 2,
                                    borderColor: Colors.white54)
                              ],
                              annotations: const <GaugeAnnotation>[
                                GaugeAnnotation(
                                    angle: 90,
                                    axisValue: 5,
                                    positionFactor: 0.1,
                                    widget: Text('${10}%',
                                        style: TextStyle(
                                            fontSize: 50,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0XFFFFAB40))))
                              ])
                        ])),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 30),
                      child: Text(ConstString.kAmountSelectionAnnouncement),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
    } else {
      return GestureDetector(
        onTap: () {
          stackNumber.value = 0;
        },
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(ConstString.kCreditAmount),
                    AppSizedBox.h5,
                    Text(
                        "₹${NumberFormat('#,##,##0').format(creditAmount.value)}"),
                  ],
                ),
                const Center(
                  child: Icon(Icons.arrow_downward_sharp),
                )
              ],
            ),
          ),
        ),
      );
    }
  }

  Widget planSelectionWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 50),
      child: Wrap(
        children: [
          Text(ConstString.kPlanSelectionQuestion),
          AppSizedBox.h5,
          Text(ConstString.kPlanSelectionMessage),
          AppSizedBox.h35,
          SizedBox(
            width: screenWidth * 0.95,
            height: 250,
            child: ListView.separated(
              itemCount: listOfPlanSelectionEntity.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Stack(
                  // overflow: Overflow.visible,
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      height: 150,
                      width: 150,
                      color: Colors.amber,
                    ),
                    if (listOfPlanSelectionEntity[index].isRecommened)
                      Positioned(
                          top: -05,
                          child: Container(
                            height: 20,
                            width: 100,
                            color: Colors.white,
                            child: Text(ConstString.kRecommended),
                          )),
                  ],
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return AppSizedBox.w20;
              },
            ),
          )
        ],
      ),
    );
  }

  // Widget planSelectionWidget() {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 50),
  //     child: Wrap(
  //       children: [
  //         Text(ConstString.kPlanSelectionQuestion),
  //         AppSizedBox.h5,
  //         Text(ConstString.kPlanSelectionMessage),
  //         AppSizedBox.h35,
  //         SizedBox(
  //           width: screenWidth * 0.95,
  //           height: 250,
  //           child: ListView.separated(
  //             itemCount: listOfPlanSelectionEntity.length,
  //             scrollDirection: Axis.horizontal,
  //             itemBuilder: (context, index) {
  //               return Container(
  //                 height: 250,
  //                 width: 250,
  //                 color: Colors.amber,
  //               );
  //             },
  //             separatorBuilder: (BuildContext context, int index) {
  //               return AppSizedBox.w20;
  //             },
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }
}
