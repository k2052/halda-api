Items have a Temp

Items all come into a feed.
Items are unique to a user.

Showing up increases the item's temp by 1.
Adding an item to a collection creates a new CollectionItem and hides it from the feed.

Things will parsed and then sent out as SSEs. Clientside figures out how rto rank and sort things.

Bookmarks and links are seprate entities. Creating a bookmark is creating a bookmark from a link.

Add a new feed is adding a new twitter account.

Need a command that goes out and parses;

1. an RSS feed
2. a twitter feed

lets drop the twitter timeline and use rss for now

we are going to already be authenticated when we reach the API so api doesn't need login/registration handling.

I think we should spec everything out and then move to constructing the Firehose page.
Gradually adding functionality as we need it

TODO make sure we only return public bookmarks or bookmarks that belong to a user. Not a big deal right now
because they'd have to guess an entirely unqiue ID.
