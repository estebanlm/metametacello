Class {
	#name : 'BaselineOfMetaMetacello',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfMetaMetacello',
	#package : 'BaselineOfMetaMetacello'
}

{ #category : 'baselines' }
BaselineOfMetaMetacello >> baseline: spec [
	<baseline>

	spec for: #comon do: [ 
		spec package: 'MetaMetacello' ]
]
