# s141

## howto

build

```bash
rebar compile
```

generate

```bash
rebar generate
```

run

```bash
s141/bin/s141 console
```

get children

```erlang
supervisor:which_children(s141_sup).
```

create some children

```erlang
supervisor:start_child(s141_sup,[a]).
supervisor:start_child(s141_sup,[b]).
```

get children

```erlang
supervisor:which_children(s141_sup).
```

get only **a** children


```erlang
lists:filter(fun({_Id,Pid,_Type,_Modules}) -> gen_server:call(Pid,tenant) == a end,supervisor:get_children(s141_sup)).
```

get all children, with tenant data
```erlang
lists:map(fun({_Id,Pid,_Type,_Modules}) -> {Pid,gen_server:call(Pid,tenant)} end,supervisor:get_children(s141_sup)).
```
