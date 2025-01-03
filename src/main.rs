//! # [A Rust Cookbook](<https://rust-lang-nursery.github.io/rust-cookbook>)
//!
//! This _Rust Cookbook_ is a collection of simple [Rust](https://www.rust-lang.org)
//! examples that demonstrate good practices to accomplish common programming tasks,
//! using the crates of the Rust ecosystem.

/// # [A Rust Cookbook](<https://rust-lang-nursery.github.io/rust-cookbook>)
///
/// [Build Status travis]: https://api.travis-ci.com/rust-lang-nursery/rust-cookbook.svg?branch=master
/// [travis]: https://travis-ci.com/rust-lang-nursery/rust-cookbook
///
/// **[Read it here]**.
///
/// ## Read it offline
///
/// If you'd like to read it locally:
///
/// ```shell
/// git clone https://github.com/rust-lang-nursery/rust-cookbook && \
/// cd rust-cookbook && \
/// cargo install mdbook --vers "0.4.43" && \
/// mdbook serve --open
/// ```
///
/// The output can also be opened from the `book` subdirectory in your web browser.
///
/// ```shell
/// xdg-open ./book/index.html || \ # linux
/// open ./book/index.html     || \ # mac
/// start .\book\index.html    # windows
/// ```
///
/// [Read it here]: https://rust-lang-nursery.github.io/rust-cookbook
/// [Rust]: https://www.rust-lang.org/
///
/// ## Contributing
///
/// This project is intended to be easy for new [Rust] programmers to
/// contribute to, and an easy way to get involved with the Rust
/// community. It needs and welcomes help.
///
/// For details see [CONTRIBUTING.md] on GitHub.
///
/// [CONTRIBUTING.md]: https://github.com/rust-lang-nursery/rust-cookbook/blob/master/CONTRIBUTING.md
///
/// ## License [![CC0-badge]][CC0-deed]
///
/// Rust Cookbook is licensed under Creative Commons Zero v1.0 Universal License
/// ([LICENSE-CC0](LICENSE-CC0) or <https://creativecommons.org/publicdomain/zero/1.0/legalcode>)
///
/// Unless you explicitly state otherwise, any contribution intentionally submitted
/// for inclusion in Rust Cookbook by you, as defined in the CC0-1.0 license, shall be
/// [dedicated to the public domain][CC0-deed] and licensed as above, without any additional
/// terms or conditions.
///
/// [CC0-deed]: https://creativecommons.org/publicdomain/zero/1.0/deed.en
/// [CC0-badge]: https://mirrors.creativecommons.org/presskit/buttons/80x15/svg/cc-zero.svg

fn main() {
    println!("This program does nothing.");
    println!("See documentation at https://github.com/rust-lang-nursery/rust-cookbook");
}
