import 'package:flutter/material.dart';

class CurrencyConvertor extends StatefulWidget {
  const CurrencyConvertor({super.key});

  @override
  State<CurrencyConvertor> createState() => _CurrencyConvertorState();
}

class _CurrencyConvertorState extends State<CurrencyConvertor> {
  double result = 0;
  double presentINR = 83.97;
  final TextEditingController textEditingController = TextEditingController();
  final intKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Currency Convertor'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'INR ${result != 0 ? result.toStringAsFixed(3) : result.toStringAsFixed(0)}',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          Form(
            key: intKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: textEditingController,
                validator: (value) {
                  if (value.toString().isEmpty) {
                    return 'Please enter USD!';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.monetization_on_outlined),
                  prefixIconColor: Colors.black,
                  hintText: 'Please enter USD!',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide:
                        BorderSide(width: 20.0, style: BorderStyle.solid),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: () {
                if (intKey.currentState!.validate()) {
                  setState(() {
                    result =
                        double.parse(textEditingController.text) * presentINR;
                  });
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Please Enter USD to convert'),
                      duration: Duration(seconds: 5),
                      action: SnackBarAction(
                        label: 'Alert',
                        onPressed: () {},
                      ),
                    ),
                  );
                }
              },
              style: TextButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  minimumSize: Size(double.infinity, 50)),
              child: Text('Convert'),
            ),
          ),
        ],
      ),
    );
  }
}
