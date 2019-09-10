"
I'm a command use to add bookmark
"
Class {
	#name : #FDAddBookmarkCommand,
	#superclass : #CmCommand,
	#category : #'NewTools-FileDialog-Commands'
}

{ #category : #testing }
FDAddBookmarkCommand >> canBeExecuted [
	^ self context selectedEntry isDirectory
]

{ #category : #executing }
FDAddBookmarkCommand >> execute [
	| fileReference |
	fileReference := self context selectedEntry.
	self context owner bookmarks add: (FDBookmark name: fileReference basename location: fileReference icon: nil).
	self flag: #todo.	"We can do better here."
	self context owner bookmarksTreeTable roots: self context owner bookmarks
]

{ #category : #initialization }
FDAddBookmarkCommand >> initialize [
	super initialize.
	self
		basicName: 'Add to bookmarks';
		basicDescription: 'Add the selected file to the bookmarks.'
]