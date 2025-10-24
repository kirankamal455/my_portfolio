import 'dart:convert';

class ProfileResponse {
  Profile data;

  ProfileResponse({required this.data});

  factory ProfileResponse.fromJson(Map<String, dynamic> json) {
    return ProfileResponse(
      data: Profile.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
    };
  }
}

class Profile {
  ProfileDetails profileDetails;
  List<Experience> experience;
  AboutMe aboutMe;
  List<ToolAndTech> toolsAndTech;
  List<Service> services;
  List<Project> projects;
  List<GetInTouch> getInTouch;
  List<String> interests;

  Profile({
    required this.profileDetails,
    required this.experience,
    required this.aboutMe,
    required this.toolsAndTech,
    required this.services,
    required this.projects,
    required this.getInTouch,
    required this.interests,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      profileDetails: ProfileDetails.fromJson(json['profile_details']),
      experience: (json['experience'] as List)
          .map((e) => Experience.fromJson(e))
          .toList(),
      aboutMe: AboutMe.fromJson(json['about_me']),
      toolsAndTech: (json['tools_and_tech'] as List)
          .map((e) => ToolAndTech.fromJson(e))
          .toList(),
      services: (json['services'] as List)
          .map((e) => Service.fromJson(e))
          .toList(),
      projects: (json['projects'] as List)
          .map((e) => Project.fromJson(e))
          .toList(),
      getInTouch: (json['get_in_touch'] as List)
          .map((e) => GetInTouch.fromJson(e))
          .toList(),
      interests: List<String>.from(json['interests']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'profile_details': profileDetails.toJson(),
      'experience': experience.map((e) => e.toJson()).toList(),
      'about_me': aboutMe.toJson(),
      'tools_and_tech': toolsAndTech.map((e) => e.toJson()).toList(),
      'services': services.map((e) => e.toJson()).toList(),
      'projects': projects.map((e) => e.toJson()).toList(),
      'get_in_touch': getInTouch.map((e) => e.toJson()).toList(),
      'interests': interests,
    };
  }
}

class ProfileDetails {
  String welcomeText;
  String firstName;
  String lastName;
  List<String> domain;
  String facebookUrl;
  String instaUrl;
  String linkedinUrl;
  String whatsappUrl;
  String githubUrl;

  ProfileDetails({
    required this.welcomeText,
    required this.firstName,
    required this.lastName,
    required this.domain,
    required this.facebookUrl,
    required this.instaUrl,
    required this.linkedinUrl,
    required this.whatsappUrl,
    required this.githubUrl,
  });

  factory ProfileDetails.fromJson(Map<String, dynamic> json) {
    return ProfileDetails(
      welcomeText: json['welcome_text'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      domain: List<String>.from(json['domain']),
      facebookUrl: json['facebook_url'],
      instaUrl: json['insta_url'],
      linkedinUrl: json['linkedin_url'],
      whatsappUrl: json['whatsapp_url'],
      githubUrl: json['github_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'welcome_text': welcomeText,
      'first_name': firstName,
      'last_name': lastName,
      'domain': domain,
      'facebook_url': facebookUrl,
      'insta_url': instaUrl,
      'linkedin_url': linkedinUrl,
      'whatsapp_url': whatsappUrl,
      'github_url': githubUrl,
    };
  }
}

class Experience {
  int count;
  String title;

  Experience({required this.count, required this.title});

  factory Experience.fromJson(Map<String, dynamic> json) {
    return Experience(
      count: json['count'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() => {'count': count, 'title': title};
}

class AboutMe {
  String title;
  String subTitle;

  AboutMe({required this.title, required this.subTitle});

  factory AboutMe.fromJson(Map<String, dynamic> json) {
    return AboutMe(
      title: json['title'],
      subTitle: json['sub_title'],
    );
  }

  Map<String, dynamic> toJson() => {'title': title, 'sub_title': subTitle};
}

class ToolAndTech {
  String label;
  String icon;

  ToolAndTech({required this.label, required this.icon});

  factory ToolAndTech.fromJson(Map<String, dynamic> json) {
    return ToolAndTech(
      label: json['label'],
      icon: json['icon'],
    );
  }

  Map<String, dynamic> toJson() => {'label': label, 'icon': icon};
}

class Service {
  String icon;
  String label;

  Service({required this.icon, required this.label});

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(icon: json['icon'], label: json['label']);
  }

  Map<String, dynamic> toJson() => {'icon': icon, 'label': label};
}

class Project {
  int id;
  String image;
  String title;
  String subtitle;
  List<String> keyFeatures;
  String downloads;
  String platform;
  double rating;
  String liveDemoUrl;

  Project({
    required this.id,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.keyFeatures,
    required this.downloads,
    required this.platform,
    required this.rating,
    required this.liveDemoUrl,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      id: json['id'],
      image: json['image'],
      title: json['title'],
      subtitle: json['subtitle'],
      keyFeatures: List<String>.from(json['key_features']),
      downloads: json['downloads'],
      platform: json['platform'],
      rating: (json['rating'] as num).toDouble(),
      liveDemoUrl: json['live_demo_url'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'image': image,
    'title': title,
    'subtitle': subtitle,
    'key_features': keyFeatures,
    'downloads': downloads,
    'platform': platform,
    'rating': rating,
    'live_demo_url': liveDemoUrl,
  };
}

class GetInTouch {
  String icon;
  String title;
  String subTitle;

  GetInTouch({required this.icon, required this.title, required this.subTitle});

  factory GetInTouch.fromJson(Map<String, dynamic> json) {
    return GetInTouch(
      icon: json['icon'],
      title: json['title'],
      subTitle: json['sub_title'],
    );
  }

  Map<String, dynamic> toJson() => {'icon': icon, 'title': title, 'sub_title': subTitle};
}

