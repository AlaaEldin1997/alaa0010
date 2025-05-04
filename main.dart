// main.dart for El7a2ny App
// IMPORTANT NOTE: This is a simplified structural implementation based on your requirements.
// Due to the complexity (maps, real-time data, payments, backend logic, admin features)
// and the request for a single file, many features are represented by placeholder UI elements
// and lack full functionality. A real-world app would require a proper project structure,
// backend services, and integration with third-party APIs (maps, payments).
// This single file structure is NOT standard Flutter practice and significantly limits scalability and maintainability.

import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart'; // Requires setup
// import 'package:location/location.dart'; // Requires setup
// import 'package:flutter_localizations/flutter_localizations.dart'; // For localization
// import 'package:shared_preferences/shared_preferences.dart'; // For storing settings

// --- App Configuration ---
const String appName = 'El7a2ny';
const String appNameArabic = 'الحقني';
const Color primaryColor = Colors.blue;
const Color secondaryColor = Colors.white;
const double commissionRate = 0.20; // Default 20%
const String hotlinePhoneNumber = '+201XXXXXXXXX'; // Placeholder

void main() {
  runApp(El7a2nyApp());
}

// --- Localization Setup (Basic) ---
// A full implementation would use packages like `intl` or `easy_localization`
class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  Map<String, String> _localizedStrings = {};

  Future<bool> load() async {
    // In a real app, load JSON/ARB files based on locale
    if (locale.languageCode == 'ar') {
      _localizedStrings = {
        'appName': appNameArabic,
        'login': 'تسجيل الدخول',
        'register': 'تسجيل جديد',
        'email': 'البريد الإلكتروني',
        'password': 'كلمة المرور',
        'userType': 'نوع المستخدم',
        'client': 'عميل',
        'technician': 'فني',
        'home': 'الرئيسية',
        'requests': 'الطلبات',
        'profile': 'الملف الشخصي',
        'settings': 'الإعدادات',
        'logout': 'تسجيل الخروج',
        'selectService': 'اختر الخدمة',
        'electrician': 'كهربائي',
        'plumber': 'سباك',
        'painter': 'نقاش',
        'carpenter': 'نجار',
        'towTruck': 'ونش سيارات',
        'requestTechnician': 'اطلب فني',
        'yourLocation': 'موقعك الحالي',
        'estimatedPrice': 'السعر التقديري',
        'negotiation': 'تفاوض (اختياري)',
        'submitRequest': 'إرسال الطلب',
        'nearbyTechnicians': 'فنيون بالجوار',
        'technicianDashboard': 'لوحة تحكم الفني',
        'activeRequests': 'الطلبات النشطة',
        'earnings': 'الأرباح',
        'fixedPrices': 'الأسعار الثابتة',
        'hotlineSupport': 'الدعم الفني',
        'callSupport': 'اتصل بالدعم',
        'adPlaceholder': 'مساحة إعلانية',
        'onlineStores': 'متاجر إلكترونية (قريباً)',
        'paymentMethods': 'طرق الدفع',
        'cash': 'نقداً',
        'card': 'بطاقة ائتمانية/خصم',
        'wallet': 'محفظة إلكترونية',
        'instapay': 'إنستا باي',
        'language': 'اللغة',
        'accountDetails': 'تفاصيل الحساب',
        'save': 'حفظ',
        'commissionInfo': 'سيتم خصم عمولة {rate}% من سعر الخدمة.', // Placeholder for rate
        'negotiatePlaceholder': 'اكتب رسالتك للتفاوض هنا...'
      };
    } else {
      _localizedStrings = {
        'appName': appName,
        'login': 'Login',
        'register': 'Register',
        'email': 'Email',
        'password': 'Password',
        'userType': 'User Type',
        'client': 'Client',
        'technician': 'Technician',
        'home': 'Home',
        'requests': 'Requests',
        'profile': 'Profile',
        'settings': 'Settings',
        'logout': 'Logout',
        'selectService': 'Select Service',
        'electrician': 'Electrician',
        'plumber': 'Plumber',
        'painter': 'Painter',
        'carpenter': 'Carpenter',
        'towTruck': 'Tow Truck',
        'requestTechnician': 'Request Technician',
        'yourLocation': 'Your Location',
        'estimatedPrice': 'Estimated Price',
        'negotiation': 'Negotiation (Optional)',
        'submitRequest': 'Submit Request',
        'nearbyTechnicians': 'Nearby Technicians',
        'technicianDashboard': 'Technician Dashboard',
        'activeRequests': 'Active Requests',
        'earnings': 'Earnings',
        'fixedPrices': 'Fixed Prices',
        'hotlineSupport': 'Hotline Support',
        'callSupport': 'Call Support',
        'adPlaceholder': 'Ad Space Placeholder',
        'onlineStores': 'Online Stores (Coming Soon)',
        'paymentMethods': 'Payment Methods',
        'cash': 'Cash',
        'card': 'Credit/Debit Card',
        'wallet': 'Wallet',
        'instapay': 'InstaPay',
        'language': 'Language',
        'accountDetails': 'Account Details',
        'save': 'Save',
        'commissionInfo': 'A commission of {rate}% will be applied to the service price.', // Placeholder for rate
        'negotiatePlaceholder': 'Type your negotiation message here...'
      };
    }
    return true;
  }

  String translate(String key) {
    return _localizedStrings[key] ?? key; // Return key if translation not found
  }
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'ar'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    AppLocalizations localizations = AppLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

// --- Main App Widget ---
class El7a2nyApp extends StatefulWidget {
  @override
  _El7a2nyAppState createState() => _El7a2nyAppState();

  static void setLocale(BuildContext context, Locale newLocale) {
    _El7a2nyAppState? state = context.findAncestorStateOfType<_El7a2nyAppState>();
    state?.setLocale(newLocale);
  }
}

class _El7a2nyAppState extends State<El7a2nyApp> {
  Locale _locale = Locale('ar', ''); // Default to Arabic

  // In a real app, load locale preference from SharedPreferences

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
    // In a real app, save locale preference to SharedPreferences
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      theme: ThemeData(
        primarySwatch: primaryColor as MaterialColor?, // Cast needed if using Colors.blue
        scaffoldBackgroundColor: secondaryColor,
        appBarTheme: AppBarTheme(
          backgroundColor: primaryColor,
          foregroundColor: secondaryColor,
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: primaryColor,
          textTheme: ButtonTextTheme.primary,
        ),
        colorScheme: ColorScheme.light(
            primary: primaryColor,
            secondary: secondaryColor
        )
      ),
      locale: _locale,
      supportedLocales: [
        Locale('en', ''),
        Locale('ar', ''),
      ],
      localizationsDelegates: [
        AppLocalizations.delegate,
        // GlobalMaterialLocalizations.delegate, // Add these for full Flutter localization
        // GlobalWidgetsLocalizations.delegate,
        // GlobalCupertinoLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale?.languageCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first; // Default to first supported (English)
      },
      debugShowCheckedModeBanner: false,
      // Initial route depends on login state (implement logic here)
      home: AuthWrapper(), // Start with authentication check
    );
  }
}

// --- Authentication ---
enum UserType { client, technician }

// Mock authentication state - replace with actual auth logic (Firebase Auth, etc.)
bool _isLoggedIn = false;
UserType? _currentUserType;

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Here you would check actual login status (e.g., from Firebase Auth, SharedPreferences)
    if (_isLoggedIn) {
      if (_currentUserType == UserType.client) {
        return ClientHomeScreen();
      } else if (_currentUserType == UserType.technician) {
        return TechnicianHomeScreen();
      } else {
        // Handle error or default case
        return LoginScreen();
      }
    } else {
      return LoginScreen();
    }
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login() {
    // --- Mock Login Logic ---
    // Replace with actual authentication call
    String email = _emailController.text;
    String password = _passwordController.text;
    print('Attempting login for: $email');

    // Simulate login success - **Replace with real logic**
    // Determine user type based on login response or stored data
    if (email.isNotEmpty && password.isNotEmpty) {
       // Simulate determining user type (e.g., based on email domain or backend response)
       _currentUserType = email.contains('client') ? UserType.client : UserType.technician;
       _isLoggedIn = true;
       // Navigate to appropriate home screen
       Navigator.pushReplacement(
         context,
         MaterialPageRoute(builder: (context) => AuthWrapper()),
       );
    } else {
       ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(content: Text('Login Failed (Mock)')),
       );
    }
    // --- End Mock Logic ---
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(loc.translate('login'))),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logo.jpg', height: 150), // Use the logo
            SizedBox(height: 20),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: loc.translate('email')),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 10),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: loc.translate('password')),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: Text(loc.translate('login')),
              style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 40)),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegistrationScreen()),
                );
              },
              child: Text(loc.translate('register')),
            ),
          ],
        ),
      ),
    );
  }
}

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  UserType _selectedUserType = UserType.client; // Default

  void _register() {
    // --- Mock Registration Logic ---
    String email = _emailController.text;
    String password = _passwordController.text;
    UserType userType = _selectedUserType;
    print('Attempting registration for: $email as $userType');

    // Simulate registration success - **Replace with real logic**
    if (email.isNotEmpty && password.isNotEmpty) {
      _currentUserType = userType;
      _isLoggedIn = true;
      // Navigate to appropriate home screen
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => AuthWrapper()),
        (Route<dynamic> route) => false, // Remove all previous routes
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Registration Failed (Mock)')),
      );
    }
    // --- End Mock Logic ---
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(loc.translate('register'))),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: loc.translate('email')),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 10),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: loc.translate('password')),
              obscureText: true,
            ),
            SizedBox(height: 20),
            Text(loc.translate('userType')),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio<UserType>(
                  value: UserType.client,
                  groupValue: _selectedUserType,
                  onChanged: (UserType? value) {
                    setState(() {
                      _selectedUserType = value!;
                    });
                  },
                ),
                Text(loc.translate('client')),
                Radio<UserType>(
                  value: UserType.technician,
                  groupValue: _selectedUserType,
                  onChanged: (UserType? value) {
                    setState(() {
                      _selectedUserType = value!;
                    });
                  },
                ),
                Text(loc.translate('technician')),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _register,
              child: Text(loc.translate('register')),
              style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 40)),
            ),
          ],
        ),
      ),
    );
  }
}

// --- Client Screens ---
class ClientHomeScreen extends StatefulWidget {
  @override
  _ClientHomeScreenState createState() => _ClientHomeScreenState();
}

class _ClientHomeScreenState extends State<ClientHomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    ClientMapScreen(), // Placeholder for map
    ClientRequestsScreen(), // Placeholder for requests list
    SettingsScreen(), // Shared settings screen
  ];

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return Scaffold(
      body: IndexedStack( // Keep state of screens
         index: _currentIndex,
         children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: loc.translate('home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: loc.translate('requests'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: loc.translate('settings'),
          ),
        ],
        selectedItemColor: primaryColor,
      ),
    );
  }
}

class ClientMapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(loc.translate('nearbyTechnicians')),
        actions: [
           IconButton(icon: Icon(Icons.add), onPressed: () {
               Navigator.push(context, MaterialPageRoute(builder: (context) => ServiceRequestScreen()));
           }),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.map_outlined, size: 100, color: Colors.grey),
            SizedBox(height: 10),
            Text('Map View Placeholder'),
            Text('(Requires google_maps_flutter integration)'),
            SizedBox(height: 20),
            // Placeholder for Ad
            Container(
              padding: EdgeInsets.all(10),
              color: Colors.grey[300],
              child: Text(loc.translate('adPlaceholder')),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => ServiceRequestScreen()));
        },
        child: Icon(Icons.add),
        backgroundColor: primaryColor,
      ),
    );
  }
}

class ServiceRequestScreen extends StatefulWidget {
  @override
  _ServiceRequestScreenState createState() => _ServiceRequestScreenState();
}

class _ServiceRequestScreenState extends State<ServiceRequestScreen> {
  String? _selectedService;
  final _negotiationController = TextEditingController();

  // Mock location - replace with actual location fetching (package:location)
  String _currentLocation = 'Fetching location...';
  String _estimatedPrice = 'N/A';

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  void _getLocation() async {
    // Simulate location fetching
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      _currentLocation = 'Mock Location: 123 Main St';
    });
  }

  void _updatePriceEstimate(String? service) {
     // Simulate fetching fixed price or allowing negotiation
     setState(() {
       if (service != null) {
         _estimatedPrice = '\$${(service.length * 10).toString()} (Mock Fixed)'; // Example price
       } else {
         _estimatedPrice = 'N/A';
       }
     });
  }

  void _submitRequest() {
     // --- Mock Submit Logic ---
     print('Submitting request:');
     print('Service: $_selectedService');
     print('Location: $_currentLocation');
     print('Negotiation: ${_negotiationController.text}');
     // Add logic to send request to backend
     ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(content: Text('Request Submitted (Mock)')),
     );
     Navigator.pop(context); // Go back after submission
     // --- End Mock Logic ---
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final services = [
      loc.translate('electrician'),
      loc.translate('plumber'),
      loc.translate('painter'),
      loc.translate('carpenter'),
      loc.translate('towTruck'),
    ];

    return Scaffold(
      appBar: AppBar(title: Text(loc.translate('requestTechnician'))),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(loc.translate('selectService'), style: Theme.of(context).textTheme.titleMedium),
            DropdownButton<String>(
              value: _selectedService,
              isExpanded: true,
              hint: Text(loc.translate('selectService')),
              items: services.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedService = newValue;
                  _updatePriceEstimate(newValue);
                });
              },
            ),
            SizedBox(height: 20),
            Text(loc.translate('yourLocation'), style: Theme.of(context).textTheme.titleMedium),
            Text(_currentLocation),
            // Add button to refresh/confirm location if needed
            SizedBox(height: 20),
            Text(loc.translate('estimatedPrice'), style: Theme.of(context).textTheme.titleMedium),
            Text(_estimatedPrice),
            SizedBox(height: 10),
            Text(loc.translate('commissionInfo').replaceAll('{rate}', (commissionRate * 100).toStringAsFixed(0))),
            SizedBox(height: 20),
            Text(loc.translate('negotiation'), style: Theme.of(context).textTheme.titleMedium),
            TextField(
              controller: _negotiationController,
              decoration: InputDecoration(
                hintText: loc.translate('negotiatePlaceholder'),
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            SizedBox(height: 20),
            // Payment Method Selection Placeholder
            Text(loc.translate('paymentMethods'), style: Theme.of(context).textTheme.titleMedium),
            Wrap(
              spacing: 8.0,
              children: [
                ChoiceChip(label: Text(loc.translate('cash')), selected: true, onSelected: (val){}), // Mock selection
                ChoiceChip(label: Text(loc.translate('card')), selected: false, onSelected: (val){}),
                ChoiceChip(label: Text(loc.translate('wallet')), selected: false, onSelected: (val){}),
                ChoiceChip(label: Text(loc.translate('instapay')), selected: false, onSelected: (val){}),
              ],
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: _selectedService != null ? _submitRequest : null, // Enable only if service selected
              child: Text(loc.translate('submitRequest')),
              style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 40)),
            ),
            SizedBox(height: 20),
            // Placeholder for Ad
            Container(
              padding: EdgeInsets.all(10),
              color: Colors.grey[300],
              alignment: Alignment.center,
              child: Text(loc.translate('adPlaceholder')),
            ),
          ],
        ),
      ),
    );
  }
}

class ClientRequestsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(loc.translate('requests'))),
      body: Center(
        child: Text('Client Requests List Placeholder'),
        // Add ListView to display past/active requests
      ),
    );
  }
}

// --- Technician Screens ---
class TechnicianHomeScreen extends StatefulWidget {
  @override
  _TechnicianHomeScreenState createState() => _TechnicianHomeScreenState();
}

class _TechnicianHomeScreenState extends State<TechnicianHomeScreen> {
   int _currentIndex = 0;

  final List<Widget> _screens = [
    TechnicianDashboardScreen(), // Placeholder for dashboard
    TechnicianRequestsScreen(), // Placeholder for requests list
    SettingsScreen(), // Shared settings screen
  ];

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return Scaffold(
      body: IndexedStack( // Keep state of screens
         index: _currentIndex,
         children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: loc.translate('technicianDashboard'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: loc.translate('requests'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: loc.translate('settings'),
          ),
        ],
        selectedItemColor: primaryColor,
      ),
    );
  }
}

class TechnicianDashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(loc.translate('technicianDashboard'))),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text('Technician Dashboard Placeholder'),
             SizedBox(height: 20),
             ListTile(leading: Icon(Icons.history), title: Text(loc.translate('activeRequests'))), // Placeholder links
             ListTile(leading: Icon(Icons.attach_money), title: Text(loc.translate('earnings'))),
             ListTile(leading: Icon(Icons.toggle_on), title: Text('Availability Status (Mock)')),
             SizedBox(height: 20),
             // Placeholder for Ad
             Container(
               padding: EdgeInsets.all(10),
               color: Colors.grey[300],
               child: Text(loc.translate('adPlaceholder')),
             ),
          ],
        )
      ),
    );
  }
}

class TechnicianRequestsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(loc.translate('activeRequests'))),
      body: Center(
        child: Text('Technician Requests List Placeholder'),
        // Add ListView to display incoming/active job requests
      ),
    );
  }
}

// --- Shared Screens ---
class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String _selectedLanguage = 'ar'; // Default

 @override
 void didChangeDependencies() {
   super.didChangeDependencies();
   // Set initial language based on current app locale
   _selectedLanguage = Localizations.localeOf(context).languageCode;
 }

  void _changeLanguage(String? languageCode) {
    if (languageCode != null) {
      setState(() {
        _selectedLanguage = languageCode;
      });
      Locale newLocale = Locale(languageCode, '');
      El7a2nyApp.setLocale(context, newLocale);
    }
  }

  void _logout() {
    // --- Mock Logout Logic ---
    _isLoggedIn = false;
    _currentUserType = null;
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => AuthWrapper()),
      (Route<dynamic> route) => false, // Remove all routes
    );
    // --- End Mock Logic ---
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(loc.translate('settings'))),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.language),
            title: Text(loc.translate('language')),
            trailing: DropdownButton<String>(
              value: _selectedLanguage,
              items: [
                DropdownMenuItem(child: Text('English'), value: 'en'),
                DropdownMenuItem(child: Text('العربية'), value: 'ar'),
              ],
              onChanged: _changeLanguage,
            ),
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text(loc.translate('accountDetails')),
            onTap: () { /* Navigate to account details screen */ },
          ),
          ListTile(
            leading: Icon(Icons.price_change_outlined),
            title: Text(loc.translate('fixedPrices')),
            onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => FixedPricesScreen())); },
          ),
          ListTile(
            leading: Icon(Icons.support_agent),
            title: Text(loc.translate('hotlineSupport')),
            onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => HotlineScreen())); },
          ),
          ListTile(
            leading: Icon(Icons.store),
            title: Text(loc.translate('onlineStores')),
            onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => OnlineStoresScreen())); },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout, color: Colors.red),
            title: Text(loc.translate('logout'), style: TextStyle(color: Colors.red)),
            onTap: _logout,
          ),
        ],
      ),
    );
  }
}

class FixedPricesScreen extends StatelessWidget {
  // In a real app, fetch prices from backend (admin controlled)
  final Map<String, double> mockPrices = {
    'Electrician': 50.0,
    'Plumber': 60.0,
    'Painter': 100.0,
    'Carpenter': 70.0,
    'Tow Truck': 150.0,
  };

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    // Translate keys for display if needed, or use backend keys directly
    final displayPrices = {
      loc.translate('electrician'): mockPrices['Electrician'],
      loc.translate('plumber'): mockPrices['Plumber'],
      loc.translate('painter'): mockPrices['Painter'],
      loc.translate('carpenter'): mockPrices['Carpenter'],
      loc.translate('towTruck'): mockPrices['Tow Truck'],
    };

    return Scaffold(
      appBar: AppBar(title: Text(loc.translate('fixedPrices'))),
      body: ListView.builder(
        itemCount: displayPrices.length,
        itemBuilder: (context, index) {
          String service = displayPrices.keys.elementAt(index);
          double? price = displayPrices[service];
          return ListTile(
            title: Text(service),
            trailing: Text(price != null ? '\$${price.toStringAsFixed(2)}' : 'N/A'),
          );
        },
      ),
    );
  }
}

class HotlineScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(loc.translate('hotlineSupport'))),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.phone, size: 50, color: primaryColor),
            SizedBox(height: 20),
            Text('Contact us at: $hotlinePhoneNumber'),
            SizedBox(height: 20),
            ElevatedButton.icon(
              icon: Icon(Icons.call),
              label: Text(loc.translate('callSupport')),
              onPressed: () {
                // Add logic to initiate phone call (requires url_launcher package)
                print('Calling $hotlinePhoneNumber...');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class OnlineStoresScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(loc.translate('onlineStores'))),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.construction, size: 50, color: Colors.orange),
            SizedBox(height: 20),
            Text('Online Store Integration - Coming Soon!'),
            // Placeholder for future store links/views
          ],
        ),
      ),
    );
  }
}

// --- Admin Panel (Conceptual - Not Implemented in single file) ---
// A real admin panel would be a separate web application or specific screens
// within the app accessible only to admin users, interacting with the backend
// to modify settings like commission rate, fixed prices, hotline number etc.


