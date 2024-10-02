use clap::{Arg, Command};
use common::auth::hash_password;

fn main() {
    let matches = Command::new("hash_password")
        .about("Hash one or more passwords")
        .arg_required_else_help(true)
        .arg(
            Arg::new("passwords")
                .help("The passwords to hash")
                .required(true)
                .num_args(1..),
        )
        .get_matches();

    let passwords: Vec<String> = matches
        .get_many::<String>("passwords")
        .unwrap()
        .map(|v| v.to_owned())
        .collect();
    for password in passwords {
        let hash = hash_password(&password);
        match hash {
            Ok(hash) => println!("'{}' => '{}'", password, hash),
            Err(e) => eprintln!("Error: cannot hash '{}'", e),
        }
    }
}
