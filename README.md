# Apex 5 Interactive Report Refresh with Pagination

Plugin Details:
- Name: Tree Search and Show
- Code: `TP.DA.IRREFRESHPAGE`
- Version: `v2.0`
- Apex compatibility: 5

Apex Interactive Reports have always supported a refresh, but never the ability to refresh the data while maintaining the pagination. That's really annoying when you're pretty sure things will remain the same - or even then you may not particulary care much since otherwise you'll get the "reset pagination" link.
Unfortunately the Apex team have as of yet not provided a way to allow us to do this in a declarative way, or by exposing a function in the IR widget. It's not really hard, it's all right there already and the only reason I can think of is because of the weird pagination-string they've been using over time. Still, it's easy enough to cover it up. We've been promised more open API's but it's just not happening.
So that's where this small plugin comes in. It contains a javascript file which will extend the interactiveReport widget with the function "refresh", which will override the standard refresh function. It doesn't change the default behaviour at all, the default refresh is still being called. A new argument to the function (boolean) will execute the added functionality of refreshing while maintaining the pagination.
The apex plugin then facilitates the use of this by exposing it to the dynamic action framework and removing the need to configure things through javascript.  

Demo: https://apex.oracle.com/pls/apex/f?p=90922:18

## To use:

1. Install the plugin in the shared components of your application
2. Create a dynamic action on the page which reacts to some event. For example a button.
3. As a true action, select the "IR Refresh Page" action, found under "Execute"
4. Adjust the settings
5. Select the affected region (the interactive report region)