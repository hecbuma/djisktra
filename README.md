djisktra
========

You can run auto mode which has a pre-loaded graph or you can enter you own graph if you want to.

```
#for auto mode
TYPE=auto ruby prompt.rb
#Standar
ruby prompt.rb
```

It also has a web interface, for now it runs with the pre-loaded graph. its a sinatra app.
[http://djisktra.herokuapp.com/](#http://djisktra.herokuapp.com/)


###Example run

```
  (master ✓) |2.0.0-p0| →  ruby prompt.rb

Insert as meny as nodes as you want to the graph. To stop creating nodes just type 'stop'

node name: a
New node = #<Node:0x007fa0821828e0>
node name: b
New node = #<Node:0x007fa0821826b0>
node name: c
New node = #<Node:0x007fa082182458>
node name: d
New node = #<Node:0x007fa082182250>
node name: e
New node = #<Node:0x007fa082182020>
node name: f
New node = #<Node:0x007fa082181d28>
node name: stop

 Now lets create some routes between the nodes. again to stop just type 'stop'


 Example: A,B,7

enter a route: a,b,7
route created 7
enter a route: a,c,9
route created 9
enter a route: a,d,14
route created 14
enter a route: b,c,10
route created 10
enter a route: b,f,15
route created 15
enter a route: c,f,11
route created 11
enter a route: c,d,2
route created 2
enter a route: d,e,9
route created 9
enter a route: e,f,6
route created 6
enter a route: stop

 Enter the start point and the destination point in the for of 'A-B'...a-e
>>> Start point, end point: a,e.

>>>>>>>> [7, 9, 14, 0, 0]
>>>>>>>> [22, 0, 9, 14]
>>>>>>>> [0, 11, 20]
>>>>>>>> [20, 20]
```
