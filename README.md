## Ultra light Docker image for Monero Daemon

This just builds a simple and ultra light Docker image to run Monero Daemon

## Usage

Flags passed as command to the `docker run` command are appended to the `monerod` call. Examples:

* Mainnet

```
docker run -p 18081:18081 xmrstuff/monerod
```

* Stagenet

```
docker run -p 38081:38081 xmrstuff/monerod --stagenet
```

* Testnet

```
docker run -p 28081:28081 xmrstuff/monerod --testnet
```