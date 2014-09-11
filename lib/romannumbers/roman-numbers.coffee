ROMAN_LETTER_VALUES =
    'I': 1
    'V': 5
    'X': 10
    'L': 50
    'C': 100
    'D': 500
    'M': 1000

module.exports.parse = (romanNumeral) ->
    return 0 unless romanNumeral?
    lastLetterValue = ROMAN_LETTER_VALUES[romanNumeral[0]]
    i = 0
    result = 0
    while(currentLetterValue = ROMAN_LETTER_VALUES[romanNumeral[i++]])
        if lastLetterValue < currentLetterValue
            #substract
        else
            result += currentLetterValue

    if i < romanNumeral.length or (i is romanNumeral.length and not currentLetterValue?)
        0
    else
        result | 0



