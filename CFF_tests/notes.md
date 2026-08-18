# Table of Contents
* [Preparation & Design](#design)
* [Algorithm/Logic](#algo-logic)
* [Limitations & Current Issues](#limitations)
* [Ideas for Better Obfuscation](#future-ideas)
* [Before/After Results](#results)

## Preparation & Design <a id="design"></a>

Before starting the implementation, I spent time getting familiar with Control Flow Flattening and its purpose. To do this, I collected a few small code examples, wrote out the expected high-level code, and generated Control Flow Graphs (CFGs) to get a clear visual representation.

| Simple `if` | `if-else` | Nested `if` |
| --- | --- | --- |
| <img width="843" height="811" alt="1" src="https://github.com/user-attachments/assets/18ea385d-bd35-4ef7-99ad-35e11575632a" /> | <img width="813" height="1006" alt="2" src="https://github.com/user-attachments/assets/303480a4-dd38-4943-bf84-88bf9fbfaad4" /> | <img width="812" height="918" alt="3" src="https://github.com/user-attachments/assets/6587450d-f73c-419f-818a-c62843897eb0" /> |

Once I had a clear idea of how the technique worked, I needed to figure out how to implement it at the IR level for my mini-obfuscator project. I looked at how Clang generates LLVM IR from my CFF code examples, 
which helped me get familiar with the IR syntax, especially for the `switch`, and spot useful patterns for my algorithm.

After generating the CFG images, I started taking notes, spotting patterns, and planning my approach.
> **Note:** Some of these notes are from the very beginning. My final design changed while coding, but I kept these notes here for context.

|  |  |  |
| --- | --- | --- |
| <img width="1920" height="1080" alt="ifelse_both_return" src="https://github.com/user-attachments/assets/a7347c67-e3be-49cd-a8e9-0daec31807be" /> |<img width="1920" height="1080" alt="notes" src="https://github.com/user-attachments/assets/96023118-533f-4fdc-b75e-9fa995440f27" />| <img width="1920" height="1080" alt="Copy of ifelse_both_return (2)" src="https://github.com/user-attachments/assets/dcd4f0fe-09ae-40d8-ab7a-62c5d54ad45e" /> |

As I experimented more, I narrowed down what I wanted to focus on for this initial version.


Focus area:

- `void` functions
- `if`, `if-else` and nested `if` statements 
- code blocks before, inside, and after an `if` statement


## Algorithm/Logic <a id="algo-logic"></a>

After organizing my notes and ideas, I drafted the algorithm design before writing any code.

1. Drafted pseudocode: ex. decided early on to split conditions from code blocks using a zigzag approach across the instructions.
2. Tested traversal ideas: I initially tried doing a top-down traversal while performing transformations at the same time. This turned out to be a disaster because it became way too complicated and buggy. Instead, I used top-down traversal purely to split basic blocks and store them in a vector<BasicBlock*>, leaving the transformations for later.
3. Researched LLVM IR APIs: ex. looked into how to create basic blocks, manage branches, and split blocks programmatically in LLVM IR.

Also, after dealing with a few implementation challenges, this became the final algorithm logic for the pass:

```python
  1. Collect Basic Blocks (Top-Down Traversal)
   ├── Entry Block: Split allocas/args from function body.
   ├── Code + Condition Block: Split into pure code block and condition block.
   ├── Standard Code Block: Add directly to blocks list.
   └── Return Block: Add directly to blocks list.

2. Create Dispatcher Blocks
   └── Instantiated BBs for Switch, While-Loop, Default, and Break targets.

3. Map Switch Cases
   └── Assign every block in the list to a unique switch case ID.

4. Transform Branch Logic
   ├── Unconditional Branch: Update state variable -> Jump to Break BB.
   └── Conditional Branch: Generate True/False handler BBs -> Update state variable dynamically -> Jump to Break BB.

5. Finalize
   └── Link Entry Block directly to Dispatcher.
```

### Limitations & Current Issues <a id="limitations"></a>

At the moment, this pass is a basic proof-of-concept and not an advanced obfuscation tool. While it flattens control flow at a fundamental level, I believe
anyone familiar with  CFF or reverse engineering can reverse it fairly easily. 

Here is why the current implementation is easy to analyze:

* **Sequential case ordering:** The switch cases are stored and emitted in their original execution order because of how the traversal vector works.
* **Predictable state variable:** The state variable (named `b` in my implementation) is initialized at the top of the entry block as `int b = 0;`. Spotting this pattern makes it obvious how the control flow is being managed.

**Other current limitations:**

* **Logical operators:** No support for `&&` or `||` inside `if` conditions.
* **Loops & multiple returns** 

---

## Ideas for Better Obfuscation <a id="future-ideas"></a>

While building this technique, I thought of a few ways to make the obfuscation harder to reverse engineer:

#### 1. Case Shuffling

Currently, the switch cases follow the original execution order, making them simple to follow in a decompiler. Randomizing and rearranging the case order will 
force anyone analyzing the binary to jump around between non-sequential blocks, making manual analysis much more time-consuming. (I believe at least)

#### 2. Passing the Initial State via Dummy Parameters

Initializing `int b = 0;` inside the entry block always bothered me because it gives away the starting state immediately. While thinking about shuffling the cases, 
I knew the initial value would need to change anyway once the order was randomized... and then it clicked!

*What if I use one of the dummy parameters that my signature pass adds specifically for the dispatcher?*

The idea is:

1. The signature pass renames the function and adds extra dummy parameters.
2. The CFF pass shuffles the switch cases so the starting case ID is randomized.
3. At the call site, the caller passes the required starting state value directly into one of the dummy parameters.

This removes the explicit `int b = 0;` initialization from inside the target function, adding an extra layer of analysis difficulty.

Also, this idea cannot be implemented in main or variadic functions. It only works on candidate functions where dummy parameters can be added.

For main or variadic functions, I'm considering the approach below:

#### 3. Using 2 Formulas for the Initial State

Assuming case shuffling and dummy parameters are implemented, we can hide the starting state even further instead of assigning an explicit integer value (e.g., 0, 5, 22) right away. One way to do this is by using a mathematical formula to compute the starting state dynamically. For example, if the target starting state is 5, we could pass 12 into a formula that evaluates to 5.

I mentioned using two or more formulas to add variety. For instance, we could use one formula for functions with dummy parameters and another for standard functions like main. Using multiple formulas makes it harder to spot a pattern across the code, but even a single formula is still harder to analyze than a fixed, hardcoded number.

>**Note:** These ideas are based on my own logical reasoning rather than hands-on reverse engineering experience, but I plan to test and implement them in future updates.
## Before/After results <a id="results"></a>
Here is a quick before-and-after comparison of the code and IR graphs:

### `if` statement - alone
```cpp
  void _1_ifalone(int x) {
    // code block 0
    printf("start: x = %d\n", x);
    int y = x;
    if (x > 0) {
        // code block 1
        printf("condition true\n");
        y = y * 2;
    }
    // code block 2
    printf("end: y = %d\n", y);
}
```
| before | splitted | after |
| --- | --- | --- |
| <img width="769" height="664" alt="_1_ifalone_before" src="https://github.com/user-attachments/assets/aa77ce2b-1447-45c8-b105-8132219dc876" />| <img width="769" height="904" alt="_1_ifalone_splitted" src="https://github.com/user-attachments/assets/7d1e6b0b-dd9e-4ff0-b99c-f72d1a470a67" />| <img width="1659" height="1275" alt="_1_ifalone_after" src="https://github.com/user-attachments/assets/eebb09ba-10bf-4564-b26e-7c4de42976d6" /> |


### `if-else` statement
```cpp
void _2_ifelse(int x, int a, int b) {
    // code block 0
    printf("start: x = %d\n", x);
    int y = x + 1;
    if (x > (a == b)) {
        // code block 1
         printf("condition true\n");
         y = y * 2;
    } else {
        // code block 2
        printf("condition false\n");
         y = y * 0;
    }
    // code block 3
    printf("end: y = %d\n", y);
}
```
| before | splitted | after |
| --- | --- | --- |
| <img width="1080" height="844" alt="_2_ifelse_before" src="https://github.com/user-attachments/assets/62cef90a-c578-4889-a69a-ac979cb970a1" />| <img width="1080" height="1084" alt="_2_ifelse_splitted" src="https://github.com/user-attachments/assets/f848c23d-9a56-4d1c-a60b-f0d66a6eb501" />| <img width="1625" height="1475" alt="_2_ifelse_after" src="https://github.com/user-attachments/assets/d2672bff-2dfa-4dcc-9930-af4e6d92920f" />|

## flat `if`s
```cpp
void _3_flat_ifs(int x) {
    // code block 0
    printf("start: x = %d\n", x);
    int y = x;
    // code block 1 (if statement 1)
    if (x < 0) {
        printf("if 1: x is negative\n");
        y = y + 10;
    }
    // code block 2 (if statement 2)
    if (x == 0) {
        printf("if 2: x is zero\n");
        y = y + 100;
    }
    // code block 3 (if statement 3)
    if (x > 0) {
        printf("if 3: x is positive\n");
        y = y * 2;
    }
    // code block 4
    printf("end: y = %d\n", y);
}
```
| before | splitted | after |
| --- | --- | --- |
| <img width="772" height="1445" alt="_3_ifflat_before" src="https://github.com/user-attachments/assets/071acd8b-5021-4d76-ab6d-be32a2463b41" />| <img width="769" height="1685" alt="_3_ifflat_splitted" src="https://github.com/user-attachments/assets/8d9cec6a-598c-486b-ad31-d2e043159887" />|<img width="3501" height="1284" alt="_3_ifflat_after" src="https://github.com/user-attachments/assets/fa956dca-3d07-46b4-8a0b-bb8289cf515f" />|

## nested `if`
```cpp
void _6_ifnested(int x, int a, int b) {
    // code block 0
    printf("start: x = %d, a = %d, b = %d\n", x, a, b);
    int y = x + 1;

    if (x > a) {
        // code block 1
        printf("outer condition true (x > a)\n");
        y = y + 5;

        if (y > b) {
            // code block 2
            printf("inner condition true (y > b)\n");
            y = y * 2;
        } else {
            // code block 3
            printf("inner condition false (y <= b)\n");
            y = y - 3;
        }
    } else {
        // code block 4
        printf("outer condition false (x <= a)\n");
        y = y * 0;
    }

    // code block 5
    printf("end: y = %d\n\n", y);
}
```
| before | splitted | after |
| --- | --- | --- |
|<img width="1408" height="1335" alt="_6_ifnested_before" src="https://github.com/user-attachments/assets/7a710abe-b3ef-4811-b328-a7e515037d4a" />|<img width="1408" height="1615" alt="_6_ifnested_splitted" src="https://github.com/user-attachments/assets/bd5c8076-ed41-40b5-b7fb-0196901f9587" />|<img width="3063" height="1564" alt="_6_ifnested_after" src="https://github.com/user-attachments/assets/8c334d8e-a21a-49ae-a162-22f59bd44e71" />|
