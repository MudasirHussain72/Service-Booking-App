import 'package:flutter/material.dart';

class FAQsScreen extends StatefulWidget {
  const FAQsScreen({super.key});

  @override
  State<FAQsScreen> createState() => _FAQsScreenState();
}

class _FAQsScreenState extends State<FAQsScreen> {
  bool _customTileExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('FAQs')),
      body: ListView(
        children: [
          Center(
              child: Text(
            'Plumber FAQs:',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
                fontSize: 24),
          )),
          ExpansionTile(
            title: const Text('How do I book a plumber on the app?'),
            //
            trailing: Icon(Icons.arrow_drop_down_circle),
            children: const <Widget>[
              ListTile(
                  title: Text(
                      'To book a plumber, simply open the app, go to the \'Plumber\' category, choose the specific service you need, and follow the prompts to schedule an appointment.')),
            ],
            onExpansionChanged: (bool expanded) {
              setState(() {
                _customTileExpanded = expanded;
              });
            },
          ),
          ExpansionTile(
            title: const Text(
                'What information do I need to provide when booking a plumber?'),
            //
            trailing: Icon(Icons.arrow_drop_down_circle),
            children: const <Widget>[
              ListTile(
                  title: Text(
                      'Make sure to provide accurate details about the plumbing issue, your location, and any preferences you may have. This helps us match you with the right plumber for the job.')),
            ],
            onExpansionChanged: (bool expanded) {
              setState(() {
                _customTileExpanded = expanded;
              });
            },
          ),
          ExpansionTile(
            title: const Text(
                'Can I cancel or reschedule my plumber appointment?'),
            //
            trailing: Icon(Icons.arrow_drop_down_circle),
            children: const <Widget>[
              ListTile(
                  title: Text(
                      'Yes, you can. Navigate to your booked appointments in the app, find the plumber appointment, and choose the option to reschedule or cancel based on your needs.')),
            ],
            onExpansionChanged: (bool expanded) {
              setState(() {
                _customTileExpanded = expanded;
              });
            },
          ),
          ExpansionTile(
            title:
                const Text('How can I track the arrival time of the plumber?'),
            //
            trailing: Icon(Icons.arrow_drop_down_circle),
            children: const <Widget>[
              ListTile(
                  title: Text(
                      'Once your plumber is en route, you\'ll receive real-time updates on their estimated time of arrival through the app. You can track their progress and be prepared for their arrival.')),
            ],
            onExpansionChanged: (bool expanded) {
              setState(() {
                _customTileExpanded = expanded;
              });
            },
          ),
          ExpansionTile(
            title: const Text(
                'What payment methods are accepted for plumber services?'),
            //
            trailing: Icon(Icons.arrow_drop_down_circle),
            children: const <Widget>[
              ListTile(
                  title: Text(
                      'We accept various payment methods, including credit/debit cards and digital wallets. You can securely pay for the plumber service through the app after the job is completed.')),
            ],
            onExpansionChanged: (bool expanded) {
              setState(() {
                _customTileExpanded = expanded;
              });
            },
          ),
          Center(
              child: Text(
            'Electrician FAQs:',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
                fontSize: 24),
          )),
          ExpansionTile(
            title: const Text('How do I find an electrician on the app?'),
            //
            trailing: Icon(Icons.arrow_drop_down_circle),
            children: const <Widget>[
              ListTile(
                  title: Text(
                      'To hire an electrician, go to the \'Electrician\' category, specify the type of electrical service you need, and follow the prompts to schedule an appointment with a qualified professional.')),
            ],
            onExpansionChanged: (bool expanded) {
              setState(() {
                _customTileExpanded = expanded;
              });
            },
          ),
          ExpansionTile(
            title: const Text(
                'Is it safe to share my electrical issue details on the app?'),
            //
            trailing: Icon(Icons.arrow_drop_down_circle),
            children: const <Widget>[
              ListTile(
                  title: Text(
                      'Yes, your information is securely handled. We prioritize user privacy and ensure that only relevant details are shared with the selected electrician to address your specific issue.')),
            ],
            onExpansionChanged: (bool expanded) {
              setState(() {
                _customTileExpanded = expanded;
              });
            },
          ),
          ExpansionTile(
            title: const Text(
                'What if I encounter an issue after the electrician service is completed?'),
            //
            trailing: Icon(Icons.arrow_drop_down_circle),
            children: const <Widget>[
              ListTile(
                  title: Text(
                      'In case of any problems post-service, contact our customer support through the app. We\'ll assist you in resolving the issue and ensure your satisfaction with the electrician\'s work.')),
            ],
            onExpansionChanged: (bool expanded) {
              setState(() {
                _customTileExpanded = expanded;
              });
            },
          ),
          Center(
              child: Text(
            'Car Mechanic FAQs:',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
                fontSize: 24),
          )),
          ExpansionTile(
            title: const Text('How do I book a car mechanic using the app?'),
            // subtitle: const Text('To schedule a car mechanic, go to the \'Car Mechanic\' category, choose the service needed, and follow the steps to book an appointment. Provide essential details about your vehicle to ensure accurate service.'),
            trailing: Icon(Icons.arrow_drop_down_circle),
            children: const <Widget>[
              ListTile(
                  title: Text(
                      'To schedule a car mechanic, go to the \'Car Mechanic\' category, choose the service needed, and follow the steps to book an appointment. Provide essential details about your vehicle to ensure accurate service.')),
            ],
            onExpansionChanged: (bool expanded) {
              setState(() {
                _customTileExpanded = expanded;
              });
            },
          ),
          ExpansionTile(
            title: const Text(
                'Can I get a cost estimate before booking a car mechanic?'),
            //
            trailing: Icon(Icons.arrow_drop_down_circle),
            children: const <Widget>[
              ListTile(
                  title: Text(
                      'Yes, the app provides estimates for common car repair services. However, for a precise quote, it\'s recommended to describe the issue in detail during the booking process or consult with the mechanic on-site.')),
            ],
            onExpansionChanged: (bool expanded) {
              setState(() {
                _customTileExpanded = expanded;
              });
            },
          ),
          ExpansionTile(
            title: const Text('What happens if my car mechanic is delayed?'),
            trailing: Icon(Icons.arrow_drop_down_circle),
            children: const <Widget>[
              ListTile(
                  title: Text(
                      'If there are any delays, you\'ll be notified through the app. You can track the mechanic\'s progress and receive real-time updates on their estimated time of arrival.')),
            ],
            onExpansionChanged: (bool expanded) {
              setState(() {
                _customTileExpanded = expanded;
              });
            },
          ),
          Center(
              child: Text(
            'Car Wash FAQs:',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
                fontSize: 24),
          )),
          ExpansionTile(
            title: const Text('How do I schedule a car wash through the app?'),
            trailing: Icon(Icons.arrow_drop_down_circle),
            children: const <Widget>[
              ListTile(
                  title: Text(
                      'To book a car wash, select the \'Car Wash\' category, choose the type of service you prefer, and follow the steps to confirm your appointment. Provide your location, and a car wash professional will be assigned to you.')),
            ],
            onExpansionChanged: (bool expanded) {
              setState(() {
                _customTileExpanded = expanded;
              });
            },
          ),
          ExpansionTile(
            title: const Text(
                'Can I customize the car wash services according to my preferences?'),
            trailing: Icon(Icons.arrow_drop_down_circle),
            children: const <Widget>[
              ListTile(
                  title: Text(
                      'Absolutely! You can choose from various car wash options and customize the services based on your preferences. Whether it\'s a basic wash or a detailed interior cleaning, the app allows you to tailor the service to your liking.')),
            ],
            onExpansionChanged: (bool expanded) {
              setState(() {
                _customTileExpanded = expanded;
              });
            },
          ),
        ],
      ),
    );
  }
}
