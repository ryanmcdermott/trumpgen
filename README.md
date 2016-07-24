# trumpgen

## What is it?
`trumpgen` is an app written in Elm and using Node and Torch on the backend to generate speeches in the style of 2016 United States Presidential candidate Donald Trump. Using a [corpus of speeches](https://github.com/ryanmcdermott/trump-speeches) and [torch-rnn](https://github.com/jcjohnson/torch-rnn), a character-level recurrent neural network (RNN) is trained and the "style" of Donald Trump's speeches are approximated. After training the neural network, we can randomly sample from it and produce entirely new speeches.


## What else?
As I am the most novice of beginners in this area, I've found very simple explanations, without a lot of math, to be highly helpful. [Check out Andrej Karpathy's amazing RNN lesson](http://karpathy.github.io/2015/05/21/rnn-effectiveness/) if you would like to learn more.

## Installation
```
docker build -t ryanmcdermott/trumpgen .
docker run -ti -v $PWD/src:/opt/trumpgen ryanmcdermott/trumpgen npm install
docker run -ti -v $PWD/src:/opt/trumpgen ryanmcdermott/trumpgen elm package install -y
docker run -ti -v $PWD/src:/opt/trumpgen ryanmcdermott/trumpgen npm run build
```

## Running
```
docker run -t -d -v $PWD/src:/opt/trumpgen -p 80:80 -e "PORT=80" ryanmcdermott/trumpgen node src/server.js
```

## Contributing
Pull requests are much appreciated and accepted.


## License
Released under the [MIT License](http://www.opensource.org/licenses/MIT)


## Credits
[Char-RNN](https://github.com/karpathy/char-rnn)

[torch-rnn](https://github.com/jcjohnson/torch-rnn)

[docker-torch-rnn](https://github.com/crisbal/docker-torch-rnn)
