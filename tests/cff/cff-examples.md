# Table of Contents
- [Overview](#overview)
- [Basic Control Flow](#basic-control-flow)
  - [If / Else](#if--else)
  - [For Loop](#for-loop)
  - [While Loop](#while-loop)
  - [Goto](#goto)
  - [Switch](#switch)
- [Hardening](#hardening)
  - [Dispatcher Case Shuffling](#dispatcher-case-shuffling)
- [Edge Cases](#edge-cases)
  - [Cross-Block Values-Users (Dominance)](#cross-block-values-users-dominance)
  - [PHI Node Handling](#phi-node-handling)
  - [Dynamic Alloca](#dynamic-alloca)

---

# Overview

The repository contains the full set of generated CFGs and test cases.  
This page shows representative examples of how the Control-Flow Flattening (CFF) pass transforms common control-flow constructs, plus a few hardening and edge-case examples.

For every example:
- The **first** code block is the original source
- The **second** code block is a high-level / simplified view of the same function after CFF, shown only for easier understanding.
- The images show the CFG **before**, after basic-block splitting, and after flattening that the pass does. 

---

# Basic Control Flow

## If / Else

**Source:** [`cff/supported/_01_ifs.c`](cff/supported/_01_ifs.c)  
**Function:** `_01_if_else`

**Original**

```c
int _01_if_else(int x)
{
    if (x > 0)
        return x + 10;
    else
        return x - 10;
}
```

**After CFF (high-level example/demostration)**

```c
int _01_if_else(int x)
{
    int b = 0;
    while (1) {
        switch (b) {
            case 0: b = (x > 0) ? 1 : 2; break;
            case 1: %ret_val = x + 10; b = 3; break;
            case 2: %ret_val = x - 10; b = 3; break;
            case 3: return %ret_val;
            default: break;
        }
    }
}
```

### CFG

| Before | Split | Flattened |
| :---: | :---: | :---: |
| <img width="679" height="544" alt="_01_if_else_before" src="https://github.com/user-attachments/assets/ec2f81b4-64b3-4e4f-b615-176c2297f374" /> | <img width="679" height="784" alt="_01_if_else_splitted" src="https://github.com/user-attachments/assets/444bd578-bc5b-4fad-a4f2-bf870f161cf6" /> | <img width="1926" height="744" alt="_01_if_else_after" src="https://github.com/user-attachments/assets/bb3b53c0-5f28-4032-9dfa-093cd906f6dc" /> |

---

## For Loop

**Source:** [`cff/supported/_02_loops.c`](cff/supported/_02_loops.c)  
**Function:** `_00_for_simple`

**Original**

```c
int _00_for_simple(int n)
{
    int sum = 0;

    for (int i = 0; i < n; i++)
        sum += i;

    return sum;
}
```

**After CFF (high-level example/demostration)**

```c
int _00_for_simple(int n)
{
    int b = 0;
    int sum, i;
    while (1) {
        switch (b) {
            case 0: sum = 0; i = 0; b = 1; break;
            case 1: b = (i < n) ? 2 : 4; break;
            case 2: sum += i; b=3; break;
            case 3: i++; b = 1; break;
            case 4: return sum;
            default: break;
        }
    }
}
```

### CFG

| Before | Split | Flattened |
| :---: | :---: | :---: |
| <img width="741" height="804" alt="_00_for_simple_before" src="https://github.com/user-attachments/assets/6c7715d4-604c-4110-b9c0-0dfa4a9bac9e" /> | <img width="741" height="924" alt="_00_for_simple_splitted" src="https://github.com/user-attachments/assets/921ee89a-962d-43d4-8f30-e555302aa578" /> | <img width="1937" height="784" alt="_00_for_simple_after" src="https://github.com/user-attachments/assets/c32dc9ff-9c16-4a6b-855e-1c89a04e1e1c" /> |

---

## While Loop

**Source:** [`cff/supported/_02_loops.c`](cff/supported/_02_loops.c)  
**Function:** `_01_while_simple`

**Original**

```c
int _01_while_simple(int n)
{
    int i = 0;
    int sum = 0;

    while (i < n) {
        sum += i;
        i++;
    }

    return sum;
}
```

**After CFF (high-level example/demostration)**

```c
int _01_while_simple(int n)
{
    int b = 0;
    int i, sum;
    while (1) {
        switch (b) {
            case 0: i = 0; sum = 0; b = 1; break;
            case 1: b = (i < n) ? 2 : 3; break;
            case 2: sum += i; i++; b = 1; break;
            case 3: return sum;
            default: break;
        }
    }
}
```

### CFG

| Before | Split | Flattened |
| :---: | :---: | :---: |
| <img width="691" height="684" alt="_01_while_simple_before" src="https://github.com/user-attachments/assets/8ac52b71-e586-4ab5-8506-9d0e20c488f4" /> | <img width="691" height="804" alt="_01_while_simple_splitted" src="https://github.com/user-attachments/assets/5a88d464-d04e-4728-8316-442067779038" /> | <img width="1585" height="824" alt="_01_while_simple_after" src="https://github.com/user-attachments/assets/ffe07483-5888-430c-9e34-8a46fa8ca53f" /> |

---

## Goto

**Source:** [`cff/supported/_03_goto.c`](cff/supported/_03_goto.c)  
**Function:** `_01_goto_two_labels`

**Original**

```c
int _01_goto_two_labels(int x)
{
    if (x > 0)
        goto big;

    goto small;

big:
    return x + 10;

small:
    return x - 10;
}
```

**After CFF (high-level example/demostration)**

```c
int _01_goto_two_labels(int x)
{
    int b = 0;
    while (1) {
        switch (b) {
            case 0: b = (x > 0) ? 1 : 2; break;
            case 1: %ret_val = x + 10; b = 3; break; // big
            case 2: %ret_val = x - 10; b = 3; break; // small
            case 3: return %ret_val;
            default: break;
        }
    }
}
```

### CFG

| Before | Split | Flattened |
| :---: | :---: | :---: |
| <img width="679" height="664" alt="_01_goto_two_labels_before" src="https://github.com/user-attachments/assets/f8701839-f0fe-45eb-92e8-58afed52ae58" /> | <img width="691" height="904" alt="_01_goto_two_labels_splitted" src="https://github.com/user-attachments/assets/164cd783-3624-43c3-a636-34bb29db7100" /> | <img width="2555" height="784" alt="_01_goto_two_labels_after" src="https://github.com/user-attachments/assets/0afba7bb-d680-4c13-b1b2-c88c77d0fae0" /> |

---

## Switch

**Source:** [`cff/supported/_04_switch.c`](cff/supported/_04_switch.c)  
**Function:** `_00_switch_simple`

**Original**

```c
int _00_switch_simple(int x)
{
    int result = 0;
    switch (x) {
        case 1: result = 10; break;
        case 2: result = 20; break;
        case 3: result = 30; break;
    }
    return result;
}
```

**After CFF (high-level example/demostration)**

```c
int _00_switch_simple(int x)
{
    int b=0;
    int result = 0;
    while(1){
      switch(b){
        case 0:
          switch (x) {
            case 1: b = 1; break;
            case 2: b = 2; break;
            case 3: b = 3; break;
          }
          break;
        case 1: result = 10; b = 4; break;
        case 2: result = 20; b = 4; break;
        case 3: result = 30; b = 4; break;
        case 4: return result;
      }
    }
}
```

### CFG

| Before | Split | Flattened |
| :---: | :---: | :---: |
| <img width="981" height="584" alt="_00_switch_simple_before" src="https://github.com/user-attachments/assets/c34974b2-be70-4071-81d1-8e6653dcc9e2" /> | <img width="981" height="704" alt="_00_switch_simple_splitted" src="https://github.com/user-attachments/assets/aca757ac-03bd-4024-a920-eea11a270a69" /> | <img width="2443" height="995" alt="_00_switch_simple_after" src="https://github.com/user-attachments/assets/6c432c5e-b40c-432b-afd9-2890b84f87dc" /> |

---

# Hardening

The flattening pass can optionally apply hardening so the dispatcher is less predictable.  
Currently supported: **case shuffling**. Future work includes state-variable hiding and using dummy parameters from the Signature Obfuscation pass as a state-variable (if a function has dummies).

## Dispatcher Case Shuffling

**Source:** [`cff/supported/_05_for_obf_levels.c`](cff/supported/_05_for_obf_levels.c)  
**Function:** `_00_no_args_globals`

**Original**

```c
int _00_no_args_globals(void)
{
    g_counter += 5;
    int sum = 0;
    int i = 0;

    while (i < 4) {
        sum += g_config[i] + g_counter;
        i++;
    }

    return sum;
}
```

> Case numbers stay the same logically, but the physical order of the switch cases in memory is randomized.

### Comparison

| Base Flattening | Shuffled Cases |
| :---: | :---: |
| <img width="2057" height="904" alt="_00_no_args_globals_after" src="https://github.com/user-attachments/assets/08ac5c64-baf2-43ed-990b-f4708dc8b39d" />| <img width="2058" height="904" alt="_00_no_args_globals_after" src="https://github.com/user-attachments/assets/f4ca7c39-9845-4df0-8a56-ebecf272c102" />|

---

## Cross-Block Values-Users (Dominance)

**Source:** [`cff/supported/_01_ifs.c`](cff/supported/_01_ifs.c)  
**Function:** `_87_if_OR3`

**Original**

```c
int _87_if_OR3(int a, int b, int c)
{
    if (a > 0 || b > 0 || c > 0)
        return (a > 0 ? a : 0)
             + (b > 0 ? b : 0)
             + (c > 0 ? c : 0);

    return 0;
}
```

> Values defined in one block may no longer dominate their uses after flattening. The pass demotes those values to stack memory (`alloca`) so LLVM dominance rules stay valid.

### CFG

| Before | Split | Flattened |
| :---: | :---: | :---: |
| <img width="865" height="2057" alt="_87_if_OR3_before" src="https://github.com/user-attachments/assets/052b92c9-d151-46fb-9354-c3963a8403bc" /> | <img width="1079" height="2777" alt="_87_if_OR3_splitted" src="https://github.com/user-attachments/assets/438f7299-a5a4-4066-a1bb-4f7290b1c1ce" /> | <img width="7633" height="1164" alt="_87_if_OR3_after" src="https://github.com/user-attachments/assets/a5f610a2-16a7-4704-b97c-d0e091e3a049" /> |

---

## PHI Node Handling

**Source:** [`cff/supported/_01_ifs.c`](cff/supported/_01_ifs.c)  
**Function:** `_57_ternary_before_if`

**Original**

```c
int _57_ternary_before_if(int a, int b)
{
    int x = (a > b) ? a : b;

    if (x > 10)
        return x * 2;

    return x + 2;
}
```

> PHI nodes depend on their immediate predecessors. Once the dispatcher is inserted those predecessors change, so the pass demotes the PHI nodes to memory before flattening.
> In the before CFG you can see the `PHI` in block `%14`. In the split CFG the `PHI` has already been demoted: its `alloca` lives in the `entry` block and the `load/store` happens in block `%15`.

### CFG

| Before | Split | Flattened |
| :---: | :---: | :---: |
| <img width="691" height="995" alt="_57_ternary_before_if_before" src="https://github.com/user-attachments/assets/65e7cabb-ecd4-4b58-84c0-c7075234e89a" /> | <img width="835" height="1395" alt="_57_ternary_before_if_splitted" src="https://github.com/user-attachments/assets/490d9c9a-0e4b-42e4-a7de-ffc67027876b" /> | <img width="3659" height="904" alt="_57_ternary_before_if_after" src="https://github.com/user-attachments/assets/66a08037-7991-4f6c-8988-3f4a6513af1c" /> |

---

## Dynamic Alloca

**Source:** [`cff/supported/_02_loops.c`](cff/supported/_02_loops.c)  
**Function:** `_63_dynamic_alloca_pointer`

**Original**

```c
int _63_dynamic_alloca_pointer(int n, int x)
{
    int size = (n > 0) ? n : 1;
    int local[size];
    int *p = local;
    int sum = 0;

    for (int i = 0; i < size; i++)
        p[i] = x + i * 2;

    for (int i = 0; i < size; i++)
        sum += *(p + i);

    return sum;
}
```

> Variable-length arrays produce dynamic `alloca`s. These cannot be moved to the entry block, so the pass keeps them at their original locations while still preserving pointer lifetimes across the dispatcher.

### CFG

| Before | Split | Flattened |
| :---: | :---: | :---: |
| <img width="1205" height="2045" alt="_63_dynamic_alloca_pointer_before" src="https://github.com/user-attachments/assets/76642a30-4fdb-4318-9018-50a4df5ef202" /> | <img width="1205" height="2325" alt="_63_dynamic_alloca_pointer_splitted" src="https://github.com/user-attachments/assets/34ee0d92-e6ba-4477-bbfb-76252a1c0244" /> | <img width="5557" height="1224" alt="_63_dynamic_alloca_pointer_after" src="https://github.com/user-attachments/assets/fd27ec68-6a5e-4913-a432-82862a9ae721" /> |

---

> These are only representative examples. The full set of test programs, IR, and CFG images lives in [`tests/cff/`](cff) directory.
