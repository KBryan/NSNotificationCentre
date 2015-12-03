# NSNotificationCentre
A Simple Example of using NSNotifications

iOS notifications are a simple and powerful way to send data in a loosely coupled way. This is done in the following way, the `sender` of a notification doesn't have to care about who (if anyone) receives the `notification`, it just posts it out there to the rest of the app and it could be picked up by lots of things or nothing depending on your app's state.

As a basic example, you might want various parts of your app to do some work when the user logs in – you might want some views to refresh, you might want a database to update itself.

An example of how to do this is a follows, just post a notification name like this:

```
let nc = NSNotificationCenter.defaultCenter()`
nc.postNotificationName("UpdateModel", object: nil)`
```

Note: it is preferable, for type safety, to define your notification names as static strings that belong to a class or struct or other global form so that you don't make a typo and introduce bugs. `Check out the accompanying source for an example.`

To register to catch a notification being posted, use this:

```
nc.addObserver(self, selector: "updateModel", name: "UpdateModel", object: nil)
```
That will call a updateModel() method when your notification is posted.
