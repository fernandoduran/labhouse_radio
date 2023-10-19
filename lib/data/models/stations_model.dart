//Generated with https://app.quicktype.io
import 'package:equatable/equatable.dart';

class StationsModel extends Equatable{

  final String? changeuuid;
  final String? stationuuid;
  final String? serveruuid;
  final String? name;
  final String? url;
  final String? urlResolved;
  final String? homepage;
  final String? favicon;
  final String? tags;
  final String? country;
  final String? countrycode;
  final dynamic iso31662;
  final String? state;
  final String? language;
  final String? languagecodes;
  final int? votes;
  final DateTime? lastchangetime;
  final DateTime? lastchangetimeIso8601;
  final String? codec;
  final int? bitrate;
  final int? hls;
  final int? lastcheckok;
  final DateTime? lastchecktime;
  final DateTime? lastchecktimeIso8601;
  final DateTime? lastcheckoktime;
  final DateTime? lastcheckoktimeIso8601;
  final DateTime? lastlocalchecktime;
  final DateTime? lastlocalchecktimeIso8601;
  final DateTime? clicktimestamp;
  final DateTime? clicktimestampIso8601;
  final int? clickcount;
  final int? clicktrend;
  final int? sslError;
  final double? geoLat;
  final double? geoLong;
  final bool? hasExtendedInfo;

  const StationsModel({
    this.changeuuid,
    this.stationuuid,
    this.serveruuid,
    this.name,
    this.url,
    this.urlResolved,
    this.homepage,
    this.favicon,
    this.tags,
    this.country,
    this.countrycode,
    this.iso31662,
    this.state,
    this.language,
    this.languagecodes,
    this.votes,
    this.lastchangetime,
    this.lastchangetimeIso8601,
    this.codec,
    this.bitrate,
    this.hls,
    this.lastcheckok,
    this.lastchecktime,
    this.lastchecktimeIso8601,
    this.lastcheckoktime,
    this.lastcheckoktimeIso8601,
    this.lastlocalchecktime,
    this.lastlocalchecktimeIso8601,
    this.clicktimestamp,
    this.clicktimestampIso8601,
    this.clickcount,
    this.clicktrend,
    this.sslError,
    this.geoLat,
    this.geoLong,
    this.hasExtendedInfo
  });

  factory StationsModel.fromJson(Map<String, dynamic> json) => StationsModel(
      changeuuid: json["changeuuid"],
      stationuuid: json["stationuuid"],
      serveruuid: json["serveruuid"],
      name: json["name"],
      url: json["url"],
      urlResolved: json["url_resolved"],
      homepage: json["homepage"],
      favicon: json["favicon"],
      tags: json["tags"],
      country: json["country"],
      countrycode: json["countrycode"],
      iso31662: json["iso_3166_2"],
      state: json["state"],
      language: json["language"],
      languagecodes: json["languagecodes"],
      votes: json["votes"],
      lastchangetime: json["lastchangetime"] == null ? null : DateTime.parse(json["lastchangetime"]),
      lastchangetimeIso8601: json["lastchangetime_iso8601"] == null ? null : DateTime.parse(json["lastchangetime_iso8601"]),
      codec: json["codec"],
      bitrate: json["bitrate"],
      hls: json["hls"],
      lastcheckok: json["lastcheckok"],
      lastchecktime: json["lastchecktime"] == null ? null : DateTime.parse(json["lastchecktime"]),
      lastchecktimeIso8601: json["lastchecktime_iso8601"] == null ? null : DateTime.parse(json["lastchecktime_iso8601"]),
      lastcheckoktime: json["lastcheckoktime"] == null ? null : DateTime.parse(json["lastcheckoktime"]),
      lastcheckoktimeIso8601: json["lastcheckoktime_iso8601"] == null ? null : DateTime.parse(json["lastcheckoktime_iso8601"]),
      lastlocalchecktime: json["lastlocalchecktime"] == null ? null : DateTime.parse(json["lastlocalchecktime"]),
      lastlocalchecktimeIso8601: json["lastlocalchecktime_iso8601"] == null ? null : DateTime.parse(json["lastlocalchecktime_iso8601"]),
      clicktimestamp: json["clicktimestamp"] == null ? null : DateTime.parse(json["clicktimestamp"]),
      clicktimestampIso8601: json["clicktimestamp_iso8601"] == null ? null : DateTime.parse(json["clicktimestamp_iso8601"]),
      clickcount: json["clickcount"],
      clicktrend: json["clicktrend"],
      sslError: json["ssl_error"],
      geoLat: json["geo_lat"]?.toDouble(),
      geoLong: json["geo_long"]?.toDouble(),
      hasExtendedInfo: json["has_extended_info"],
  );
    
  @override
  List<Object?> get props => [
    changeuuid,
    stationuuid,
    serveruuid,
    name,
    url,
    urlResolved,
    homepage,
    favicon,
    tags,
    country,
    countrycode,
    iso31662,
    state,
    language,
    languagecodes,
    votes,
    lastchangetime,
    lastchangetimeIso8601,
    codec,
    bitrate,
    hls,
    lastcheckok,
    lastchecktime,
    lastchecktimeIso8601,
    lastcheckoktime,
    lastcheckoktimeIso8601,
    lastlocalchecktime,
    lastlocalchecktimeIso8601,
    clicktimestamp,
    clicktimestampIso8601,
    clickcount,
    clicktrend,
    sslError,
    geoLat,
    geoLong,
    hasExtendedInfo
  ];
}

