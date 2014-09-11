{expect} = require('chai')
isPalindrome = require('./palindrome-check')

check = (str, expectedResult) ->
    expect(isPalindrome(str)).to.equal(expectedResult)

NON_WORDS = ',.?! '

POSITIVES = [
    'f'
    'ü'
    '?'
    'Onno'
    'Reliefpfeiler'
    'esse'
    'nennen'
    'neppen'
    '!neppen!'
    'neppen!'
    'üKkü'
    'Erika feuert nur untreue Fakire'
    'üpü'
    '楚人楚'
    '\u2764'
    '\u1F60'
    'usu\uD8FF\uDC00usu'
    '\uD8FF\uDC00usu\uD8FF\uDC00'
    '\uFFFFusu\uFFFF'
]

NEGATIVES = [
    'ka'
    'kü'
    'küKü'
    'foo'
    'bar'
    'necken'
    'foo bar'
    'Erika feuert nur treue Fakire'
    '\uD8FF\uDC00usu\uD8FF\uDC01'
    '\uFFFFusu\uFFF0'
]

describe 'palindrome-check', ->
    it 'should not accept a null value as palindrome', (done) ->
        check null, false
        done()

    it 'should not accept an Object value as palindrome', (done) ->
        check {}, false
        done()

    it 'should not accept an Array value as palindrome', (done) ->
        check [], false
        done()

    it 'should accept empty string as palindrome', (done) ->
        check '', true
        done()

    POSITIVES.forEach (s) ->
        it "should accept '#{s}' as palindrome", (done) ->
            check s, true
            done()

    NEGATIVES.forEach (s) ->
        it "should not accept '#{s}' as palindrome", (done) ->
            check s, false
            done()

    p = POSITIVES[0]
    NON_WORDS.split('').forEach (s) ->
        it "should accept palindrome '#{p}' and non-word character '#{s}' as palindrome", (done) ->
            check "#{p}#{s}", true
            done()


