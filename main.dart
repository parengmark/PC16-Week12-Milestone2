abstract class Maintainable {
  void performMaintenance();
}

mixin GPSNavigation {
  void navigate(String destination) {
    print('GPS: Calculating route to $destination...');
  }
}

abstract class Vehicle implements Maintainable {
  String brand;
  String model;

  Vehicle(this.brand, this.model);

  void startEngine();

  Future<void> runDiagnostic() async {
    try {
      print('Running diagnostics for $brand $model...');
      await Future.delayed(Duration(seconds: 1));
      print('Diagnostic completed for $brand $model.');
    } catch (e) {
      print('Diagnostic error: $e');
    }
  }
}

class Jeepney extends Vehicle with GPSNavigation {
  String route;
  int capacity;
  double fare;
  int _currentPassengers = 0;

  Jeepney(
    String brand,
    String model,
    this.route,
    this.capacity,
    this.fare,
  ) : super(brand, model);

  int get passengers => _currentPassengers;

  double get totalFare => fare * _currentPassengers;

  int get availableSeats => capacity - _currentPassengers;

  @override
  void startEngine() {
    print('$brand $model jeepney engine is starting...');
  }

  void board(int count) {
    if (count <= 0) {
      print('Invalid passenger count.');
    } else if (_currentPassengers + count <= capacity) {
      _currentPassengers += count;
      print('$count passenger(s) boarded. Total: $_currentPassengers');
    } else {
      print('Cannot board passengers. Jeepney is over capacity.');
    }
  }

  void disembark(int count) {
    if (count <= 0 || count > _currentPassengers) {
      print('Invalid disembark count.');
    } else {
      _currentPassengers -= count;
      print('$count passenger(s) got off. Total: $_currentPassengers');
    }
  }

  @override
  void performMaintenance() {
    print('Jeepney Maintenance: Checking engine, tires, and brakes.');
  }

  void displayStatus() {
    print('Route: $route');
    print('Brand: $brand $model');
    print('Capacity: $capacity');
    print('Current Passengers: $_currentPassengers');
    print('Available Seats: $availableSeats');
    print('Estimated Fare Total: PHP ${totalFare.toStringAsFixed(2)}');
  }
}

class Car extends Vehicle with GPSNavigation {
  int numberOfDoors;

  Car(String brand, String model, this.numberOfDoors)
      : super(brand, model);

  @override
  void startEngine() {
    print('Pushing the start button on the $brand $model car.');
  }

  @override
  void performMaintenance() {
    print('Car Maintenance: Changing oil and rotating tires.');
  }
}

class Motorcycle extends Vehicle with GPSNavigation {
  bool hasSidecar;

  Motorcycle(String brand, String model, this.hasSidecar)
      : super(brand, model);

  @override
  void startEngine() {
    print('Kicking the pedal to start the $brand $model motorcycle.');
  }

  @override
  void performMaintenance() {
    print('Motorcycle Maintenance: Lubricating chain and checking brakes.');
  }
}

double calculateAveragePassengers(List<Jeepney> fleet) {
  if (fleet.isEmpty) {
    return 0;
  }

  int totalPassengers = 0;

  for (var jeepney in fleet) {
    totalPassengers += jeepney.passengers;
  }

  return totalPassengers / fleet.length;
}

void displayFleet(List<Jeepney> fleet) {
  print('\n--- JEEPNEY FLEET STATUS ---');

  for (var jeepney in fleet) {
    jeepney.displayStatus();
    print('---------------------------');
  }
}

void performFleetMaintenance(List<Vehicle> vehicles) {
  print('\n--- FLEET MAINTENANCE ---');

  for (var vehicle in vehicles) {
    vehicle.performMaintenance();
  }
}

void startFleetEngines(List<Vehicle> vehicles) {
  print('\n--- STARTING VEHICLES ---');

  for (var vehicle in vehicles) {
    vehicle.startEngine();
  }
}

Future<void> runFleetDiagnostics(List<Vehicle> vehicles) async {
  print('\n--- VEHICLE DIAGNOSTICS ---');

  for (var vehicle in vehicles) {
    await vehicle.runDiagnostic();
  }
}

Future<void> main() async {
  Jeepney jeep1 = Jeepney(
    'Isuzu',
    'N-Series',
    'Cubao - Silangan',
    20,
    15.00,
  );

  Jeepney jeep2 = Jeepney(
    'Mitsubishi',
    'Canter',
    'Fairview - Quiapo',
    22,
    15.00,
  );

  Jeepney jeep3 = Jeepney(
    'Toyota',
    'Coaster',
    'Taft - Monumento',
    18,
    15.00,
  );

  Car myCar = Car('Toyota', 'Camry', 4);

  Motorcycle myBike = Motorcycle('Yamaha', 'MT-07', false);

  List<Jeepney> fleet = [jeep1, jeep2, jeep3];

  List<Vehicle> allVehicles = [
    jeep1,
    jeep2,
    jeep3,
    myCar,
    myBike,
  ];

  print('================================');
  print('     VEHICLE FLEET SYSTEM');
  print('================================');

  jeep1.board(15);
  jeep1.board(10);
  jeep1.disembark(5);

  jeep2.board(20);
  jeep2.disembark(5);

  jeep3.board(18);

  displayFleet(fleet);

  print('\nAverage Passengers: ${calculateAveragePassengers(fleet).toStringAsFixed(2)}');

  startFleetEngines(allVehicles);

  performFleetMaintenance(allVehicles);

  jeep1.navigate('National Teachers College');
  myCar.navigate('Manila City Hall');
  myBike.navigate('Quezon City');

  await runFleetDiagnostics(allVehicles);

  print('\n================================');
  print('       END OF FLEET REPORT');
  print('================================');
}
