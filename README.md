This is just a small tool so I can load the projects (and branchs) I am working on in a batch.  
I ca do things like this: 

```smalltalk
MetaMetacello load: [ :spec | spec 
	lockBaselines;
	"Spec+Alexandria"
	baseline: 'Alexandrie' with: [ spec repository: 'github://pharo-graphics/Alexandrie:master' ];
	baseline: 'Spec2' with: [ spec 
		repository: 'github://pharo-spec/Spec:dev-3.0';
		loads: #(default 'Spec2-Alexandrie' 'Spec2-Adapters-Morphic-Alexandrie') ];
	"GTK"
	baseline: 'Gtk' with: [ spec 
		repository: 'github://pharo-spec/gtk-bindings:gtk4';
		loads: #(default 'Gtk-Utils') ];
	baseline: 'SpecGtk' with: [ spec 
		repository: 'github://pharo-spec/Spec-Gtk:gtk4';
		loads: #(default 'Spec-Gtk-Alexandrie') ];
	baseline: 'NewTools' with: [ spec 
		repository: 'github://pharo-spec/NewTools:dev-2.0';
		loads: #(default 'NewTools-Gtk') ];
	baseline: 'Stargate' with: [ spec 
	    repository: 'github://estebanlm/stargate:main' ];
	"CIG"
	baseline: 'CIG' with: [ spec 
	    repository: 'github://estebanlm/pharo-cig:main' ];
	baseline: 'OpenSSL' with: [ spec 
	    repository: 'github://estebanlm/pharo-openssl:main' ];
	baseline: 'Resvg' with: [ spec 
	    repository: 'github://estebanlm/pharo-resvg:main' ];
	baseline: 'Archive' with: [ spec 
	    repository: 'github://estebanlm/pharo-archive:main' ].
].

(Smalltalk classNamed: #GEnumeration) allSubclassesDo: #initializeEnumeration.
```

