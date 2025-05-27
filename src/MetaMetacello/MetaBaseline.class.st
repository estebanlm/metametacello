Class {
	#name : 'MetaBaseline',
	#superclass : 'MetaElement',
	#instVars : [
		'name',
		'repository',
		'loads'
	],
	#category : 'MetaMetacello',
	#package : 'MetaMetacello'
}

{ #category : 'instance creation' }
MetaBaseline class >> newName: aName [

	^ self new name: aName
]

{ #category : 'private' }
MetaBaseline >> forgetRepositoryIfExists [
	
]

{ #category : 'installing' }
MetaBaseline >> load [ 

	self forgetRepositoryIfExists.

	Metacello new
		baseline: self name;
		repository: self repository;
		ignoreImage;
		load: (self loads ifNil: [ #() ]).
		
	self shouldLockBaselines ifTrue: [  
		self lock: self name.
		(self class environment classNamed: ('BaselineOf', self name)) project version spec
			projectDo: [ :each | self lock: (each projectReference className allButFirst: 10) ] 
			packageDo: [ :each | ] 
			groupDo: [ :each | ] ]
]

{ #category : 'accessing' }
MetaBaseline >> loads [

	^ loads
]

{ #category : 'accessing' }
MetaBaseline >> loads: anObject [

	loads := anObject
]

{ #category : 'accessing' }
MetaBaseline >> lock: aString [ 

	Metacello new baseline: aString; lock
]

{ #category : 'accessing' }
MetaBaseline >> name [

	^ name
]

{ #category : 'accessing' }
MetaBaseline >> name: anObject [

	name := anObject
]

{ #category : 'accessing' }
MetaBaseline >> repository [

	^ repository
]

{ #category : 'accessing' }
MetaBaseline >> repository: anObject [

	repository := anObject
]

{ #category : 'private' }
MetaBaseline >> shouldLockBaselines [

	^ self meta shouldLockBaselines
]
