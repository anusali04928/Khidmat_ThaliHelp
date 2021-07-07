class DietResp {
  bool success;
  int healthy;
  int unhealthy;
  int avoid;

  DietResp({this.success, this.healthy, this.unhealthy, this.avoid});

  DietResp.fromJson(Map<String, dynamic> json) {
    healthy = json['healthy'];
    unhealthy = json['unhealthy'];
    avoid = json['avoid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['healthy'] = this.healthy;
    data['unhealthy'] = this.unhealthy;
    data['avoid'] = this.avoid;
    return data;
  }
}
