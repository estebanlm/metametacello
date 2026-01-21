Class {
	#name : 'MetaBaseline',
	#superclass : 'MetaElement',
	#instVars : [
		'name',
		'repository',
		'loads',
		'className'
	],
	#category : 'MetaMetacello',
	#package : 'MetaMetacello'
}

{ #category : 'instance creation' }
MetaBaseline class >> newName: aName [

	^ self new name: aName
]

{ #category : 'accessing' }
MetaBaseline >> baseline: aString [

	self className: 'BaselineOf', aString
]

{ #category : 'accessing' }
MetaBaseline >> className [

	^ className ifNil: [ 'BaselineOf', self name ]
]

{ #category : 'accessing' }
MetaBaseline >> className: aString [

	className := aString
]

{ #category : 'private' }
MetaBaseline >> forgetRepositoryIfExists [
	
]

{ #category : 'installing' }
MetaBaseline >> load [ 
	| fullBaselineName baselineName |
	
	self forgetRepositoryIfExists.
	self removeBaselineIfExists.

	fullBaselineName := self className.
	baselineName := fullBaselineName allButFirst: 10.

	"load"
	[ 
		Metacello new
			baseline: baselineName;
			repository: self repository;
			ignoreImage;
			onConflictUseIncoming;
			onDowngradeUseIncoming;
			load: (self loads ifNil: [ #() ]). ] 
	on: ProvideAnswerNotification, MCMergeOrLoadWarning 
	do: [ :notification | 
		notification resume: true ].
		
	"lock baselines"
	self shouldLockBaselines ifTrue: [  
		self lock: baselineName.
		(self class environment classNamed: fullBaselineName) project spec projects do: [ :each | 
				self lock: (each projectReference className allButFirst: 10) ] ]
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

{ #category : 'installing' }
MetaBaseline >> removeBaselineIfExists [
		
	"remove baseline to ensure is loaded"
	(self class environment classNamed: self className)
		ifNotNil: [ :aClass | aClass removeFromSystem ]
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
