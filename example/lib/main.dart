import 'package:flutter/material.dart';
import 'package:snowplow_flutter_tracker/snowplow_flutter_tracker.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late SnowplowFlutterTracker _tracker;

  @override
  void initState() {
    final emitter = Emitter(uri: 'your-collector-endpoint-url');
    final tracker = Tracker(
      emitter: emitter,
      namespace: 'your-namespace',
      appId: 'your-appId',
      logLevel: LogLevel.verbose,
    );
    _tracker = SnowplowFlutterTracker();
    _tracker.initialize(tracker);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Snowplow Flutter Tracker Example'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 24.0),
          child: Center(
            child: Column(
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    final selfDescribingJson = SelfDescribingJson(
                      schema: 'iglu:com.acme/event/jsonschema/1-0-0',
                      payload: <String, Object>{'message': 'hello world'},
                    );
                    final selfDescribing = SelfDescribing(selfDescribingJson);
                    _tracker.track(selfDescribing);
                  },
                  child: Text('Send Self Describing Event'),
                ),
                SizedBox(height: 24.0),
                ElevatedButton(
                  onPressed: () {
                    final structured = Structured(
                      category: 'shop',
                      action: 'add-to-basket',
                      label: 'Add To Basket',
                      property: 'pcs',
                      value: 2.00,
                    );
                    _tracker.track(structured);
                  },
                  child: Text('Send Structured Event'),
                ),
                SizedBox(height: 24.0),
                ElevatedButton(
                  onPressed: () {
                    final screenView = ScreenView(
                      name: 'home',
                      type: 'full',
                      transitionType: 'none',
                      previousName: '',
                      previousType: '',
                    );
                    _tracker.track(screenView);
                  },
                  child: Text('Send Screen View Event'),
                ),
                SizedBox(height: 24.0),
                ElevatedButton(
                  onPressed: () {
                    final pageView = PageViewEvent(
                      pageUrl: 'https://www.google.com/',
                      pageTitle: 'Google',
                    );
                    _tracker.track(pageView);
                  },
                  child: Text('Send Page View Event'),
                ),
                SizedBox(height: 24.0),
                ElevatedButton(
                  onPressed: () {
                    final timing = Timing(
                      category: 'category',
                      variable: 'variable',
                      timing: 1,
                      label: 'label',
                    );
                    _tracker.track(timing);
                  },
                  child: Text('Send Timing Event'),
                ),
                SizedBox(height: 24.0),
                ElevatedButton(
                  onPressed: () {
                    final item = EcommerceTransactionItem(
                      itemId: 'item_id_1',
                      sku: 'item_sku_1',
                      price: 1.00,
                      quantity: 1,
                      name: 'item_name',
                      category: 'item_category',
                      currency: 'currency',
                    );
                    final ecommerceTransaction = EcommerceTransaction(
                      orderId: '6a8078be',
                      totalValue: 300.00,
                      affiliation: 'my_affiliate',
                      taxValue: 30.00,
                      shipping: 10.00,
                      city: 'Boston',
                      state: 'Massachusetts',
                      country: 'USA',
                      currency: 'USD',
                      items: [item],
                    );
                    _tracker.track(ecommerceTransaction);
                  },
                  child: Text('Send Ecommerce Transaction Event'),
                ),
                SizedBox(height: 24.0),
                ElevatedButton(
                  onPressed: () {
                    final consentDocuments = [
                      ConsentDocument(
                        documentId: 'doc-id1',
                        documentVersion: '1',
                        documentName: 'doc-name1',
                        documentDescription: 'doc-description1',
                      ),
                    ];
                    final consentGranted = ConsentGranted(
                      documentId: '1234',
                      documentVersion: '5',
                      expiry: 'Monday, 19-Aug-05 15:52:01 UTC',
                      documentName: 'Consent document',
                      documentDescription: 'An example description',
                      consentDocuments: consentDocuments,
                    );
                    _tracker.track(consentGranted);
                  },
                  child: Text('Send Consent Granted Event'),
                ),
                SizedBox(height: 24.0),
                ElevatedButton(
                  onPressed: () {
                    final consentDocuments = [
                      ConsentDocument(
                        documentId: 'doc-id1',
                        documentVersion: '1',
                        documentName: 'doc-name1',
                        documentDescription: 'doc-description1',
                      ),
                    ];
                    final consentGranted = ConsentWithdrawn(
                      all: false,
                      documentId: '1234',
                      documentVersion: '5',
                      documentName: 'Consent document',
                      documentDescription: 'An example description',
                      consentDocuments: consentDocuments,
                    );
                    _tracker.track(consentGranted);
                  },
                  child: Text('Send Consent Withdrawn Event'),
                ),
                SizedBox(height: 24.0),
                ElevatedButton(
                  onPressed: () {
                    final notificationContent = NotificationContent(
                      title: 'You received a new message',
                      body: 'You received a new message',
                      badge: 1,
                    );
                    final pushNotification = PushNotification(
                      action: 'Message Received',
                      deliveryDate: DateTime.now().toString(),
                      trigger: 'message_received',
                      categoryIdentifier: '1',
                      threadIdentifier: '1',
                      notificationContent: notificationContent,
                    );
                    _tracker.track(pushNotification);
                  },
                  child: Text('Send Push Notification Event'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
