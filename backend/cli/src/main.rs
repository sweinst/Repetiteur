use clap::{arg, Arg, Command};
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
                        .arg(Arg::new("username").required(true))
                        .arg(Arg::new("password").required(true))
                        .arg(Arg::new("email").required(true))
                        .arg(arg!(-a --admin "Make the user an admin")),
                )
                .subcommand(
                    Command::new("list")
                        .about("List existing users")
                        .arg(arg!([filter] "a regex for matching substrings in user names ")),
                )
                .subcommand(
                    Command::new("delete")
                        .about("Delete user by ID")
                        .arg_required_else_help(true)
                        .arg(Arg::new("id").required(true)),
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
