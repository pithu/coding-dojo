ROMAN_LETTER_VALUES =
    'I': 1
    'V': 5
    'X': 10
    'L': 50
    'C': 100
    'D': 500
    'M': 1000

SUBTRACTION_FOLLOWERS =
    'I': ['V', 'X']
    'X': ['L', 'C']
    'C': ['D', 'M']

validSubtraction = (lastLetter, currentLetter) ->
    (SUBTRACTION_FOLLOWERS[lastLetter] or []).indexOf(currentLetter) isnt -1

romanLetter = (letter) ->
    if ROMAN_LETTER_VALUES[letter]?
        letter: letter
        value: ROMAN_LETTER_VALUES[letter]
    else
        undefined

module.exports.parse = (romanNumeral) ->
    return 0 unless romanNumeral?
    i = 0
    result = 0
    lastLetter = romanLetter(romanNumeral[0])
    while(currentLetter = romanLetter(romanNumeral[i++]))
        result += currentLetter.value
        if lastLetter.value < currentLetter.value
            return 0 unless validSubtraction(lastLetter.letter, currentLetter.letter)
            result -= 2 * lastLetter.value
        lastLetter = currentLetter

    if i > romanNumeral.length
        result
    else
        0



