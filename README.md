# SUI Gas Fee Comparison With Without PTB

This is a simple project to compare the gas fee of SUI token transfer with and without PTB.

## Premise

- network: Devnet
- number of transactions: 500 times
- type of transaction: SUI token transfer

## Results

I calculated the following with 1 SUI = 130 Yen.

https://coinmarketcap.com/currencies/sui/sui/jpy/

| |Simple Transfer | Transfer with PTB |
| --- | --- | --- |
| Gas Fee (once) (MIST) | 1,997,880 MIST | - |
| Gas Fee (500 times) (MIST) | 998,940,000 MIST | 495,009,880 MIST |
| Gas Fee (500 times) (SUI) | 0.99894 SUI | 0.49500988 SUI |
| Gas Fee (Yen) | 129.8622 Yen | 64.3512844 Yen |

The rate of the gas fee with PTB is **about half** of the simple transfer.

As to the upper limit of the PTB, the details are as follows.

https://github.com/MystenLabs/sui/blob/main/crates/sui-protocol-config/src/lib.rs#L1598-L1953
