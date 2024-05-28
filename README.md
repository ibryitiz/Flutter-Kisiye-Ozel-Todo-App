# Flutter Todo Uygulaması

[![GitHub lisansı](https://img.shields.io/badge/lisans-MIT-blue.svg)](https://github.com/YOUR_GITHUB_USERNAME/YOUR_REPO_NAME/blob/master/LICENSE)

Bu proje, Flutter kullanarak geliştirilmiş modern ve kullanıcı dostu bir Todo uygulamasıdır. Firebase Auth ile kullanıcı doğrulaması, Firestore ile veri depolama ve Provider ile durum yönetimi özellikleri içerir.

## Özellikler

* **Kullanıcı Doğrulaması:** Firebase Auth ile güvenli kullanıcı girişi ve kaydı.
* **Veri Depolama:** Firestore ile Todo öğelerinin gerçek zamanlı senkronizasyonu ve güvenli depolanması.
* **Durum Yönetimi:** Provider ile uygulama genelinde Todo verilerinin etkili bir şekilde yönetimi.
* **Kullanıcı Dostu Arayüz:** Modern ve sezgisel tasarım.

## Ekran Görüntüleri

 
https://github.com/ibryitiz/Flutter-Kisiye-Ozel-Todo-App/assets/156498407/c72aae2b-9359-4a78-830d-0c9ca276bd54 


## Kurulum

1. **Firebase Projesi Oluşturun:** Firebase konsolunda yeni bir proje oluşturun ve Android/iOS uygulamanızı ekleyin.
2. **Firebase Yapılandırması:** Firebase projesi yapılandırma dosyalarını (google-services.json, GoogleService-Info.plist) indirin ve projenizin uygun dizinlerine yerleştirin.
3. **Bağımlılıkları Ekleyin:** `pubspec.yaml` dosyasına aşağıdaki bağımlılıkları ekleyin ve `flutter pub get` komutunu çalıştırın.

```yaml
dependencies:
  flutter:
    sdk: flutter
  firebase_core: ^[latest_version]
  firebase_auth: ^[latest_version]
  cloud_firestore: ^[latest_version]
  provider: ^[latest_version]
