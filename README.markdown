Inconsistent Cocoa Bindings
===========================

This is a minimum test case that exhibits Cocoa bindings becoming out of sync.

Description
-----------

This is a document-based application with two menu items that represent the collapsed state of the two subviews of a splitview in the active document. The menu items are bound to `Application` via the keypaths `mainWindow.windowController.document.isTopSubviewCollapsed` and `mainWindow.windowController.document.isBottomSubviewCollapsed`. The `isTopSubviewCollapsed:` and `isBottomSubviewCollapsed:` accessors on `Document` simply call `isSubviewCollapsed:` on `NSSplitView`. Two labels in the document view itself are bound for comparison to `File’s Owner` (i.e., `Document`) via the keypaths `isTopSubviewCollapsed` and `isBottomSubviewCollapsed` respectively.

Steps to reproduce
------------------

1. Build and run the application.
2. Click `File` ▸ `New`.
3. Click `View` ▸ `Top Pane`.
4. Click `View` ▸ `Bottom Pane`.
5. Click `View` ▸ `Top Pane`.
6. Click `View`.

Exhibited behavior
------------------

Both the `Top Pane` and `Bottom Pane` menu items are checked.

Expected behavior
-----------------

Only the `Bottom Pane` menu item should be checked, since the top pane of the splitview is currently collapsed. The labels in the document view bound directly to the same accessors show the correct values.

If you switch to another application, switch back, and then open the `View` menu, again, however, the bindings re-sync themselves and the menu items are in the correct state.