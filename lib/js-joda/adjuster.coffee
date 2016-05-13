
startOfBusinessDayAdjuster = 
    adjustInto: (temporal) ->
        temporal

endOfBusinessDayAdjuster = 
    adjustInto: (temporal) ->
        temporal

nextFriday13thAdjuster =
    adjustInto: (temporal) ->
        temporal
        
module.exports = {
    startOfBusinessDayAdjuster
    endOfBusinessDayAdjuster
    nextFriday13thAdjuster
}