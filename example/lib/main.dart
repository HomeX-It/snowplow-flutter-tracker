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
    final emitter = EmitterBuilder('your-collector-endpoint-url').build();
    final tracker = TrackerBuilder(emitter, 'your-namespace', 'your-appId').build();
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
                RaisedButton(
                  onPressed: () {
                    final selfDescribingJson = SelfDescribingJsonBuilder().setSchema('iglu:com.acme/event/jsonschema/1-0-0').setPayload(<String, Object>{'message': 'hello world'}).build();
                    final selfDescribing = SelfDescribingBuilder().setEventData(selfDescribingJson).build();
                    _tracker.track(selfDescribing);
                  },
                  child: Text('Send Self Describing Event'),
                ),
                SizedBox(height: 24.0),
                RaisedButton(
                  onPressed: () {
                    final structured = StructuredBuilder().setCategory('shop').setAction('add-to-basket').setLabel('Add To Basket').setProperty('pcs').setValue(2.00).build();
                    _tracker.track(structured);
                  },
                  child: Text('Send Structured Event'),
                ),
                SizedBox(height: 24.0),
                RaisedButton(
                  onPressed: () {
                    final screenView = ScreenViewBuilder().setName('home').setType('full').setTransitionType('none').setPreviousName('').setPreviousType('').build();
                    _tracker.track(screenView);
                  },
                  child: Text('Send Screen View Event'),
                ),
                SizedBox(height: 24.0),
                RaisedButton(
                  onPressed: () {
                    final pageView = PageViewBuilder().setPageUrl('https://www.google.com/').setPageTitle('Google').build();
                    _tracker.track(pageView);
                  },
                  child: Text('Send Page View Event'),
                ),
                SizedBox(height: 24.0),
                RaisedButton(
                  onPressed: () {
                    final timing = TimingBuilder().setCategory('category').setVariable('variable').setTiming(1).setLabel('label').build();
                    _tracker.track(timing);
                  },
                  child: Text('Send Timing Event'),
                ),
                SizedBox(height: 24.0),
                RaisedButton(
                  onPressed: () {
                    final item = EcommerceTransactionItemBuilder().setItemId('item_id_1').setSku('item_sku_1').setPrice(1.00).setQuantity(1).setName('item_name').setCategory('item_category').setCurrency('currency').build();
                    final ecommerceTransaction = EcommerceTransactionBuilder().setOrderId('6a8078be').setTotalValue(300.00).setAffiliation('my_affiliate').setTaxValue(30.00).setShipping(10.00).setCity('Boston').setState('Massachusetts').setCountry('USA').setCurrency('USD').setItems([item]).build();
                    _tracker.track(ecommerceTransaction);
                  },
                  child: Text('Send Ecommerce Transaction Event'),
                ),
                SizedBox(height: 24.0),
                RaisedButton(
                  onPressed: () {
                    final consentDocuments = [ConsentDocumentBuilder().setDocumentId('doc-id1').setDocumentVersion('1').setDocumentName('doc-name1').setDocumentDescription('doc-description1').build()];
                    final consentGranted = ConsentGrantedBuilder().setExpiry('Monday, 19-Aug-05 15:52:01 UTC').setDocumentId('1234').setDocumentVersion('5').setDocumentName('Consent document').setDocumentDescription('An example description').setConsentDocuments(consentDocuments).build();
                    _tracker.track(consentGranted);
                  },
                  child: Text('Send Consent Granted Event'),
                ),
                SizedBox(height: 24.0),
                RaisedButton(
                  onPressed: () {
                    final consentDocuments = [ConsentDocumentBuilder().setDocumentId('doc-id1').setDocumentVersion('1').setDocumentName('doc-name1').setDocumentDescription('doc-description1').build()];
                    final consentGranted = ConsentWithdrawnBuilder().setAll(false).setDocumentId('1234').setDocumentVersion('5').setDocumentName('Consent document').setDocumentDescription('An example description').setConsentDocuments(consentDocuments).build();
                    _tracker.track(consentGranted);
                  },
                  child: Text('Send Consent Withdrawn Event'),
                ),
                SizedBox(height: 24.0),
                RaisedButton(
                  onPressed: () {
                    final notificationContent = NotificationContentBuilder().setTitle('You received a new message').setBody('You received a new message').setBadge(1).build();
                    final pushNotification = PushNotificationBuilder().setAction('Message Received').setDeliveryDate(DateTime.now().toString()).setTrigger('message_received').setCategoryIdentifier('1').setThreadIdentifier('1').setNotificationContent(notificationContent).build();
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
