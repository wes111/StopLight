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
a restart nor light change, the state is not recorded in the stoplight's history. Accordingly, all 
stoplight histories will begin with either a restart or a "Light Change - Yellow."

## Future Improvements:

1.  **Persisting stoplight histories**: Currently, the app uses UserDefaults to persist a stoplight's 
history. Since stoplight histories are usually not small, and can grow to hundreds, thousands, or more
records, this is not an ideal solution for a production app. Core Data is one alternative that could
replace the current database implementation as the requirements are expanded. Since the app's database 
logic is contained within a single class, future history storage refactors should require few, if any,
updates outside of this class. A Core Data solution would also make it easier to store multiple
stoplight histories, should this become a requirement in the future.

2.  **Date Formatting**: The date-time stamps in the app do not match the format specified in the
requirements. A date formatter should be added to the app so that the dates displayed to the user are 
in the correct format.

3.  **View Improvements**: Some view code is redundant and should be refactored. Additionally, the 
app currently lacks any significant color or design. The views should have designs and styling added 
to make for a more enjoyable user experience


## App Screenshots:
<img width="276" alt="Screen Shot 2022-08-28 at 11 41 30 PM" src="https://user-images.githubusercontent.com/60911262/187124725-d7150edc-1724-4ed5-ba7a-835ba0fb017b.png"> <img width="276" alt="Screen Shot 2022-08-28 at 11 41 39 PM" src="https://user-images.githubusercontent.com/60911262/187124726-57611aca-028a-4ac6-9312-e3d9cc8a3db9.png">
