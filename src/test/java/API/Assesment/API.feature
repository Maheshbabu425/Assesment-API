Feature: API Assessment

Background:
* def json1 = read('test1.json')

Scenario: List of all dog breeds
Given url 'https://dog.ceo/api/breeds/list/all'
When method GET
Then status 200
Then print response '---List of all dog breeds---'
And match response == json1[0]

Scenario: Verify retriever is with in list
Given url  'https://dog.ceo/api/breeds/list/all'
When method GET
Then status 200
Then print response
And match response.message.retriever != null
Then print response

Scenario: List of sub breeds for "retriever"
Given url  'https://dog.ceo/api/breed/retriever/list'
When method GET
Then status 200
Then print response
And match response == json1[1]

Scenario: Random image / link for sub-breed "golden"
Given url 'https://dog.ceo/api/breed/retriever/golden/images/random'
When method GET
Then status 200
Then print response
 