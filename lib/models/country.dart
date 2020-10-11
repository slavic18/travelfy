class CountryData {
  String travelTrain;
  String status;
  bool crossBorderWorker;
  String travelBike;
  String travelCar;
  String hotelStatus;
  String travelPlane;
  bool specialDocuments;
  bool covidTest;
  LastUpdate lastUpdate;
  String mask;
  List<String> localLinks;
  String freeMovement;
  String covidTestLink;
  bool transitAllowed;
  String barStatus;
  String travelMotor;
  String name;
  bool quarantine;
  String info;
  bool socialDistance;

  CountryData(
      {this.travelTrain,
        this.status,
        this.crossBorderWorker,
        this.travelBike,
        this.travelCar,
        this.hotelStatus,
        this.travelPlane,
        this.specialDocuments,
        this.covidTest,
        this.lastUpdate,
        this.mask,
        this.localLinks,
        this.freeMovement,
        this.covidTestLink,
        this.transitAllowed,
        this.barStatus,
        this.travelMotor,
        this.name,
        this.quarantine,
        this.info,
        this.socialDistance});

  CountryData.fromJson(Map<String, dynamic> json) {
    travelTrain = json['travelTrain'];
    status = json['status'] ;
    crossBorderWorker =   json['crossBorderWorker'];
    travelBike = json['travelBike'];
    travelCar = json['travelCar'];
    hotelStatus = json['hotelStatus'];
    travelPlane = json['travelPlane'];
    specialDocuments = json['specialDocuments'];
    covidTest = json['covidTest'];
    lastUpdate = json['lastUpdate'] != null
        ? new LastUpdate.fromJson(json['lastUpdate'])
        : null;
    mask = json['mask'];
    localLinks = json['localLinks'].cast<String>();
    freeMovement = json['freeMovement'];
    covidTestLink = json['covidTestLink'];
    transitAllowed = json['transitAllowed'];
    barStatus = json['barStatus'];
    travelMotor = json['travelMotor'];
    name = json['name'];
    quarantine = json['quarantine'];
    info = json['info'];
    socialDistance = json['socialDistance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['TravelTrain'] = this.travelTrain;
    data['status'] = this.status;
    data['crossBorderWorker'] = this.crossBorderWorker;
    data['TravelBike'] = this.travelBike;
    data['TravelCar'] = this.travelCar;
    data['hotelStatus'] = this.hotelStatus;
    data['TravelPlane'] = this.travelPlane;
    data['specialDocuments'] = this.specialDocuments;
    data['covidTest'] = this.covidTest;
    if (this.lastUpdate != null) {
      data['lastUpdate'] = this.lastUpdate.toJson();
    }
    data['mask'] = this.mask;
    data['localLinks'] = this.localLinks;
    data['freeMovement'] = this.freeMovement;
    data['covidTestLink'] = this.covidTestLink;
    data['transitAllowed'] = this.transitAllowed;
    data['barStatus'] = this.barStatus;
    data['TravelMotor'] = this.travelMotor;
    data['name'] = this.name;
    data['quarantine'] = this.quarantine;
    data['info'] = this.info;
    data['socialDistance'] = this.socialDistance;
    return data;
  }
}

class LastUpdate {
  String sDatatype;
  Value value;

  LastUpdate({this.sDatatype, this.value});

  LastUpdate.fromJson(Map<String, dynamic> json) {
    sDatatype = json['__datatype__'];
    value = json['value'] != null ? new Value.fromJson(json['value']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['__datatype__'] = this.sDatatype;
    if (this.value != null) {
      data['value'] = this.value.toJson();
    }
    return data;
  }
}

class Value {
  int iSeconds;
  int iNanoseconds;

  Value({this.iSeconds, this.iNanoseconds});

  Value.fromJson(Map<String, dynamic> json) {
    iSeconds = json['_seconds'];
    iNanoseconds = json['_nanoseconds'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_seconds'] = this.iSeconds;
    data['_nanoseconds'] = this.iNanoseconds;
    return data;
  }
}