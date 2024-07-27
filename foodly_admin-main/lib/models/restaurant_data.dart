
import 'dart:convert';

ResaurantData resaurantDataFromJson(String str) => ResaurantData.fromJson(json.decode(str));


class ResaurantData {
    final Data data;
    final int ordersTotal;
    final int cancelledOrders;
    final double revenueTotal;
    final int processingOrders;
    final RestaurantToken restaurantToken;

    ResaurantData({
        required this.data,
        required this.ordersTotal,
        required this.cancelledOrders,
        required this.revenueTotal,
        required this.processingOrders,
        required this.restaurantToken,
    });

    factory ResaurantData.fromJson(Map<String, dynamic> json) => ResaurantData(
        data: Data.fromJson(json["data"]),
        ordersTotal: json["ordersTotal"],
        cancelledOrders: json["cancelledOrders"],
        revenueTotal: json["revenueTotal"]?.toDouble(),
        processingOrders: json["processingOrders"],
        restaurantToken: RestaurantToken.fromJson(json["restaurantToken"]),
    );

}

class Data {
    final String id;
    final String title;
    final String time;
    final String imageUrl;
    final String owner;
    final String code;
    final bool isAvailable;
    final bool pickup;
    final bool delivery;
    final List<dynamic> foods;
    final String logoUrl;
    final int rating;
    final String ratingCount;
    final String verification;
    final String verificationMessage;
    final double earnings;

    Data({
        required this.id,
        required this.title,
        required this.time,
        required this.imageUrl,
        required this.owner,
        required this.code,
        required this.isAvailable,
        required this.pickup,
        required this.delivery,
        required this.foods,
        required this.logoUrl,
        required this.rating,
        required this.ratingCount,
        required this.verification,
        required this.verificationMessage,
        required this.earnings,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["_id"],
        title: json["title"],
        time: json["time"],
        imageUrl: json["imageUrl"],
        owner: json["owner"],
        code: json["code"],
        isAvailable: json["isAvailable"],
        pickup: json["pickup"],
        delivery: json["delivery"],
        foods: List<dynamic>.from(json["foods"].map((x) => x)),
        logoUrl: json["logoUrl"],
        rating: json["rating"],
        ratingCount: json["ratingCount"],
        verification: json["verification"],
        verificationMessage: json["verificationMessage"],
        earnings: json["earnings"],
    );

}

class RestaurantToken {
    final String id;
    final String fcm;

    RestaurantToken({
        required this.id,
        required this.fcm,
    });

    factory RestaurantToken.fromJson(Map<String, dynamic> json) => RestaurantToken(
        id: json["_id"],
        fcm: json["fcm"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "fcm": fcm,
    };
}
