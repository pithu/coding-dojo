{DayOfWeek, LocalTime} = require 'js-joda'

startOfBusinessDayAdjuster = (sob = LocalTime.of(9,30)) ->
    adjustInto: (temporal) ->
        temporal

endOfBusinessDayAdjuster = (eob = LocalTime.of(18,0)) ->
    adjustInto: (temporal) ->
        temporal

nextFriday13thAdjuster = ->
    adjustInto: (temporal) ->
        temporal
        
module.exports = {
    startOfBusinessDayAdjuster
    endOfBusinessDayAdjuster
    nextFriday13thAdjuster
}