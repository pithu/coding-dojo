ROMAN_LETTER_VALUES =
    'I' :    1
    'IV':    4
    'V' :    5
    'IX':    9
    'X' :   10
    'XL':   40
    'L' :   50
    'XC':   90
    'C' :  100
    'CD':  400
    'D' :  500
    'CM':  900
    'M' : 1000

ROMAN_REGEX = /IV|IX|XL|XC|CD|CM|I|V|X|L|C|D|M|./g


module.exports.parse = (romanNumbers) ->
    if not romanNumbers? or typeof romanNumbers isnt 'string'
        return 0
    if not romanLetters = romanNumbers.match ROMAN_REGEX
        return 0

    result = 0
    lastValue = ROMAN_LETTER_VALUES[romanLetters[0]]
    for romanLetter in romanLetters
        letterValue = ROMAN_LETTER_VALUES[romanLetter]
        return 0 if not letterValue? or lastValue < letterValue
        lastValue = letterValue
        result += letterValue

    result



