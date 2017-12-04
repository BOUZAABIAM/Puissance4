:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).



:- http_handler('/test',
		http_reply_file('puissance4.html',[]),[]).

server(Port) :-	http_server(http_dispatch, [port(Port)]).
