include(BuildUtils)

add_library(cli_parser cli_parser.c)
set_project_properties(cli_parser ${CMAKE_CURRENT_SOURCE_DIR}/include)

add_executable(main main.c)
set_project_properties(
    main 
    ${CMAKE_CURRENT_SOURCE_DIR}/include
    cli_parser
)

run_compile_commands_rename(main)
