# Voice Samples — Jake Krajewski (verbatim)

**These are the source of truth.** When invoking the writing-voice skill, read this file *first*, then `SKILL.md`. The fingerprint in SKILL.md describes voice; the prose below *is* voice. Calibrate against the prose, not the description.

Two complete published Medium tutorials, copy-pasted by Jake on 2026-04-30. Both are tutorial/explainer genre. If asked to write in a different genre (essay, opinion, LinkedIn post), keep the *attitude* — warm tutor, peer-not-authority, honest about reader frustration, light goofy asides — but adapt structure to genre.

---

## Sample 1 — PyTorch Layer Dimensions: Get your layers to work every time (the complete guide)

*Published Jan 11, 2020. Subtitle: "Get your layers to fit smoothly, the first time, every time. A starter's guide to becoming fluent in tensor and layer dimensions in PyTorch."*

### Preface

This article covers defining tensors, and properly initializing neural network layers in PyTorch, and more! (Formerly titled PyTorch layer dimensions: What size and why?)

### Introduction

You might be asking: "How do I initialize my layer dimensions in PyTorch without getting yelled at?" Is it all just trial and error? No, really… What are they supposed to be? For starters, did you know that the first two required arguments of a torch.nn.Conv2d layer, and a torch.nn.Linear layer ask for completely different aspects of the exact same tensor data? If you didn't know this, keep reading.

**Example 1: Same, same, but different.**

Constructing a convolution layer and linear layer are syntactically similar, but the args do not expect similar things, despite being able to operate on the exact same input data (although that data should be sized differently).

```python
# The __init__ method of a nn.Module class:
...
def __init__(self):
"""Initialize neural net layers."""
    super(Net, self).__init__()

    # Intialize my 2 layers here:
    self.conv = nn.Conv2d(1, 20, 3) # Give me depth of input.
    self.dense = nn.Linear(2048, 10) # Give me features of input.
...
```

You need to develop your understanding of how PyTorch models would like to consume data before just throwing a dataset at some network layers.

### Lesson 1: How to read tensor sizes in PyTorch

Below are some common tensor sizes encountered in PyTorch and typical examples of when to utilize them. It's important to know what you're looking at, because their structures are not as predictable as one might desire (this somewhat unintuitive design choice was implemented primarily for performance benefits, which is OK… I guess).

One mental anchor we have when feeding tensors into convolutional or linear layers (although not RNN's) is that the first dimension is always batch size (N). Whereas, the remaining dimensions depend on what phase the moon is in and the intermittent frequency of cricket (Acheta domesticus) chirps at moonrise in your region. Just kidding, it's not that simple. You have to learn them by rote. So start roting (Example 2 below).

> *Image caption: Take the red pill they said. Go deeper they said. What is the 3rd dimension of this tensor supposed to be?!? — Photo by Tim Gouw on Unsplash*

It's important to know how PyTorch expects its tensors to be shaped— because you might be perfectly satisfied that your 28 x 28 pixel image shows up as a tensor of torch.Size([28, 28]). Whereas PyTorch on the other hand, thinks you want it to be looking at your 28 batches of 28 feature vectors. Suffice it to say, you're not going to be friends with each other for a little while until you learn how to see things her way — so, don't be that guy. Study your tensor dimensions!

**Example 2: The tensor dimensions PyTorch likes.**

```python
"""Example tensor size outputs, how PyTorch reads them, and where you encounter them in the wild.
Note: the values below are only examples. Focus on the rank of the tensor (how many dimensions it has)."""
>>> torch.Size([32])
    # 1d: [batch_size]
    # use for target labels or predictions.
>>> torch.Size([12, 256])
    # 2d: [batch_size, num_features (aka: C * H * W)]
    # use for nn.Linear() input.
>>> torch.Size([10, 1, 2048])
    # 3d: [batch_size, channels, num_features (aka: H * W)]
    # when used as nn.Conv1d() input.
    # (but [seq_len, batch_size, num_features]
    # if feeding an RNN).
>>> torch.Size([16, 3, 28, 28])
    # 4d: [batch_size, channels, height, width]
    # use for nn.Conv2d() input.
>>>  torch.Size([32, 1, 5, 15, 15])
    # 5D: [batch_size, channels, depth, height, width]
    # use for nn.Conv3d() input.
```

Notice how the Conv2d layer wants a 4d tensor? How about the 1d or 3d layers?

So, if you wanted to load a grey scale, 28 x 28 pixel image into a Conv2d network layer, find the layer type in the example above. Since it wants a 4d tensor, and you already have a 2d tensor with height and width, just add batch_size, and channels (see rule of thumb for channels below) to pad out the extra dimensions, like so: [1, 1, 28, 28]. That way, you and PyTorch can make up and be friends again.

### Lesson 2: Initializing a torch.nn.Conv2d layer

The documentation describes a Conv2d layer like this:

```
Class
torch.nn.Conv2d(in_channels, out_channels, kernel_size, stride=1, padding=0, dilation=1, groups=1, bias=True, padding_mode='zeros')
Parameters
in_channels (int) - Number of channels in the input image
out_channels (int) - Number of channels produced by the convolution
```

Remember which dimension your input channels are? See Lesson 1 if you forgot. Simply use that number for your in_channels argument in the first convolutional layer. Done.

**Rule of thumb for "in_channels" on your first Conv2d layer:**

— If your image is black and white, it is 1 channel. (You can ensure this by running transforms.Grayscale(1) in the transforms argument of the dataloader.)

— If your image is color, it is 3 channels (RGB).

— If there is an alpha (transparency) channel, it has 4 channels.

This means for your first Conv2d layer, even if your image size is something enormous like 1080px by 1080px, your in_channels will typically be either 1 or 3.

> **Note:** If you tested this with some randomly generated tensor and it throws up at you still and you're yelling at your computer right now, breathe. It's OK. Make sure it has the right dimensions. Did you unsqueeze() the tensor? Pytorch wants batches. The unsqueeze() function will add a dimension of 1 representing a batch size of 1.

**But, what about out_channels?**

What about the out_channels you say? That's your choice for how deep you want your network to be. Basically, your out_channels dimension, defined by Pytorch is:

> out_channels (int) — Number of channels produced by the convolution

For each convolutional kernel you use, your output tensor becomes one channel deeper when passing through that layer. If you want a ton of kernels, make this number high like 121, if you want just a few, make this number low like 8 or 12. Whatever number you choose here will be the value for channels_in of the next convolutional layer, and so on and so forth.

> **Note:** The value of kernel_size is custom, and although important, doesn't lead to head-scratching errors, so it is omitted from this tutorial. Just make it an odd number, typically between 3–11, but sizes may vary between your applications.

Generally, convolutional layers at the front half of a network get deeper and deeper, while fully-connected (aka: linear, or dense) layers at the end of a network get smaller and smaller. Here's a valid example from the 60-minute-beginner-blitz (notice the out_channel of self.conv1 becomes the in_channel of self.conv2):

```python
class Net(nn.Module):

    def __init__(self):
        super(Net, self).__init__()
        # 1 input image channel, 6 output channels, 3x3 square convolution
        # kernel
        self.conv1 = nn.Conv2d(1, 6, 3)
        self.conv2 = nn.Conv2d(6, 16, 3)
        # an affine operation: y = Wx + b
        self.fc1 = nn.Linear(16 * 6 * 6, 120)  # 6*6 from image dimension
        self.fc2 = nn.Linear(120, 84)
        self.fc3 = nn.Linear(84, 10)
```

Let's talk about fully connected layers now.

### Lesson 3: Fully connected (torch.nn.Linear) layers

Documentation for Linear layers tells us the following:

```
Class
torch.nn.Linear(in_features, out_features, bias=True)
Parameters
in_features – size of each input sample
out_features – size of each output sample
```

I know these look similar, but do not be confused: "in_features" and "in_channels" are completely different, beginners often mix them up and think they're the same attribute.

```python
# Asks for in_channels, out_channels, kernel_size, etc
self.conv1 = nn.Conv2d(1, 20, 3)
# Asks for in_features, out_features
self.fc1 = nn.Linear(2048, 10)
```

**Calculate the dimensions.**

There are two, specifically important arguments for all nn.Linear layer networks that you should be aware of no matter how many layers deep your network is. The very first argument, and the very last argument. It doesn't matter how many fully connected layers you have in between, those dimensions are easy, as you'll soon see.

If you want to pass in your 28 x 28 image into a linear layer, you have to know two things:

1. Your 28 x 28 pixel image can't be input as a [28, 28] tensor. This is because nn.Linear will read it as 28 batches of 28-feature-length vectors. Since it expects an input of [batch_size, num_features], you have to transpose it somehow (see view() below).
2. Your batch size passes unchanged through all your layers. No matter how your data changes as it passes through a network, your first dimension will end up being your batch_size even if you never see that number explicitly written anywhere in your network module's definition.

**Use view() to change your tensor's dimensions.**

`image = image.view(batch_size, -1)`

You supply your batch_size as the first number, and then "-1" basically tells Pytorch, "you figure out this other number for me… please." Your tensor will now feed properly into any linear layer. Now we're talking!

So then, to initialize the very first argument of your linear layer, pass it the number of features of your input data. For 28 x 28, our new view tensor is of size [1, 784] (1 * 28 * 28):

**Example 3: Resize with view() to fit into a linear layer**

```python
batch_size = 1
# Simulate a 28 x 28 pixel, grayscale "image"
input = torch.randn(1, 28, 28)
# Use view() to get [batch_size, num_features].
# -1 calculates the missing value given the other dim.
input = input.view(batch_size, -1) # torch.Size([1, 784])
# Intialize the linear layer.
fc = torch.nn.Linear(784, 10)
# Pass in the simulated image to the layer.
output = fc(input)
print(output.shape)
>>> torch.Size([1, 10])
```

Remember this — if you're ever transitioning from a convolutional layer output to a linear layer input, you must resize it from 4d to 2d using view, as described with image example above.

So, a conv output of [32, 21, 50, 50] should be "flattened" to become a [32, 21 * 50 * 50] tensor. And the in_features of the linear layer should also be set to [21 * 50 * 50].

The second argument of a linear layer, if you're passing it on to more layers, is called H for hidden layer. You just kind of play positional ping-pong with H and make it the last of the previous and the first of the next, like this:

```python
"""The in-between dimensions are the hidden layer dimensions, you just pass in the last of the previous as the first of the next."""
fc1 = torch.nn.Linear(784, 100) # 100 is last.
fc2 = torch.nn.Linear(100, 50) # 100 is first, 50 is last.
fc3 = torch.nn.Linear(50, 20) # 50 is first, 20 is last.
fc4 = torch.nn.Linear(20, 10) # 20 is first.
"""This is the same pattern for convolutional layers as well, only it's channels, and not features that get passed along."""
```

The very last output, aka your output layer depends on your model and your loss function. If you have 10 classes like in MNIST, and you're doing a classification problem, you want all of your network architecture to eventually consolidate into those final 10 units so that you can determine which of those 10 classes your input is predicting.

The last layer is dependent on what you want to infer from your data. The operations you can do to get the answer you need is a topic for another article, because there is a lot to cover. But for now you should have all the basics covered.

**That's it!**

You should now be able to build a network without scratching your head or getting shouted at by the interpreter. Remember, your batch_size or dim 0 is the same, all the way through. Your convolution layers care about depth (channels), and your linear layers care about feature counts. And learn how to read those tensors!

Please leave a comment, or share this article if you liked it and found it helpful!

---

## Sample 2 — Autoencoder neural networks: what and how?

*Published Dec 14, 2019. Subtitle: "Clear, elementary instructions as to how to build an autoencoder network in Keras for beginners"*

### Preface

I'll be walking through the creation of an autoencoder using Keras and Python. First, I'll address what an autoencoder is and how would we possibly implement one. Then I'll go through steps of actually creating one. Probably going to use MNIST because it's generic and simple.

### Introduction: What is an autoencoder?

Autoencoders take any input, chop it into some compressed version, and use that to reconstruct what the input was. So basically, input x goes into hidden layer h, h = f(x), and comes out as reconstruction r, r = g(h). The autoencoder is good when r is close to x, or when the output looks like the input.

So, is it a good thing to have a neural network that outputs exactly what the input was? In many cases, not really, but they're often used for other purposes. One common objective is that the hidden layer h should have some limitations imposed on it such that it pulls out important details about x, without actually needing to keep all the information that x provided, thereby acting as a sort of lossy compression, and it should do this automatically from examples rather than being engineered by a human to recognize the salient features (Chollet, 2016).

### Why tho?

Often when people write autoencoders, the hope is that the middle layer h will take on useful properties in some compressed format. Here we'll be building something called an undercomplete autoencoder, which basically means we shrink the hidden layer so that there's no way it can store the same amount of info that the input gives us, and from that, we try to get a nice reconstruction. Building a model like this forces the autoencoder to find the most salient features of the data you feed it. In real life, it can be used in reducing dimensionality of datasets, which can help for data visualization, or for potentially denoising noisy data.

### Parts list

Here's the basic list of things we'll need to create.

- input data — what is getting encoded and decoded?
- an encoding function — there needs to be a layer that takes an input and encodes it.
- a decoding function — there needs to be a layer that takes the encoded input and decodes it.
- loss function — The autoencoder is good when the output of the decoded version is very close to the original input data (loss is small), and bad when the decoded version looks nothing like the original input.

### The Approach

The simplest autoencoder looks something like this: x → h → r, where the function f(x) results in h, and the function g(h) results in r. We'll be using neural networks so we don't need to calculate the actual functions.

Logically, step 1 will be to get some data. We'll grab MNIST from the Keras dataset library. It's comprised of 60,000 training examples and 10,000 test examples of handwritten digits 0–9. Next, we'll do some basic data preparation so that we can feed it into our neural network as our input set, x.

Then in step 2, we'll build the basic neural network model that gives us hidden layer h from x.

- We'll put together a single dense hidden layer that takes in x as input with a ReLU activation layer.
- Next, we'll pass the output of this layer into another dense layer, and run the output through a sigmoid activation layer.

Once we have a model, we'll be able to train it in step 3, and then in step 4, we'll visualize the output.

**Let's put it together:**

First, let's not forget the necessary imports to help us create our neural network (keras), do standard matrix mathematics (numpy), and plot our data (matplotlib). We'll call this step 0.

```python
# Importing modules to create our layers and model.
from keras.layers import Input, Dense
from keras.models import Model
# Importing standard utils
import numpy as np
import matplotlib.pyplot as plt
```

**Step 1.** Import our data, and do some basic data preparation. Since we're not going to use labels here, we only care about the x values.

```python
from keras.datasets import mnist
(train_xs, _), (test_xs, _) = mnist.load_data()
```

Next, we'll normalize them between 0 and 1. Since they're greyscale images, with values between 0 and 255, we'll represent the input as float32's and divide by 255. This means if the value is 255, it'll be normalized to 255.0/255.0 or 1.0, and so on and so forth.

```python
# Note the '.' after the 255, this is correct for the type we're dealing with. It means do not interpret 255 as an integer.
train_xs = train_xs.astype('float32') / 255.
test_xs = test_xs.astype('float32') / 255.
```

Now think about this, we have images that are 28 x 28, with values between 0 and 1, and we want to pass them into a neural network layer as an input vector. What should we do? We could use a convolutional neural network, but in this simple case, we'll just use a dense layer. So how do we feed it in? We'll flatten each image into a single dimensional vector of 784 x 1 values (28 x 28 = 784).

```python
train_xs = train_xs.reshape((len(train_xs), np.prod(train_xs.shape[1:])))
test_xs = test_xs.reshape((len(test_xs), np.prod(test_xs.shape[1:])))
```

**Step 2.** Let's put together a basic network. We're simply going to create an encoding layer, and a decoding layer. We'll put them together into a model called the autoencoder below. We'll also decrease the size of the encoding so we can get some of that data compression. Here we'll use 36 to keep it simple.

```python
# Defining the level of compression of the hidden layer. Basically, as the input is passed through the encoding layer, it will come out smaller if you want it to find salient features. If I choose 784 for my encoding dimension, there would be a compression factor of 1, or nothing.
encoding_dim = 36
input_img = Input(shape=(784, ))
# This is the size of the output. We want to generate 28 x 28 pictures in the end, so this is the size we're looking for.
output_dim = 784
encoded = Dense(encoding_dim, activation='relu')(input_img)
decoded = Dense(output_dim, activation='sigmoid')(encoded)
```

Now create a model that accepts input_img as inputs and outputs the decoder layer. Then compile the model, in this case with adadelta as the optimizer and binary_crossentropy as the loss.

```python
autoencoder = Model(input_img, decoded)
autoencoder.compile(optimizer='adadelta', loss='binary_crossentropy')
```

**Step 3.** Our model is ready to train. You'll be able to run this without a GPU, it doesn't take long. We'll call fit on the autoencoder model we created, passing in the x values for both the inputs and outputs, for 15 epochs, with a relatively large batch size (256). This will help it train somewhat quickly. We'll enable shuffle to prevent homogeneous data in each batch and then we'll use the test values as validation data. Note: if you want to train longer without over-fitting, sparseness and regularization may be added to your model.

```python
autoencoder.fit(train_xs, train_xs, epochs=15, batch_size=256, shuffle=True, validation_data=(test_xs, test_xs)
```

That's it. Autoencoder done. You'll see it should have a loss of about 0.69 meaning that the reconstruction we've created generally represents the input fairly well from the highly compressed version. But can't we take a look at it for ourselves?

**Step 4.** For this, we'll do some inference to grab our reconstructions from our input data, and then we'll display them with matplotlib. For this we want to use the predict method.

Here's the thought process: take our test inputs, run them through autoencoder.predict, then show the originals and the reconstructions.

```python
# Run your predictions and store them in a decoded_images list.
decoded_images = autoencoder.predict(test_xs)
```

> *Image caption: The top row is the inputs, and the bottom row is the reconstruction from our autoencoder model.*

Here's how you get that image above:

```python
# We'll plot 10 images.
n = 10
plt.figure(figsize=(16, 3))
for i in range(n):
    # Show the originals
    ax = plt.subplot(2, n, i + 1)
    plt.imshow(test_xs[i].reshape(28, 28))
    ax.get_xaxis().set_visible(False)
    ax.get_yaxis().set_visible(False)
# Show the reconstruction
    ax = plt.subplot(2, n, i + 1 + n)
    plt.imshow(decoded_imgs[i].reshape(28, 28))
    ax.get_xaxis().set_visible(False)
    ax.get_yaxis().set_visible(False)
plt.show()
```

That's it. That's the most basic autoencoder. Many thanks to François Chollet, whose article I learned this from and inspired the basics of this tutorial, and Goodfellow, et al. for writing Deep Learning as an invaluable reference.

If you liked this tutorial or have suggestions, leave a comment below.

> **Edit:** I've added the ability to view the hidden layer here which is definitely interesting. You can see that from these 6 x 6 images, the neural network is able to reconstruct the original input. Are you starting to see why this might be useful?

How would we get that middle row? Well that's easy, we create a model out of the first hidden layer. Why? We do this so we can run the predict functionality and add its results to a list in python.

```python
# Create a Model from the layer.
encoder = Model(input_img, encoded)
# Save the results to encoded_imgs. This must be done after the autoencoder model has been trained in order to use the trained weights.
encoded_imgs = encoder.predict(test_xs)
```

That's all for now! I hope this tutorial helped you understand a little about the thought processes behind autoencoders and how to use them in your neural networks.

---

## Pattern notes (read after the samples)

What the samples actually show — corrections to the SKILL.md fingerprint:

1. **Warm-tutor register, not punchy-essayist.** Sentences are mostly medium-length and conversational. Short fragmentary sentences ("It hasn't.") are *rare*, not the dominant rhythm. The fingerprint overstates short-punchy.

2. **Goofy asides are central.** "What phase the moon is in and the intermittent frequency of cricket (Acheta domesticus) chirps at moonrise." "Just kidding." "OK… I guess." "Probably going to use MNIST because it's generic and simple." This is the single biggest tell of the voice. The fingerprint mentions "light self-aware humor" — undersells it. Go heavier on absurd specificity.

3. **Personifies the tool.** "PyTorch on the other hand, thinks you want it to be looking at…" "Make up and be friends again." "See things her way." Tools have feelings and moods. Adopt their POV briefly to dramatize the user's confusion.

4. **Acknowledges reader frustration directly.** "If you tested this with some randomly generated tensor and it throws up at you still and you're yelling at your computer right now, breathe. It's OK." This is reassuring-guide tone in its purest form. The reader is allowed to be frustrated; the writer is on their side.

5. **Em-dashes used, but parentheticals used MORE.** Trust the parenthetical more than the em-dash when in this voice. The fingerprint overstates em-dash heaviness — that comes more from later/different writing.

6. **Trailing ellipses for tonal softening.** "No, really…" "OK… I guess." "Please…" Ellipses signal a held-breath or soft-aside, not "more to come."

7. **Closings are warm, not landing.** "That's it!" "Please leave a comment, or share this article if you liked it." "I hope this tutorial helped." NOT a dry one-liner mic-drop. The fingerprint's "section endings land" is wrong for this voice — endings *settle*, they don't *land*.

8. **First-person used freely, not sparingly.** "I'll be walking through…" "I know these look similar." The fingerprint's "use I sparingly" is wrong. First-person is the default narrative voice; second-person ("you") is the addressed-reader voice. Both used heavily, naturally.

9. **Direct-address rhetorical questions throughout — not just openers.** "But, what about out_channels?" "What should we do?" "Why tho?" Rhetorical questions work as section pivots, not just opens.

10. **Bold for headers and labels (Step 1, Note, Example 2), not for inline emphasis.** Almost no inline bolding of single words. The fingerprint overstates "bold the single word worth remembering" — that's a different writer.

## Genre note

Both samples are tutorial/explainer. When asked to write in a different genre (essay, opinion, LinkedIn post, cover letter), preserve the *attitude* and *tone* (warm, peer-not-authority, goofy-specific, reassuring), but adapt structure to the genre. Do not force "Step 1 / Step 2 / lesson 3" structure onto opinion writing.

## Open gaps

- No verbatim sample of "Words We'll Never Speak" (paywalled, Jul 2025). That piece is closer to opinion/observation genre and would be a better calibration source for non-tutorial work. If Jake pastes it in, append here.
- No sample of "A coder's guide to colors" (paywalled, redirects to uxdesign.cc). Same note.
