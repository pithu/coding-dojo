RomanNumeralParser = ->
    @lastLetter = null
    
    add = (nextLetter) ->
        @lastLetter = nextLetter unless @lastLetter?
        result = romanLetterValues[nextLetter].value[lastLetter]
        @lastLetter = nextLetter
        result | 0



parse = (romanNumeral) ->
    parser = new RomanNumeralParser()
    i = 0
    result = 0
    while(currentLetter = romanNumeral[i++])
        result += parser.add(currentLetter)
    return result



