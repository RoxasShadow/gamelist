A manager for the games to buy (or just bought).

Just create your gamelist (a simple plain text, human-readable and why not, well formatted) and give it in the application.

```
ruby gamelist.rb                              # Print the usage
```

```
ruby gamelist.rb gamelist get                 # Print the games
```

```
ruby gamelist.rb gamelist get PC              # Print the PC games
ruby gamelist.rb gamelist get Steam           # Print the games to buy or bought on Steam
ruby gamelist.rb gamelist get 2012            # Print the games to buy or bought in 2012
```

```
ruby gamelist.rb gamelist get _PC             # Print the NOT-PC games 
ruby gamelist.rb gamelist get _Steam          # Print the games NOT bought on Steam
ruby gamelist.rb gamelist get _2012           # Print the games NOT to buy or bought in 2012
```

```
ruby gamelist.rb gamelist get PC Steam _2012  # Print the PC games to download or downloaded on Steam before or after 2012.
```

```
ruby gamelist.rb gamelist count         # Count the number of games for each platform
                                        # The usage is the same of get
```
