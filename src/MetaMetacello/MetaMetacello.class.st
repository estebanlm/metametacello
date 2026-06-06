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

{ #category : 'instance-creation' }
MetaMetacello class >> update: aBlock [

	^ self new
		with: aBlock;
		update
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
	shouldLockBaselines := true
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

{ #category : 'loading' }
MetaMetacello >> update [
	"Unlock all baselines from the Metacello registry, then load them
	 (which locks again if shouldLockBaselines is enabled)."
	| builder |
	
	builder := MetaBuilder on: self.
	self baseline: builder.

	builder elements do: [ :each |
		Metacello new
			baseline: each name;
			unlock ].

	builder elements do: #load
]

{ #category : 'initialization' }
MetaMetacello >> with: aBlock [

	builderBlock := aBlock
]
