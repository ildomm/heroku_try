Accomplished:
	Two app, one responsable by create data, called client app, and send it to the other one. The second app, called backend, have to receive data and persist it in database. After this the backend must to expose all of those collected information, it includes information about contacts and they related events.

No auth required

Client app:
	https://shielded-ravine-84058.herokuapp.com/

Backend app:
	https://quiet-journey-81463.herokuapp.com/
	
	
Implementation details:
	- Using a relational database in backend
	- Using workers to receive and process received data. queue_adapter = sidekiq
	
Assumptions:
	- Relations database isn't the best choice to this case of problem in real world, but is good enough to prove the point in this code challenge.
	- To be able to handle a real world problem, receiving millions of events by minute, I would be opting by save this data in an nosql database, or even direct in flat files to later analysis.
	- This actual implementation is only saving the basic information required, but in real world problem could be better persist too another details like IP, browser information.