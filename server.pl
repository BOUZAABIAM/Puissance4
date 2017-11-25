:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_path)).
:- use_module(library(http/http_authenticate)).
:- use_module(library(http/http_server_files)).


:- multifile
    user:file_search_path/2,
    http:location/3.
:- dynamic
    user:file_search_path/2.
:- http_handler(css('puissance4.css'),  http_reply_file('pussance4.css', []), []).

:- http_handler('/test',
		http_reply_file('puissance4.html',[]),[]).

server(Port) :-	http_server(http_dispatch, [port(Port)]).
