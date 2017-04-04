Connector = require '../'

describe 'Connector', ->
  beforeEach (done) ->
    @sut = new Connector
    @sut.start {}, done

  afterEach (done) ->
    @sut.close done

  describe '->isOnline', ->
    it 'should yield running true', (done) ->
      @sut.isOnline (error, response) =>
        return done error if error?
        expect(response.running).to.be.true
        done()

  describe '->getResponse', ->
    describe 'when called with a config', ->
      beforeEach ->
        @sut.onConfig { options: { greeting: 'Howdy' } }

      it 'should return a response', ->
        response = @sut.getResponse { name: 'Peter' }
        expect(response).to.equal 'Howdy, Peter'
