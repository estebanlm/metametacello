Extension { #name : 'MetacelloBaselineProject' }

{ #category : '*MetaMetacello' }
MetacelloBaselineProject >> lockBaselines [

	self projectAttributes: (self projectAttributes copyWith: #lockAll)
]
