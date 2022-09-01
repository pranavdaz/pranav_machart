import 'dart:ffi';

class Loc_Model {
    String address_1;
    String address_2;
    String alt_email;
    String category_id;
    String classification_id;
    String comm_email;
    String country_code;
    String distance;
    String district_id;
    String id;
    String image;
    String latitude;
    String longitude;
    String mobile;
    String name;
    String pincode;
    String place;
    String reservation_link;
    String std_code;
    String tariff_max_rate;
    String tariff_min_rate;
    String telephone_1;
    String telephone_2;
    String website;

    Loc_Model({required this.address_1, required this.address_2, required this.alt_email, required this.category_id, required this.classification_id, required this.comm_email, required this.country_code, required this.distance, required this.district_id, required this.id, required this.image, required this.latitude, required this.longitude, required this.mobile, required this.name, required this.pincode, required this.place, required this.reservation_link, required this.std_code, required this.tariff_max_rate, required this.tariff_min_rate, required this.telephone_1, required this.telephone_2, required this.website});

    factory Loc_Model.fromJson(Map<String, dynamic> json) {
        return Loc_Model(
            address_1: json['address_1'], 
            address_2: json['address_2'], 
            alt_email: json['alt_email'], 
            category_id: json['category_id'], 
            classification_id: json['classification_id'], 
            comm_email: json['comm_email'], 
            country_code: json['country_code'], 
            distance: json['distance'], 
            district_id: json['district_id'], 
            id: json['id'], 
            image: json['image'], 
            latitude: json['latitude'], 
            longitude: json['longitude'], 
            mobile: json['mobile'], 
            name: json['name'], 
            pincode: json['pincode'], 
            place: json['place'], 
            reservation_link: json['reservation_link'], 
            std_code: json['std_code'], 
            tariff_max_rate: json['tariff_max_rate'], 
            tariff_min_rate: json['tariff_min_rate'], 
            telephone_1: json['telephone_1'], 
            telephone_2: json['telephone_2'], 
            website: json['website'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['address_1'] = this.address_1;
        data['address_2'] = this.address_2;
        data['alt_email'] = this.alt_email;
        data['category_id'] = this.category_id;
        data['classification_id'] = this.classification_id;
        data['comm_email'] = this.comm_email;
        data['country_code'] = this.country_code;
        data['distance'] = this.distance;
        data['district_id'] = this.district_id;
        data['id'] = this.id;
        data['image'] = this.image;
        data['latitude'] = this.latitude;
        data['longitude'] = this.longitude;
        data['mobile'] = this.mobile;
        data['name'] = this.name;
        data['pincode'] = this.pincode;
        data['place'] = this.place;
        data['reservation_link'] = this.reservation_link;
        data['std_code'] = this.std_code;
        data['tariff_max_rate'] = this.tariff_max_rate;
        data['tariff_min_rate'] = this.tariff_min_rate;
        data['telephone_1'] = this.telephone_1;
        data['telephone_2'] = this.telephone_2;
        data['website'] = this.website;
        return data;
    }
}