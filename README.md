# e_shop

e_shop is an e-commerce Flutter application.

# Building and Running the Flutter Application

## Prerequisites:
Before you begin, ensure you have the following installed:
- **Flutter SDK:** Follow the official Flutter installation instructions for your operating system.
- **Dart SDK:** Flutter requires the Dart SDK. It's included with the Flutter SDK, so you don't need to install it separately.
- **Android Studio/VS code or Xcode:** Depending on whether you're targeting Android or iOS, you'll need either Android Studio/VS code or Xcode installed.
- **Flutterfire:** Flutterfire should be set up to create and link the Firebase project to your Flutter application.
- **Firebase Console Account:** Your Firebase console should be setup so that you can use Firebase services such as authentication, cloud firestore, and Firebase Remote Config.

## Getting Started:
1. Clone the repository:
	```
	git clone https://github.com/shivangsorout/e_shop
	```
2. Navigate to the project directory:
	```
	cd <project_directory>
	```
3. Install dependencies:
	```
	flutter pub get
	```
## Setting up Firebase:
- Enable **Authentication** through email/password.
- Enable **Cloud Firestore** database.
- Enable Firebase **Remote Config** service and add the following boolean:
  ```
  displayDiscountedPrice
  ```

## Running the Application:
- **Android**   
Ensure you have an Android device connected via USB or an Android emulator running.   

- Run the command in terminal:
 ```
 flutter run
 ```
- **iOS**   
Ensure you have a macOS machine with Xcode installed.   

- Run the command in terminal:
 ```
 flutter run
 ```

## Features implemented:
### Expected Features:
 - [x] Firebase Authentication (email only)
 - [x] Collecting details (name, email) [Storing details collected in Firestore in user
collection]
 - [x] A products feed showing the all the products from
(https://dummyjson.com/products)
 - [x] The products from the API will have a discountPercentage field, you will
need to use discountPercentage to calculate the discountedPrice from the
actual price field and display it accordingly in the UI.
 - [x] Create a boolean in Firebase Remote Config to decide whether we display
the discountedPrice or the original price.

### Must Have Features:
 - [x] Flutter >= v2.2.0
 - [x] Error Handling for Backend Services
 - [x] Form validation
 - [x] State management [Provider only]

### Bonus Features:
 - [x] Keep the app size as small as possible
   - Reduced the app size by minimizing the use of dependencies by only using the required Firebase dependencies, provider, and 2 more dependencies.
 - [x] Following the latest design guidelines
   - **Responsive and Adaptive Layouts:** used Flexible, Expanded and MediaQuery.
   - **Performance Optimizations:** used const constructors and State management for better performance.
 - [x] Follow any well-known architectural pattern
   - Used MVVM(Model, View and View Model) architecture.
 - [x] Surprise us with your creativity!
   - Created two extra screens in the authentication part forgot password screen and the verify email screen.
   - Created a product detail screen where I am showing some extra details about the product such as reviews, ratings, etc.
 - [x] Use third-party dependencies
   - Used flutter_rating_bar to show the rating
   - Used timeago for showing date.
