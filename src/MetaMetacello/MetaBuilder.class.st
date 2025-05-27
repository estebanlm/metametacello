Class {
	#name : 'MetaBuilder',
	#superclass : 'Object',
	#instVars : [
		'meta',
		'elements'
	],
	#category : 'MetaMetacello',
	#package : 'MetaMetacello'
}

{ #category : 'instance creation' }
MetaBuilder class >> on: aMetaMetacello [

	^ self new meta: aMetaMetacello
]

{ #category : 'scripting' }
MetaBuilder >> baseline: aName with: aBlock [

	self 
		push: (MetaBaseline newName: aName)
		during: aBlock
]

{ #category : 'scripting' }
MetaBuilder >> doNotLockBaselines [

	self meta doNotLockBaselines
]

{ #category : 'accessing' }
MetaBuilder >> elements [

	^ elements
]

{ #category : 'initialization' }
MetaBuilder >> initialize [ 

	super initialize.
	elements := OrderedCollection new
]

{ #category : 'scripting' }
MetaBuilder >> loads: anArrayOrString [

	self peek loads: anArrayOrString
]

{ #category : 'scripting' }
MetaBuilder >> lockBaselines [

	self meta lockBaselines
]

{ #category : 'accessing' }
MetaBuilder >> meta [

	^ meta
]

{ #category : 'accessing' }
MetaBuilder >> meta: anObject [

	meta := anObject
]

{ #category : 'private' }
MetaBuilder >> peek [

	^ elements last
]

{ #category : 'private' }
MetaBuilder >> push: aMetaObject [

	elements add: (aMetaObject 
		meta: self meta; 
		yourself)
]

{ #category : 'private' }
MetaBuilder >> push: anElement during: aBlock [
	
	self push: anElement.
	aBlock value
]

{ #category : 'scripting' }
MetaBuilder >> repository: aName [

	self peek repository: aName
]
