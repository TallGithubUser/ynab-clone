# Journal
## Diving into learning Ruby on Rails and Ember
As soon as I got that message from a YNAB recruiter saying, "You should learn Ruby on Rails and Ember..." I started digging into how to learn both. 

Lucky for me, I'm actually quite familiar with Ember; I use that coffee mug for my daily morning routing. Wake up, do some CrossFit, get home, shower, then make a latte and put it into my mug that keeps the temperature precisely at 145 degrees. Is the Ember mug the most boujee thing I own? Yes. Does it have anything to do with Ember.js? No. Thus, I started with Ruby on Rails

### Learning Ruby on Rails
I've been a software developer for more than 8 years, so I have experience. I know how to write code, I know how to debug code, and I know how to avoid the trap of, "I'll spend two hours to write a Python script to automate a task that will take me 15 minutes to do." Because of this, I have a good head start on learning Ruby on Rails. I'm not learning how to write good quality software at the same time that I'm learning a new language. Once you've learned one, you can learn others. Well, sort of (more on that later).  

My first step was to get a feel for the Ruby language, apart from rails. I found a really good tutorial called [Ruby in 100 Minutes](http://tutorials.jumpstartlab.com/projects/ruby_in_100_minutes.html) and was immediately able to dive in. It felt pretty similar to Python in that it was an interpreted language, Python has `modules` and Ruby apparently has `gems`, all things are objects (even primitives? Different than Python), etc. 

I picked up the syntax fairly quickly. However, since I'm taking my time learning Ruby on Rails and need to be an expert in all of this (dream job, please!), I took a lot of extra time to _really_ understand these things. And for this, I turned to ChatGPT. 

#### ChatGPT
Here's my philosophy on ChatGPT: trust it to tell you correct syntax and explain basic concepts from a language, don't trust it to write all of your code. Where's the fun in having it write the code for me? And if I just ask ChatGPT to do this project for me, how am I supposed to be an expert? 

My learning workflow is typically this. Look at a tutorial, write some basic code to test it. When I have questions, turn to Chad. Chad, by the way, is the name my family has adopted for ChatGPT. Something is wrong? Blame Chad. Something is right? Pretend like you're Chad.

Chad helped me deepen my knowledge on some things I had glossed over in the past. Here's the deal. Early on in my career, I just learned enough to write good quality code. Sometimes, however, I glazed over the _deeper_ things. I _technically_ didn't need to know these things, because I knew syntax and how to free up memory and when to use smart pointers and all that good stuff. But I didn't know _how_ these things worked. Let me give you an example. I wanted to better understand this sentence: 

> Ruby is an "interpreted" programming language which means it can’t run on your processor directly, it has to be fed into a middleman called the "virtual machine" or VM.

Were this a job interview, I'd be able to give you a list of languages that are compiled and interpreted. No problem. But if I were to explain what an interpreted languages was, my answer would probably be something like this: "An interpreted language, like Python, is one that doesn't compile. Instead, it gets executed line by line as the program goes along. This is why you can have syntax errors at runtime like 'A not defined'. Because, up until that point, the interpreter didn't have to evaluate that." 

That's an _okay_ answer, but I wanted to know MORE. So, I turned to Chad. Chad told me how the interpreter in Ruby works. The interpreter goes line by line, unless you're doing something called Just-In-Time compilation. Let's assume that's not a factor. As it's parsing the code, it converts lines to bytecode. The virtual machine (VM) then takes each of the "lines" of bytecode and runs a corresponding operation. This operation could be a C function or some other low level thing. Then things get run, and voila! The code does what it's supposed to do. That's, of course, an oversimplication. The point being, I've found ChatGPT to be very useful to explain concepts I don't understand.

