NON_WORDS_CHARS = /[.,!?:;\s]/g
UTF16_CHAR_REGEX = /[\u0000-\uD7FF]|[\uD800-\uDBFF][\uDC00-\uDFFF]|[\uE000-\uFFFF]/g

module.exports = (palindrom) ->
    return false if not palindrom?
    return false if typeof palindrom isnt 'string'
    return true if palindrom.length < 2

    palindrom = palindrom.toLocaleLowerCase().replace NON_WORDS_CHARS, ''
    if palindrom is palindrom.match(UTF16_CHAR_REGEX).reverse().join('')
        return true
    else
        return false