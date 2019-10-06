# NewsArticle
## Requirements:
* iOS 12.0+
* Xcode 10.2.1
* Swift 5.0

## Compatibility
This demo is expected to be run using Swift 5.0 and Xcode 10.2.1

## Objective:
This is a simple Demo project which aims to display weather information using MVVM pattern in Swift.
* This project was intended to work as a  weather information demo projects for iOS using Swift. 
* The demo uses the [News API](https://newsapi.org) since it is well-maintained API which returns information in a JSON format.
* The goal is to create a News Feed app which gives a user regularly-updated news from the internet related to a particular topic, person, or location.
* Use of UITableViewController to display News information.

## Instructions:
* On `master` branch there is a basic app, and on 
* On `features/MVVM+C+RxSwift` branch there is a MVVM with coordinator app, and on 
* On `features/MVVM+RxSwift` branch there is basic MVVM app.

## MVVM-C iOS app architecture pattern
### Coordinators:
It is a combination of the Model-View-ViewModel architecture, plus the Coordinator pattern.

We can use storyboards but we do not use segues or any other kind of relationships that we can create using interface builder. The reason for this is that the Coordinator is going to be responsible for handling the navigation and relationships between ViewController’s.

![Alt text](/ScreenShots/MVVM-C.png?raw=true "MVVM-C iOS app architecture pattern")

### What is a Coordinator?
This is the last part of this architecture’s name but I think it’s the most important part. If you can only implement one part of this architecture as a whole I would recommend the you implement this pattern, as I think it has incredible potential to improve your overall application structure.
A coordinator is an object (Class type in Swift) which has the sole responsibility, as it’s name implies, to coordinate the App’s navigation. Basically which screen should be shown, what screen should be shown next, etc.
This basically means that the coordinator has to:
Instantiate ViewController’s & ViewModel’s
Instantiate & Inject dependencies into the ViewController’s and ViewModel’s
Present or push ViewController’s onto the screen

### Why use a coordinator?
Coordinators are a great tool because they free our ViewController’s from a responsibility that they should not have. This helps us adhere to the single responsibility principle, which makes our ViewController’s much leaner and easier to re-use.
A ViewController should not know what ViewController came before it, which one should come next, or what dependencies it should pass on. It should just be a “dumb” wrapper around the View/Subviews on the screen, and handle only UIKit related stuff. Any action regarding navigation on the ViewController should be sent up to the Coordinator for proper handling.

### What is a ViewModel?
Take a typical view controller and split it into two parts. On one side leave all of the UIKit/UIViewController specific methods and everything that deals directly with views and subviews. And on the the other side put everything else, all of your business logic; i.e. network requests, validation, preparing model data for presentation, etc…
So basically, the former part (UIKit stuff) will remain, as it should, in the view controller. Everything else, all of app specific business logic, will now be in the ViewModel.
This separation helps the view controller adhere to the single responsibility principle. Now the view controller which is a part of UIKit as it’s a UIViewController subclass only deals with UIKit stuff. Handling rotation, view loading, constraints, adding subviews, target actions, etc.
This leaves the ViewModel totally clear of UIKit land. Which let’s it focus on the core business logic, adhering to SRP. This makes it much easier to reason about and to test, among other things.
The ViewController will have a one-to-one relationship with the ViewModel. There will be one ViewModel per ViewController, and the ViewController will own it’s ViewModel. By that I mean that it will own a strong reference to it’s ViewModel, but it will not create it itself, it will get passed on to it via dependency injection. In our case, it will get created by the Coordinator and passed on to the ViewController.