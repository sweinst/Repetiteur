use clap::{arg, Command};
use commands::UserCommands;
use dotenvy::dotenv;

mod commands;

#[tokio::main]
async fn main() {
    dotenv().ok();
    let matches = Command::new("repetiteur")
        .about("Répétiteur commands")
        .arg_required_else_help(true)
        .subcommand(
            Command::new("users")
                .about("User management")
                .arg_required_else_help(true)
                .subcommand(
                    Command::new("create")
                        .about("Create a new user")
                        .arg_required_else_help(true)
                        .arg(arg!([username] "The user name").required(true))
                        .arg(arg!([password] "The user password").required(true))
                        .arg(arg!([email] "The user email" ).required(true))
                        .arg(arg!(-a --admin "Make the user an admin")),
                )
                .subcommand(
                    Command::new("update")
                        .about("Update an existing user")
                        .arg_required_else_help(true)
                        .arg(arg!([username] "The user name").required(true))
                        .arg(arg!(-u --new_username <username> "The optional new user name"))
                        .arg(arg!(-p --password <password> "The optional new user password"))
                        .arg(arg!(-e --email <email> "The optional new user email" ))
                        .arg(arg!(-a --admin <bool> "Optional: make the user an admin?")
                            .value_parser(clap::builder::BoolishValueParser::new())),
                )
                .subcommand(
                    Command::new("list")
                        .about("List existing users")
                        .arg(arg!([filter] "A case-insensitive regex for matching substrings in user names ")),
                )
                .subcommand(
                    Command::new("delete")
                        .about("Delete user by ID")
                        .arg_required_else_help(true)
                        .arg(arg!([id] "The user uuid").required(true)),
                ),
        )
        .get_matches();
    match matches.subcommand() {
        Some(("users", sub_matches)) => match sub_matches.subcommand() {
            Some(("create", sub_matches)) => {
                UserCommands::create(
                    &sub_matches.get_one::<String>("username").unwrap(),
                    &sub_matches.get_one::<String>("password").unwrap(),
                    &sub_matches.get_one::<String>("email").unwrap(),
                    sub_matches.get_flag("admin"),
                )
                .await;
            }
            Some(("update", sub_matches)) => {
                UserCommands::update(
                    &sub_matches.get_one::<String>("username").unwrap(),
                    sub_matches.get_one::<String>("new_username"),
                    sub_matches.get_one::<String>("password"),
                    sub_matches.get_one::<String>("email"),
                    sub_matches.get_one::<bool>("admin"),
                )
                .await;
            }
            Some(("list", sub_matches)) => {
                UserCommands::list(sub_matches.get_one::<String>("filter")).await
            }
            Some(("delete", sub_matches)) => {
                UserCommands::delete(sub_matches.get_one::<String>("id").unwrap()).await
            }
            _ => {}
        },
        _ => {}
    }
}
