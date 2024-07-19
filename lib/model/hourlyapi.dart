class HourlyApi {
Forecast? forecast;

HourlyApi({this.forecast});

HourlyApi.fromJson(Map<String, dynamic> json) {
forecast = json['forecast'] != null
? new Forecast.fromJson(json['forecast'])
    : null;
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = new Map<String, dynamic>();
if (this.forecast != null) {
data['forecast'] = this.forecast!.toJson();
}
return data;
}
}

class Forecast {
List<Forecastday>? forecastday;

Forecast({this.forecastday});

Forecast.fromJson(Map<String, dynamic> json) {
if (json['forecastday'] != null) {
forecastday = <Forecastday>[];
json['forecastday'].forEach((v) {
forecastday!.add(new Forecastday.fromJson(v));
});
}
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = new Map<String, dynamic>();
if (this.forecastday != null) {
data['forecastday'] = this.forecastday!.map((v) => v.toJson()).toList();
}
return data;
}
}

class Forecastday {
List<Hour>? hour;

Forecastday({this.hour});

Forecastday.fromJson(Map<String, dynamic> json) {
if (json['hour'] != null) {
hour = <Hour>[];
json['hour'].forEach((v) {
hour!.add(new Hour.fromJson(v));
});
}
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = new Map<String, dynamic>();
if (this.hour != null) {
data['hour'] = this.hour!.map((v) => v.toJson()).toList();
}
return data;
}
}

class Hour {
String? time;
double? tempC;
Condition? condition;

Hour({this.time, this.tempC, this.condition});

Hour.fromJson(Map<String, dynamic> json) {
time = json['time'];
tempC = json['temp_c'];
condition = json['condition'] != null
? new Condition.fromJson(json['condition'])
    : null;
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = new Map<String, dynamic>();
data['time'] = this.time;
data['temp_c'] = this.tempC;
if (this.condition != null) {
data['condition'] = this.condition!.toJson();
}
return data;
}
}

class Condition {
String? icon;

Condition({this.icon});

Condition.fromJson(Map<String, dynamic> json) {
icon = json['icon'];
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = new Map<String, dynamic>();
data['icon'] = this.icon;
return data;
}
}