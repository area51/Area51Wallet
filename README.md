# A51Wallet

**Application id: 1639288229**

## 1 - What architectural design pattern did you use and why?

As an overall architecture, I decided to separate the app into three modules.

Presentation:
---

UIViewController based classes, no dependency on any other module.

When talking about UI Architecture this module is using MVVM. Any architecture would do here as long as things are kept separated. In the end, it's a matter of team preference which UI architecture to use and I think MVVM is the simplest one to migrate to MVP, Viper, Clean, etc should the team decide. 

Views were created as ViewControllers, not a strong preference but this allowed me to easily build the app in a modular way and test one view at a time. It also allows doing some screenshot tests only on those views without a need to build the whole hierarchy.

Services: 
---

Objects to control access to external resources and all kinds of frameworks. 

No knowledge of the presentation module or the App itself.

The actual app. 
---

A simple DiContainer to hold all the app dependencies and a router to take care of the flows and also which dependencies are needed to start each flow.

The separation in those modules guarantees that the system works and can be tested independently, developers can work in parallel in different parts of a new feature and makes it clear what goes where.

## 2 - What would you improve if you had more time?

- Convert all services to async/await.

- Document the app and decisions.

- Add proper log to help debug.

- Spend more time investigating why the Ethereum transfer is not working. I was able to perform it with the Python web3 library but not with the iOS one.

- Spend more time understanding how to properly fetch ERC20 events. I'm pretty sure there are better ways to get only the transfer events.

- Add more unit tests, especially for the fetch erc20 transactions part that was the last and I left untested.

- Add a few integration tests, screenshot tests, and UI tests.

- Use a linter. Xcode 13 changed the way indentation works that I was used to working with. I still haven't decided how to indent the open curly braces.

- Have some loading state, empty state, and error state for the user.

- Allow refresh as pull to refresh, tap view to refresh, and other methods.

- Use Diffable Data Source.

- Use SwiftUI/Combine/MainActor... new things, decided not to go with this time.

## 3 - What would you like to highlight in the code?

The architectural decision as a way to enforce the boundaries between all parts of the system with the goal of long-term maintainability and quality.

Easy of test with almost everything being based on protocols and not concrete types with the exception of the Router and DiContainer that are ok to be concrete types for this exercise since they are at the base of the app and they are only accessible by AppDelegate. 

## 4 - How could you make the views update with new incoming transfers?

A good first step would be to instead of fetching all events from block 0 to earliest, fetch one block at a time or a limited amount of blocks. Then once the earliest block is reached use a timer to check if a new block exists.

With that done instead of returning the array of fetched transactions (TransactionInfo) at the end, return a stream of transactions as soon as they are available.

Use Combine/RxSwift, a closure, or even a delegate to refresh the view with the new transactions. Preferably Combine to use modern Swift. 
