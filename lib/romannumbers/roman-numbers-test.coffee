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

    it 'should return the right decimal value for roman numbers without subtraction rules', ->
        expect(parse('III')).to.be.equal 3
        expect(parse('XV')).to.be.equal 15
        expect(parse('MMXIII')).to.be.equal 2013
        expect(parse('MDCLXVI')).to.be.equal 1666

    it 'should return the right decimal value for roman numbers with subtraction rules', ->
        expect(parse('IV')).to.be.equal 4
        expect(parse('XIV')).to.be.equal 14
        expect(parse('DIX')).to.be.equal 509
        expect(parse('MXL')).to.be.equal 1040
        expect(parse('MXC')).to.be.equal 1090
        expect(parse('CD')).to.be.equal 400
        expect(parse('CM')).to.be.equal 900
        expect(parse('MMXIV')).to.be.equal 2014

    it 'should return 0 for roman numbers with invalid subtraction rules', ->
        expect(parse('IM')).to.be.equal 0
        expect(parse('IIM')).to.be.equal 0
        expect(parse('MIL')).to.be.equal 0
        expect(parse('VX')).to.be.equal 0
        expect(parse('VM')).to.be.equal 0

