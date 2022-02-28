-module(my_first_app_router).
-behaviour(nova_router).

-export([
         routes/1
        ]).

%% The Environment-variable is defined in your sys.config in {nova, [{environment, Value}]}
routes(_Environment) ->
    [
      #{prefix => "",
        security => false,
        routes => [
                    {"/pet", {http_api_demo_pet_controller, get_pets}, #{methods => [options, get]}},
                    {"/pet", {http_api_demo_pet_controller, create_pet}, #{methods => [options, post]}},
                    {"/pet/:petid", {http_api_demo_pet_controller, get_pet}, #{methods => [options, get]}},
                    {"/pet/:petid", {http_api_demo_pet_controller, update_pet}, #{methods => [options, put]}},
                    {"/pet/:petid", {http_api_demo_pet_controller, delete_pet}, #{methods => [options, delete]}}
                  ], 
        statics => [
                    {"/assets/[...]", "assets"}
                  ]
        }
    ].
