{expect} = require 'chai'

{ LocalDate, LocalTime } = require 'js-joda'

nextFriday13thAdjuster = require('./adjuster').nextFriday13thAdjuster()
startOfBusinessDayAdjuster = require('./adjuster').startOfBusinessDayAdjuster()
endOfBusinessDayAdjuster = require('./adjuster').endOfBusinessDayAdjuster()

describe 'TemporalAdjuster nextFriday13th', ->
    it 'should return next friday 13th for a LocalDate', ->
        expect(LocalDate.parse('2016-05-01').with(nextFriday13thAdjuster).toString()).equals('2016-05-13')
        expect(LocalDate.parse('2016-05-14').with(nextFriday13thAdjuster).toString()).equals('2017-01-13')

describe 'TemporalAdjuster start/endOfBusinessDay', ->
    it 'should return start/endOfBusinessDay for a LocalTime', ->
        expect(LocalTime.MIDNIGHT.with(startOfBusinessDayAdjuster).toString()).equals('09:30')
        expect(LocalTime.MIDNIGHT.with(endOfBusinessDayAdjuster).toString()).equals('18:00')

    it 'should return startOfBusinessDay for a LocalDateTime', ->

    it 'should return startOfBusinessDay for a ZonedDateTime', ->
