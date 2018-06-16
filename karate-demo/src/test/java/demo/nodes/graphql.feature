Feature: test graphql end point using Nodes

Background:
* url demoBaseUrl + '/graphql'
# this live url should work if you want to try this on your own
# * url 'https://graphql-pokemon.now.sh'
* def Nodes = Java.type('demo.nodes.NodesHelper')

Scenario: simple graphql-nodes request
    # note the use of text instead of def since this is NOT json
    Given request { query: '#(Nodes.build("Pikachu"))' }
    When method post
    Then status 200

    # pretty print the response
    * print 'response:', response

    # json-path makes it easy to focus only on the parts you are interested in
    # which is especially useful for graph-ql as responses tend to be heavily nested
    # '$' happens to be a JsonPath-friendly short-cut for the 'response' variable
    * match $.data.pokemon.number == '025'

    # the '..' wildcard is useful for traversing deeply nested parts of the json
    * def attacks = get[0] response..special
    * match attacks contains { name: 'Thunderbolt', type: 'Electric', damage: 55 }
