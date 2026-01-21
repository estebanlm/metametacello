Extension { #name : 'MetacelloProject' }

{ #category : '*MetaMetacello' }
MetacelloProject >> lockBaselines [

	self projectAttributes: (self projectAttributes copyWith: #lockAll)
]
