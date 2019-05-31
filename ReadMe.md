# GenericTableViewWithRx

Suppose you have a `UITableView` with multiple type of cells, So while loading the sections we use conditional flow to find out that which cell sholud be loaded for the current `IndexPath`. Sometimes this Conditional flow can be huge which is not easy to read and maintain as well. In order to reduce this Bloated code we can design our UITableView in such a way that it get rid of the conditional flow. For this purpose `GenericTableViewWithRx` came out as saviour.
Again note that `GenericTableViewWithRx` is just a pattern which you can follow to design you TableView.