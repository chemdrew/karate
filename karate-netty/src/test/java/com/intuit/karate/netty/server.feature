Feature:

Background:
* def cats = []
* def nextId = call read('increment.js')
* configure cors = true

Scenario: pathMatches('/v1/cats') && methodIs('post')
    * def cat = request
    * set cat.id = nextId()
    * set cats[] = cat
    * def response = cat

Scenario: pathMatches('/v1/cats') && methodIs('get')
    * def response = cats

Scenario: pathMatches('/v1/cats/{id}') && methodIs('get')
    * def id = pathParams.id
    * def response = cats[id-1]

