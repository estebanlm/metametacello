Class {
	#name : 'MetaMetacello',
	#superclass : 'BaselineOf',
	#instVars : [
		'builderBlock',
		'shouldLockBaselines'
	],
	#category : 'MetaMetacello',
	#package : 'MetaMetacello'
}

{ #category : 'instance creation' }
MetaMetacello class >> load: aBlock [

	^ self new 
		with: aBlock;
		load
]

{ #category : 'baselines' }
MetaMetacello >> baseline: spec [

	builderBlock value: spec
]

{ #category : 'accessing' }
MetaMetacello >> doNotLockBaselines [

	shouldLockBaselines := false
]

{ #category : 'initialization' }
MetaMetacello >> initialize [ 

	super initialize.
	shouldLockBaselines := false
]

{ #category : 'installing' }
MetaMetacello >> load [
	| builder |

	builder := MetaBuilder on: self.
	self baseline: builder.
	builder elements do: #load
]

{ #category : 'accessing' }
MetaMetacello >> lockBaselines [

	shouldLockBaselines := true
]

{ #category : 'testing' }
MetaMetacello >> shouldLockBaselines [

	^ shouldLockBaselines
]

{ #category : 'initialization' }
MetaMetacello >> with: aBlock [

	builderBlock := aBlock
]
