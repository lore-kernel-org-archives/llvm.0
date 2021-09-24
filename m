Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314063FC8
	for <llvm@lists.linux.dev>; Fri, 24 Sep 2021 17:52:04 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id y26so4051888lfa.11
        for <llvm@lists.linux.dev>; Fri, 24 Sep 2021 10:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=gsacpeo4NPjtRQT2ggwp64bjp546SN7DdbXM27UihDo=;
        b=S44Qum5JpgoNPbd1FRa3Tcen09oA3wLGM0KSeQCk4boEJwCRnp4YVdQbJCQnyoWp14
         Z7ZLMLbcqGzrJOYWk2W2MI24lHi2ebWY2SmZrAPpFhWD/vqJ6nbh+YI9VlC921z1g3U3
         8A27t7OdDkfh5+1x26Nfuqahxeu/eC6KwJaOtLalI/uob8ZovLtTNhTRPPxV/YyE4a8b
         L5A9TdZ6/EndvpaDCwYBN+u3stf1bPkJRMW52XkAwyf0qAIY7qillUnqKXiOKAWvYVbB
         tvttImxSsvW79htj3f+2p5eIGN3u/g61UEYdVRyBrSiodZWoJ4xef0klpnMn+v/MXAvn
         nBcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=gsacpeo4NPjtRQT2ggwp64bjp546SN7DdbXM27UihDo=;
        b=emfZ0/cv77MBuejIj3i65nxgEUqxZNgR4m0IQ6XVn6zYRRh1YEZX+RPmP/WYcfoYu3
         xyIwzQ7eSOIcS7Xhm9iat2S+1DwH071Z4FoCK+JM1Eb2JbJlBx9/Dgln+d1FB+zsCm8v
         V61LPbA2lKtQqdhaOR+FFukA/2xjd9+MAj9N2ocFElJ5fOwji+VfYOCY8CpS9Hijjuks
         lBxor6XHxLiEKZ/JbjJAPb4Lo2edHjeonXrzP/QMIBIwNtux1Sg50N2F3ZMWnW1F3gIq
         g4kPykrdN8a9XkLQOd1jsFgqN9tHIEXpbAv/N6FDLL+RkDk+3ri0otOUpFPo2BsqHgbO
         vMMA==
X-Gm-Message-State: AOAM5314Th5uGjWbXTsyDTs1iU+7i799xbFNxIA3oeHCk10IFIIVKBJz
	JapyBYgqS8j6inPTwtqvRqe0VxGPR/jyhzLPyLpNTMXUeu6Teg==
X-Google-Smtp-Source: ABdhPJzm8FWvamyui2X+jYJD2D+TnjXJSoNOdCzYsalswKqZk0La8LTPMj6RENP6J4j48sifYzxQA3UeeoVRrObN7P0=
X-Received: by 2002:a2e:7805:: with SMTP id t5mr12809644ljc.220.1632505921199;
 Fri, 24 Sep 2021 10:52:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 24 Sep 2021 10:51:48 -0700
Message-ID: <CAKwvOdkbTQhfEHsmjAK4Koc0-o75fJMkD1yN9tvBA-kUtvHaKQ@mail.gmail.com>
Subject: notes from Toolchains MC at Linux Plumbers Conf 2021
To: llvm@lists.linux.dev, linux-toolchains@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

https://matrix.lpc.events/#/room/#toolchain-and-kernel-mc:lpc.events
https://lpc2021.org/2021/09/24/toolchains-and-kernel-mc/


Compiler Features for Kernel Security
====

https://outflux.net/slides/2021/lpc/compiler-security-features.pdf


-fstack-protector-guard= needs more arch support.
-fzero-call-used-regs= GCC 11+ support.
stack variable auto initialization; GCC 12+ (https://lwn.net/Articles/870045/)
 support and clang. Shipped in Android + CrOS already.
 Array bounds checking. Avoid 0-element arrays with
-Wzero-length-array. -Wzero-length-bounds. -Warray-bounds,
-fsanitize=bounds

Multiple issues with -Warray-bounds on 0/1 element arrays,
__builtin_object_size().

"a non-default flag for only treating flexible array members that way
is ok, but there are thousands of programs in the wild that rely on
[0] or [1] or even [2] or more act as flexible array members that
doing this by default is not an option"

__builtin_dynamic_object_size.

Need attributes to turn off signed integer overflow. Need unsigned
overflow sanitizer in GCC; wrapping is defined but sometimes
unexpected (pointer arithmetic).

LTO necessary for CFI?

CET x86 and PAC ARM

does struct layout randomization work for dynamically loaded kernel
modules?  Yes via shared seed.

Randy:  i want #error or #warn to be able to print values (like
#defines or calculated values)


Optimizing Linux Kernel with BOLT
====

Binary optimization layout tool. Defragment/layout hot code based on
profile data that otherwise suffers high front end stalls from I$
misses. x86 ELF currently, aarch64 WIP. Can use instrumentation
profiles if LBR is unavailable.

Q: I'm wondering what the optimization passes are: your audio is very
blurred here, so if you talked about it was mostly lost. Movement of
basic blocks? All I heard was "basic blocks".
A: Yes.

Q: I do wonder why PGO can't do as good a job as BOLT.  It doesn't
feel like there's anything fundamental stopping it.  So what's the
major benefit against PGO?
A: Context sensitivity.

Q: is debug info rewritten?
A: Yes, v4 currently and split. v5 WIP.

Sun Studio compiler did this too. via: -xlinkopt option

What symbols need to be updated, can we add new sections? use LOAD segments?

Q: Does BOLT inlining maintain symbol interposition in user code?
Would this be an issue for loadable modules or BPF?
A: inlining comes from the compiler, mostly. Not sure about BPF
loadadble modules (modules can't do interposition). "as long as it
doesnt change EXPORT_SYMBOL it should not"

The never-ending saga of control dependencies
======

What are they? Weaker-than-acquire memory barriers. See
memory-barriers.txt for more examples.

Finer grain barriers than "memory" clobbers possible, just need
compiler vendors to agree on new clobber name.
https://gcc.gnu.org/PR100953

(In all cases the compiler can implement this as just  "memory" so it
is easy for all compilers to implement)

Q: Has the advantage of using these control dependencies vs explicitly
barriers been quantified somehow?
A: It is hugely hardware dependent. It can be significant on the
weaker architectures (ARM, PowerPC, maybe RISCV, ...). It might help
on stronger architectures (x86, s390, ...) due to allowing more
compiler optimizations.
https://lore.kernel.org/lkml/1437012028.28475.2.camel@ellerman.id.au/
this is a somewhat special example, Michael Ellerman once reported a
small speed up when lwsync -> isync+ctrl to implement acquire for ppc
atomics on Power8
Q: If the best data we have is a small speed on Power8, is doing this
worth the trouble?
A: see also the "subtle breakage may occur" point from the slides

Q: what about address+data dependency compiler support rather than
control dependencies?
A: hasn't been discussed? Some university students looking into maybe
a compiler pass to try to find issues/breakage; but too early to
share.

subscribe/post to: linux-toolchains@vger.kernel.org

Report from the Standards Comittee
=======

maybe C++26 or C++29 for RCU/hazard pointers/asymmetric fences. RCU
has had some changes for C++ standardization. Check out cppcon Oct
20th for more info.

volatile_load<T> and volatile_store<T> WIP

Q: Can you have smart pointers that forbid delete until you synchronize_rcu()?
A: Need more info. Follow up via email. "have the smart_ptr do
call_rcu when it hits ref==0". "that sounds a lot like the old URCU
defer_rcu()."

Q: the strategy to call synchronize_rcu() if allocation fails (for
call_rcu()) wouldn't work for scenarios like the one you described
yesterday where you have a nested read lock and update, would it?
A: Exactly.

Q: Can we get attributes that helps with dependency ordering on non-pointers?
A: Hasn't been brought up in committee yet.

Q: what about UB discussions?
A: expect a food fight.

Objtool for arm64
=========

objtool is a host tool used by x86 port; object file validator and
patching utility. Relies on control flow reconstruction from binary
analysis.

Q: don't you want static call support on arm64?
A: idk, no retpoline. Indirect predictors work well, need analysis to
show otherwise. Ard might have patches.  It's not a reason to use
objtool.

Can we start with just a binary validator?  Will folks start patching
rather than fix the tools? Failures to track control flow are objtool
bugs, not compiler bugs; we don't want to be turning off compiler
optimizations.  Can we do anything in the toolchain? Can the toolchain
generate ORC unwinding metadata?

DWARF has asynchronous unwinding, but the DWARF unwinder was removed
for being huge and complicated.

Can we get a spec for what's needed?

"In general it's not possible to reconstruct control flow from a binary."

Looking for description of problem for arm64 jump tables with
disassembly. Can DWARF provide this info?

Q: Would the same issues arise for userspace live-patching? (wrt
kernel-specific compilation flags)
A: Exception handling frames different from DWARF? "Weird stuff" in assembly.

Q: do we have an ORC spec somewhere?
A: read the code
R: Formalize a spec

The arm64 unwinder isn't precise; it relies on the PC then the LR (and
maybe the SP).  Mark Rutland has additional slides.
https://linuxplumbersconf.org/event/11/contributions/971/attachments/808/1794/unwinding-arm64.pdf

Rust Toolchain and the Kernel
=======================

Rust has nightly/unstable features (language extensions); some are
used by the kernel patches so far.  But we prefer to use a stable
compiler.

Q: how does Rust compilation differ from C compilation?
A: Still per TU based, but a TU is a crate which can contain multiple
files. Rust doesn't have headers.

Q: How can the Linux kernel community who are interested in Rust help
accelerate the GCC implementation to ensure that Rust has the same
portability and diversity of toolchain support as the current kernel
implementation languages? Encouraging cooperation between Rust, Rustc,
Rust Foundation and GNU Toolchain. Participating in the GNU Toolchain
development and/or providing funding for developers. Etc.
A: We need certain language features, support is needed finalizing
those features.  Rust GCC and rustc_codegen_gcc are additional
implementations.  https://github.com/Rust-for-Linux/linux/issues/2
Could create a shared mailing list for Rust toolchain issues or use
linux-toolchains@vger.kernel.org.

To elaborate on that: the Rocket project used nightly rust for a long
time, but it helped that they had a comprehensive list of Rust nightly
features they needed and why they needed them, and that helped Rust
and Rocket meet in the middle so that now Rocket runs on stable Rust.

Discussion about `unsafe`  fn and `unsafe` blocks. Potential change
for a future edition would make the body of an unsafe function not
automatically an unsafe block. Note: would be helpful to get feedback
on that issue from the Rust-in-Linux folks, because there's still some
significant debate about whether that's the right change to make.
(There's a concern that it'd generate lots of noise and churn if it
turns out the majority of unsafe function bodies to require unsafe
blocks.)
- It'd help to have that feedback in the upstream issue
(https://github.com/rust-lang/rust/issues/71668), on behalf of the
Rust-in-Linux project.

Q: How should language versioning work?
A: Flags?

Q:Do you need procedural macros? (Asking because for gccrs it will be
an interesting problem to implement them compared to "normal" macros
by example)
A: Yes, there's a crate for them. See "macros" crate.

Q: Does bindgen rely on libclang? Can it be made more robust by using
DWARF (or maybe CTF) to generate the Rust types? Or are there features
that really rely on C header parsing (which feels more fragile than
using the binary encoding in DWARF/CTF)
A: Build times may be faster to parse headers than have the compiler
dump debug info. Perhaps libabigail can help (consumes DWARF).
https://sourceware.org/libabigail/

Q: How to call C inline functions/macros from Rust?
A: Need C wrappers. :(

Q: What ABI issues have been hit or are forseen?
A: still issues with bindgen (opaque types used in some places to work
around these). Avoid mixing GCC kernels with rustc, or LLVM kernels
with gcc_rs, etc?
- There's no compatibility or ABI issue between GCC-compiled C code
and rustc-compiled Rust code. There seems to be a widespread
perception that there's an issue there, but there's no issue; that
combination is widely tested, commonly used, and upstream rustc will
notice and fix any issues there.

Might be helpful to have Rust for kernel hackers documentation.
Discussions with Shuah about training/mentorship.  LWN articles.

Q:


-- 
Thanks,
~Nick Desaulniers
