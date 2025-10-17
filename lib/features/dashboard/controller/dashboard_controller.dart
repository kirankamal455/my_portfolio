import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';

import '../../../data/model/user_profile_response_model.dart';

class DashboardController {
  // Download from Firebase Storage
  Future<void> downloadFromFirebase() async {
    try {
      final ref = FirebaseStorage.instance.refFromURL(
        "gs://myportfolio-2b14b.appspot.com/dummy.pdf",
      );
      const oneMB = 1024 * 1024;
      final Uint8List? data = await ref.getData(oneMB);
      if (data != null) {
        log("File downloaded successfully (${data.lengthInBytes} bytes)");
      }
    } on FirebaseException catch (e) {
      log("Firebase Error: ${e.message}");
    }
  }

  // Save PDF from assets locally
  Future<void> savePdf() async {
    try {
      final status = await Permission.storage.request();
      if (!status.isGranted) {
        log("Permission denied");
        return;
      }

      final bytes = await rootBundle.load("assets/pdf/kiranResume.pdf");
      final buffer = bytes.buffer.asUint8List();
      final dir = await getExternalStorageDirectory();
      if (dir != null) {
        final file = File('${dir.path}/kiranResume.pdf');
        await file.writeAsBytes(buffer);
        log('PDF saved to ${file.path}');
      }
    } catch (e) {
      log("Error saving PDF: $e");
    }
  }

  // Mock user profile data
  UserProfileResponseModel mockUserProfile() {
    final List<Project> mockProjects = [
      Project(
        id: 1,
        title: "Federal Bank Certificate Portal",
        description:
        "A secure web portal for Federal Bank customers to easily access and download various certificates.",
        imageUrl:
        "https://i.postimg.cc/DwxMwLMj/Screenshot-2025-08-24-170920.png",
        techChips: ["Flutter", "GraphQL", "Hive"],
        features: [
          "Download Balance Certificates",
          "Loan Certificate Access",
          "Credit Card Statement Downloads",
          "Repayment Management",
          "Customer Login",
          "Branch Login"
        ],
        launchUrl:
        "https://accountopen.federalbank.co.in/CertificatePortal/Index",
        downloads: "100K+ downloads",
        platform: "Web",
        rating: 4.7,
      ),
      Project(
        id: 2,
        title: "Symphony",
        description:
        "Symphony is a modern e-commerce mobile app that allows users to browse products, place orders, and track deliveries.",
        imageUrl: "https://i.postimg.cc/9QLG7pV9/shared-image.jpg",
        techChips: ["Flutter", "Firebase", "Riverpod"],
        features: [
          "Place Orders",
          "Add to Cart",
          "Track Product Delivery",
          "Manage Wishlist"
        ],
        launchUrl: "https://lucidplus.com/lp-symphony.aspx",
        downloads: "200K+ downloads",
        platform: "Android & iOS",
        rating: 4.6,
      ),
      Project(
        id: 3,
        title: "Ensemble Manager",
        description:
        "Smart asset management app to track, audit, and control IT & physical assets across their lifecycle.",
        imageUrl:
        "https://images.pexels.com/photos/6476589/pexels-photo-6476589.jpeg?auto=compress&cs=tinysrgb&w=800",
        techChips: ["Flutter", "Bloc", "Firebase", "REST API", "QR Code"],
        features: [
          "End-to-End Asset Lifecycle Management",
          "AMC & Warranty Tracking",
          "Asset Onboarding & Deployment",
          "Accurate Asset Auditing & Compliance",
          "QR / Barcode Generation"
        ],
        launchUrl: "https://lucidplus.com/lp-ensemble.aspx",
        downloads: "50K+ enterprise users",
        platform: "Android, iOS, Web",
        rating: 4.6,
      ),
      Project(
        id: 4,
        title: "E-Wallet",
        description:
        "Secure e-wallet solution with support for QR payments, recurring billing, balance management, and strong security features.",
        imageUrl:
        "https://zmozkivkhopoeutpnnum.supabase.co/storage/v1/object/public/images/aeon.webp",
        techChips: ["Flutter", "GetX", "Dio", "MVC"],
        features: [
          "Balance & QR Payments",
          "Root Detection",
          "Bill Splitting",
          "Smart Notifications"
        ],
        launchUrl: "",
        downloads: "1M+ downloads",
        platform: "Android",
        rating: 3.8,
      ),
      Project(
        id: 5,
        title: "LP Customer Onboarding",
        description:
        "A digital onboarding app with face verification, document expiry tracking, and OCR-based detail extraction.",
        imageUrl:
        "https://zmozkivkhopoeutpnnum.supabase.co/storage/v1/object/public/images/aeon.webp",
        techChips: ["Flutter", "Dio", "Provider"],
        features: [
          "Face Detection with Head Movement Validation",
          "OCR-based Document Scanning",
          "Auto-fill Name, Address & DOB",
          "Document Expiry Management",
          "Secure Customer Onboarding"
        ],
        launchUrl: "",
        downloads: "500K+ downloads",
        platform: "Android & iOS",
        rating: 4.4,
      ),
      Project(
        id: 6,
        title: "Escort Kubota",
        description:
        "Plan trips, book hotels, and explore local experiences — all in one travel app.",
        imageUrl:
        "https://zmozkivkhopoeutpnnum.supabase.co/storage/v1/object/public/images//hxpert.webp",
        techChips: ["Flutter", "Supabase", "GetX"],
        features: [
          "Flight & Hotel Booking",
          "Local Guides",
          "Trip Itinerary",
          "Offline Maps"
        ],
        launchUrl: "",
        downloads: "750K+ downloads",
        platform: "Android",
        rating: 4.5,
      ),
      Project(
        id: 7,
        title: "FinanceX",
        description:
        "Personal finance app to manage expenses, analyze spending, and set budgets.",
        imageUrl:
        "https://zmozkivkhopoeutpnnum.supabase.co/storage/v1/object/public/images//hxpert.webp",
        techChips: ["Flutter", "Riverpod", "SQLite"],
        features: [
          "Budget Planner",
          "Spending Categories",
          "Visual Reports",
          "Secure Backup"
        ],
        launchUrl: "",
        downloads: "900K+ downloads",
        platform: "Android & iOS",
        rating: 4.8,
      ),
    ];

    return UserProfileResponseModel(
      name: "Kiran Kamal",
      address: "Puthuparmabil",
      phone: "+918113887254",
      email: "Kirankamal45@gmail.com",
      image: "https://example.com/images/john_doe.jpg",
      projects: mockProjects,
    );
}}
