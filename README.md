# Traffic Light Code Challenge

### Summary:
Create a mobile app that simulates a traffic light.


## Requirements:

- The app needs 2 screens.
  1.  A screen for the stop light with a button to restart the cycle and
  2.  A screen to show the history of light changes (event name and timestamp)
and restart button presses.
  - Example:
    - *Restart Pressed &emsp; &emsp; &emsp; &ensp; Tue, 28 Jun 2022 16:52:04 EST*
    - *Light Changed - Yellow &emsp; Tue, 28 Jun 2022 16:55:04 EST*

- The traffic light (from top to bottom) has a red, yellow, and green light.
- The traffic light should continuously cycle through the different lights in the
following **order and duration**:
  1. Green for 5 seconds
  2. Yellow for 2 seconds
  3. Red for 4 seconds
- Implement a simple database solution to support storing the history records.
- The “Restart” button should stop/interrupt the current cycle and reset the traffic
light, starting over.

## Requirements Assumptions:

1.  **Saving to database**: The requirements do not specify when or how the stoplight's history record
should be saved to the database. Currently, the user must tap the "save" button to save the 
history record to the database. When the "save" button is tapped any currently saved history is
overwritten with the entire stoplight history for the current run of the app. Previosly saved history
is displayed to the user in the log -> preview tab. Note: the previously saved data is only updated
on app launch.

2.  **Initial stoplight state**: The stoplight begins in the "green" state. Since this state is neither
a restart or light change, the state is not recorded in the stoplight's history. Accordingly, all 
stoplight histories will begin with either a restart or a "Light Change - Yellow."

## Future Improvements:

1.  **Persisting favorite events**: Currently the app uses UserDefaults to persist favorite events and
does not scale well. A user who favorites hundreds or thousands of events will eventually run into 
issues with this implementation. Users are also unable to un-favorite events that do not appear in
their search results. Because of this, a users persisted favorited events can grow silently (e.g. events
that are in the past but that were not un-favorited will remain in the UserDefaults).
2.  **View reusability**: Some views should be refactored to be more reusable should the scope of the
project expand. For example, the struct ToggleFavoriteView could be more easily reused if its current
dependency on the EventsViewModel was removed. One way to remove this dependency would be to
initialize the ToggleFavoriteView with a new closure that would be called on the tap gesture.
3.  **Requesting events**: The app does not attempt to limit the number of network requests that are 
made in quick succession. Refactoring the app to use Combine's 'switchToLatest' operator would
help eliminate stale requests.
4.  **Query text**: The user text is currently unmodified before being used in the api call. This should 
be changed to improve search functionality for the user. For example, currently when a user types a 
query with a space, the api returns an empty result because spaces are not supported. The query should
be modified in the app to replace or remove spaces before being sent to the api.


## App Screenshots:
