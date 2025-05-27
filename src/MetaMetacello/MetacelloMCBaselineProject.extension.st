Extension { #name : 'MetacelloMCBaselineProject' }

{ #category : '*MetaMetacello' }
MetacelloMCBaselineProject >> lockBaselines [

	self projectAttributes: (self projectAttributes copyWith: #lockAll)
]
