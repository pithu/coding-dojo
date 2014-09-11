{expect} = require 'chai'
{parse} = require './roman-numbers'

describe 'roman number parser', ->
    it 'should return the right value for a valid roman number with one letter', ->
        expect(parse('I')).to.be.equal 1
        expect(parse('V')).to.be.equal 5
        expect(parse('X')).to.be.equal 10
        expect(parse('L')).to.be.equal 50
        expect(parse('C')).to.be.equal 100
        expect(parse('D')).to.be.equal 500
        expect(parse('M')).to.be.equal 1000

    it 'should return 0 if no valid or at least one non valid character is contained in a string', ->
        expect(parse('')).to.be.equal 0
        expect(parse('F')).to.be.equal 0
        expect(parse('FOO')).to.be.equal 0
        expect(parse('MMF')).to.be.equal 0
        expect(parse('XXFOO')).to.be.equal 0
        expect(parse('HXX')).to.be.equal 0
        expect(parse(0)).to.be.equal 0
        expect(parse()).to.be.equal 0
