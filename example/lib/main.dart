import 'package:flutter/material.dart';
import 'package:snowplow_flutter_tracker/snowplow_flutter_tracker.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  SnowplowFlutterTracker _tracker;

  @override
  void initState() {
    final emitter = Emitter(uri: 'your-collector-endpoint-url');
    final tracker = Tracker(
      emitter: emitter,
      namespace: 'your-namespace',
      appId: 'your-appId',
      logLevel: LogLevel.VERBOSE,
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
                    final selfDescribingJson = SelfDescribingJsonBuilder()
                        .setSchema('iglu:com.acme/event/jsonschema/1-0-0')
                        .setPayload(
                            <String, Object>{'message': 'hello world'}).build();
                    final selfDescribing = SelfDescribingBuilder()
                        .setEventData(selfDescribingJson)
                        .build();
                    _tracker.track(selfDescribing);
                  },
                  child: Text('Send Self Describing Event'),
                ),
                SizedBox(height: 24.0),
                ElevatedButton(
                  onPressed: () {
                    final structured = StructuredBuilder()
                        .setCategory('shop')
                        .setAction('add-to-basket')
                        .setLabel('Add To Basket')
                        .setProperty('pcs')
                        .setValue(2.00)
                        .build();
                    _tracker.track(structured);
                  },
                  child: Text('Send Structured Event'),
                ),
                SizedBox(height: 24.0),
                ElevatedButton(
                  onPressed: () {
                    final screenView = ScreenViewBuilder()
                        .setName('home')
                        .setType('full')
                        .setTransitionType('none')
                        .setPreviousName('')
                        .setPreviousType('')
                        .build();
                    _tracker.track(screenView);
                  },
                  child: Text('Send Screen View Event'),
                ),
                SizedBox(height: 24.0),
                ElevatedButton(
                  onPressed: () {
                    final pageView = PageViewBuilder()
                        .setPageUrl('https://www.google.com/')
                        .setPageTitle('Google')
                        .build();
                    _tracker.track(pageView);
                  },
                  child: Text('Send Page View Event'),
                ),
                SizedBox(height: 24.0),
                ElevatedButton(
                  onPressed: () {
                    final timing = TimingBuilder()
                        .setCategory('category')
                        .setVariable('variable')
                        .setTiming(1)
                        .setLabel('label')
                        .build();
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
                    final notificationContent = NotificationContentBuilder()
                        .setTitle('You received a new message')
                        .setBody('You received a new message')
                        .setBadge(1)
                        .build();
                    final pushNotification = PushNotificationBuilder()
                        .setAction('Message Received')
                        .setDeliveryDate(DateTime.now().toString())
                        .setTrigger('message_received')
                        .setCategoryIdentifier('1')
                        .setThreadIdentifier('1')
                        .setNotificationContent(notificationContent)
                        .build();
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
