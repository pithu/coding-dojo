{expect} = require 'chai'

{ LocalDate, LocalTime } = require 'js-joda'

{
    nextFriday13thAdjuster
    startOfBusinessDayAdjuster
    endOfBusinessDayAdjuster
} = require './adjuster'

describe 'TemporalAdjuster nextFriday13th', ->
    it 'should return next friday 13th for a LocalDate', ->
        firstOfMay = LocalDate.parse('2016-05-01')
        nextFriday13th = firstOfMay.with(nextFriday13thAdjuster);
        expect(nextFriday13th.toString()).equals('2016-05-13')

describe 'TemporalAdjuster startOfBusinessDay', ->
    it 'should return startOfBusinessDay for a LocalTime', ->
        expect(LocalTime.MIDNIGHT.with(startOfBusinessDayAdjuster).toString()).equals('09:30')

    it 'should return startOfBusinessDay for a LocalDateTime', ->

    it 'should return startOfBusinessDay for a ZonedDateTime', ->
