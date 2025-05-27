Class {
	#name : 'MetaElement',
	#superclass : 'Object',
	#instVars : [
		'meta'
	],
	#category : 'MetaMetacello',
	#package : 'MetaMetacello'
}

{ #category : 'private' }
MetaElement >> meta [
	
	^ meta
]

{ #category : 'private' }
MetaElement >> meta: aMetaMetacello [

	meta := aMetaMetacello	
]
