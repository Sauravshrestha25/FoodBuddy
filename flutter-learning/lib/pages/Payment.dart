import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_0/core/store.dart';
import 'package:flutter_application_0/models/CartModel.dart';
import 'package:flutter_application_0/utils/routess.dart';

import 'package:flutter_application_0/widgets/PaymentBarWIdget.dart';
import 'package:khalti_flutter/khalti_flutter.dart';
import 'package:velocity_x/velocity_x.dart';

class payment extends StatefulWidget {
  const payment({super.key});

  @override
  State<payment> createState() => _paymentState();
}

class _paymentState extends State<payment> {
  String referenceId = "";
  bool click = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffcc00),
      body: ListView(
        children: [
          const PaymentBar(),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.all(15),
            child: Text(
              "Choose a Payment",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: const Icon(
                        CupertinoIcons.money_dollar_circle,
                        color: Color(0xffcc3e0c),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // Navigator.pushNamed(context, MyRoutes.pchangeRoute);
                      },
                      child: const Text("Cash Payment",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                        onTap: () {
                          setState(() {
                            click = !click;
                          });
                        },
                        child: Icon(
                          (click == true)
                              ? CupertinoIcons.arrow_right_arrow_left_square
                              : Icons.done,
                          color: Color(0xffcc3e0c),
                        )),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          click = !click;
                        });
                      },
                      child: const Text("Use Khalti",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: const Icon(
                        CupertinoIcons.creditcard,
                        color: Color(0xffcc3e0c),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // Navigator.pushNamed(context, MyRoutes.pchangeRoute);
                      },
                      child: const Text("Credit / Debit Card",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Placeholder(
            fallbackHeight: 110,
            color: Colors.transparent,
          ),
          const _TotalPayment(),
          Padding(
            padding: const EdgeInsets.all(10),
            child: ElevatedButton(
              onPressed: () {
                payWithKhaltiInApp();
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(200, 60),
                primary: const Color(0xffff7f50),
                onPrimary: Colors.white,
              ),
              child: const Text("Proceed to Payment"),
            ),
          ),
        ],
      ),
    );
  }

  payWithKhaltiInApp() {
    final CartModel _cart = (VxState.store as MyStore).cart;
    KhaltiScope.of(context).pay(
      config: PaymentConfig(
        amount: int.parse(_cart.totalPrice.toString()) * 100,
        //in paisa
        productIdentity: 'Product Id',
        productName: 'Product Name',
        mobileReadOnly: false,
      ),
      preferences: [
        PaymentPreference.khalti,
      ],
      onSuccess: onSuccess,
      onFailure: onFailure,
      onCancel: onCancel,
    );
  }

  void onSuccess(PaymentSuccessModel success) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Ordered Successfully',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w100, color: Colors.black),
          ),
          actions: [
            SimpleDialogOption(
                child: const Text(
                  'OK',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xffff7f50),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    referenceId = success.idx;
                  });

                  Navigator.pushNamed(context, MyRoutes.firstRoute);
                })
          ],
        );
      },
    );
  }

  void onFailure(PaymentFailureModel failure) {
    debugPrint(
      failure.toString(),
    );
  }

  void onCancel() {
    debugPrint('Cancelled');
  }
}

class _TotalPayment extends StatelessWidget {
  const _TotalPayment({super.key});

  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Sub total",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "Rs ",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xffcc3e0c),
                        ),
                      ),
                      VxBuilder(
                        mutations: {RemoveMutation},
                        builder: (context, store, status) {
                          return Text(
                            _cart.totalPrice.toString(),
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xffcc3e0c),
                            ),
                          );
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Taxes & fees",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "Rs 0",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xffcc3e0c),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Delivery fee",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "Rs 0",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xffcc3e0c),
                    ),
                  )
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Total Price",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "Rs ",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xffcc3e0c),
                        ),
                      ),
                      VxBuilder(
                        mutations: {RemoveMutation},
                        builder: (context, store, status) {
                          return Text(
                            _cart.totalPrice.toString(),
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xffcc3e0c),
                            ),
                          );
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class _TotalPayment extends StatelessWidget {
//   const _TotalPayment({super.key});

//   @override
//   Widget build(BuildContext context) {
    
//     return Padding(
//       padding: const EdgeInsets.all(10),
//       child: Container(
//         height: 200,
//         decoration: BoxDecoration(
//             color: Colors.white, borderRadius: BorderRadius.circular(20)),
//         child: const Column(
//           children: [
//             Padding(
//               padding: EdgeInsets.all(10),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Text(
//                     "Sub total",
//                     style: TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.w500,
//                       color: Colors.black,
//                     ),
//                   ),
                  
//                   Text(
//                    "Rs.1000",
//                     style: TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.w500,
//                       color: Color(0xffcc3e0c),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.all(10),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Text(
//                     "Taxes & fees",
//                     style: TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.w500,
//                       color: Colors.black,
//                     ),
//                   ),
//                   Text(
//                     "Rs 76.7",
//                     style: TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.w500,
//                       color: Color(0xffcc3e0c),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.all(10),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Text(
//                     "Delivery fee",
//                     style: TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.w500,
//                       color: Colors.black,
//                     ),
//                   ),
//                   Text(
//                     "Rs 100",
//                     style: TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.w500,
//                       color: Color(0xffcc3e0c),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//             Divider(),
//             Padding(
//               padding: EdgeInsets.all(10),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Text(
//                     "Total Price",
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.black,
//                     ),
//                   ),
//                   Text(
//                     "Rs 766.7",
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w600,
//                       color: Color(0xffcc3e0c),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
