# Flutter Clean Architecture

Contoh project yang menerapkan flutter clean architecture

## Step by step

Langkah - langkah dalam menerapkan flutter clean architecture:

1. Foldering
   - Folder domain
   - Folder use_case
   - Folder data
   - Folder app
2. Masuk ke module domain
   - Buat entity / domain dari bussiness model dalam aplikasi
3. Masuk ke module data
   - Buat infrastructure (dio, baseUrl, endpoints)
   - Membuat repository
   - Daftarkan di service locator / dependency injector
4. Masuk ke module use_case
   - Membuat implementasi class UseCase dari packages flutter clean architecture
   - Daftarkan di service locator / dependency injector
5. Masuk ke module app
   - Membuat infra (Navigator)
   - Membuat Presenter, Controller dan Page yang mengextend dari abstract class package flutter clean architecture
   - Daftarkan di service locator / dependency injector
