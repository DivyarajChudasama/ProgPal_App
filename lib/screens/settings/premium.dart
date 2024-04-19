import 'package:flutter/material.dart';
import 'package:upi_india/upi_india.dart';

class UPI extends StatefulWidget {
  @override
  _UPIState createState() => _UPIState();
}

class _UPIState extends State<UPI> {
  Future<UpiResponse>? _transaction;
  UpiIndia _upiIndia = UpiIndia();
  List<UpiApp>? apps;

  TextStyle header = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  TextStyle value = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14,
  );

  @override
  void initState() {
    _upiIndia.getAllUpiApps(mandatoryTransactionId: true).then((value) {
      setState(() {
        apps = value;
      });
    }).catchError((e) {
      apps = [];
    });
    super.initState();
  }

  Future<void> initiateTransaction(UpiApp app) async {
    try {
      final response = await _upiIndia.startTransaction(
        app: app,
        receiverUpiId: "divyarajc073@okaxis",
        receiverName: 'ProgPal',
        transactionRefId: 'Progpal premium',
        transactionNote: 'ProgPal Premium.',
        amount: 100,
      );
      _showSnackbar("Transaction Successful. ID: ${response.transactionId}");
    } catch (e) {
      _showSnackbar("Transaction Failed: $e");
    }
  }

  Widget displayUpiApps() {
    if (apps == null)
      return Center(child: CircularProgressIndicator());
    else if (apps!.isEmpty)
      return Center(
        child: Text(
          "No apps found to handle transaction.",
          style: header,
        ),
      );
    else
      return Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Wrap(
            children: apps!.map<Widget>((UpiApp app) {
              return GestureDetector(
                onTap: () => initiateTransaction(app),
                child: Card(
                  elevation: 4,
                  margin: EdgeInsets.all(8),
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.memory(
                          app.icon,
                          height: 60,
                          width: 60,
                        ),
                        SizedBox(height: 8),
                        Text(app.name),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      );
  }

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UPI'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: displayUpiApps(),
          ),
        ],
      ),
    );
  }
}
