Class {
	#name : #BaselineOfGt4Fedwiki,
	#superclass : #BaselineOf,
	#category : #BaselineOfGt4Fedwiki
}

{ #category : #loading }
BaselineOfGt4Fedwiki class >> loadLepiter [
	IceRepository registry  
		detect: [ :aRepository |
			aRepository name = 'gt4fedwiki' ]
		ifFound: [ :aRepository | 
			| defaultDatabase currentProperties |
			defaultDatabase := LeDatabasesRegistry defaultLogicalDatabase.
			currentProperties := defaultDatabase properties.
			currentProperties addRegisteredDirectory: aRepository repositoryDirectory / 'lepiter'.
			defaultDatabase reload ]
		ifNone: [
			self inform: 'Repository not found.' ]
]

{ #category : #baseline }
BaselineOfGt4Fedwiki >> baseline: spec [
	<baseline>
		^ spec for: #common do: [
			spec package: 'Gt4Fedwiki'
		]
]
