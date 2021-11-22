Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ABB62C82
	for <llvm@lists.linux.dev>; Mon, 22 Nov 2021 01:28:18 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id bi37so73061339lfb.5
        for <llvm@lists.linux.dev>; Sun, 21 Nov 2021 17:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JQBKetcpJclmgXDEEWc882DzcuUV73xU+80NQgBbGLI=;
        b=GAPUEw9X0kKyZZlGO5XB8U+YkCk265yCzyYCHPDktTkosd7zBM3NUZeMk+Kyj+ZB+A
         innj3uhyMc8ysQszyR7+yyRerEgsExgvRqAbEHE6sb9U7/eVarQClv+djHMKbUCyVq8v
         EYlfPwGb2Muin2dYkTH2KXUYzXt+yBfbgc4CzqO7AayGlEKtZzbXTt8llhVVK/bvzQB5
         Fu4yuC2CJC5DjVPxmSuNLGFDDpKPCVNpnEYnHss06WS77NjrvXXmPMDyz4ZK7w9oVk3w
         wn0OoYfa6BozZNmcgvbisaFTehwkVvebH5Gti2nLSn74cXtkbn8fhDhxxfgZ+RY4K/Ek
         FFfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JQBKetcpJclmgXDEEWc882DzcuUV73xU+80NQgBbGLI=;
        b=2D2f9Zw56B5eZAaknbcZ+Auzx3I84KZx7OA+IzHjKoJYJKn12I8Mt3sqfyMz6gtvPn
         8L1NZpRy5MMTQBU32kNWhlvRCxfQKF1DmH2aiQIVMb8UG3DSoY3qKUd4jOj4PObVrxL/
         ipgfSQ9ps+lYfIa5S8ZxBHbtoXlDzYLaOIPiLB+/KYqfhnJEwpsedkmgeYffcyQzQO4b
         /Y5+FdGsEW68uTb0EqhXZTrLauTilxUGxX/iR5sOc4ib6vyGD64WJdOckoEqiolut4Cl
         48oCAVV3kFDy3UQ1Fvz3IPMIZVX2CPEfKM0Y0EXgIWVRlAc9otvi7xEDZ5L0J1DPmpeV
         axTQ==
X-Gm-Message-State: AOAM533S+U4HJB4y4kAwvHdsmgPqk2ksf0IwBGDrj+J9R008AwcB/4TV
	Q9BfHQ5lv4CeZ4lI5l5UmHdSIinEw/wMdXwUA6Xq9Q==
X-Google-Smtp-Source: ABdhPJxHA5JqHz/yBDEt5yXq3CEZBNGVB/nlDL1F0iuMv/9LE8l0rlZfBjCFjh0+uEYXqm4FP96aQsP5ThS5cf1+gN8=
X-Received: by 2002:a05:6512:3b9c:: with SMTP id g28mr53219945lfv.651.1637544495993;
 Sun, 21 Nov 2021 17:28:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHk-=wh-f=eyP3i6nc8Hj49E4UKtgYionLs4LZbZYDorh3OLjQ@mail.gmail.com>
In-Reply-To: <CAHk-=wh-f=eyP3i6nc8Hj49E4UKtgYionLs4LZbZYDorh3OLjQ@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Sun, 21 Nov 2021 17:28:04 -0800
Message-ID: <CAKwvOdkAf4oG+0RO+fwOC2qO4203j=0PQ=3BaLD7XoEo44_6_A@mail.gmail.com>
Subject: Re: New clang warning.
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev, 
	Bill Wendling <morbo@google.com>, Tom Stellard <tstellar@redhat.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, Nov 21, 2021 at 1:56 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Ok, so I don't think this is new, it's just that I updated my distro,
> and am now running clang-13.
>
> And I think I've seen things like this before (it looks a bit
> familiar, even if the exact details aren't - I think I've seen
> something very similar this with the bit test functions, for example),
> and others probably have too:
>
>   WARNING: modpost: vmlinux.o(.text+0x77d8e):
>         Section mismatch in reference
>          from the function __next_node()
>         to the variable .init.data:numa_nodes_parsed
>   The function __next_node() references
>   the variable __initdata numa_nodes_parsed.
>   This is often because __next_node lacks a __initdata
>   annotation or the annotation of numa_nodes_parsed is wrong.
>
> and that warning is just very misleading.
>
> What happens is that __next_node() is an inline function, that is not
> inlined, but specialized from a caller in an __initcode section. And
> one of the arguments ends up being that numa_nodes_parsed that is
> __initdata.
>
> And that's all fine.
>
> What is *NOT* fine is that when clang specializes that function, it
> does so in a different section than the calling function. So the
> specialized copy of __next_node() is _not_ in the __initcode section,
> and then modpost warns.
>
> The code is harmless, but I really think this is a clang bug.
>
> We could avoid it with __force_inline - and I think that's what we've
> done before when it was really just clang making bad inlining
> decsisions. But that function really doesn't need forced inlining.
> Making an out-of-line specialized copy is perfectly fine.
>
> No, the problem is purely that the out-of-line copy of the inline
> function is done in the wrong section, I feel. It should inherit the
> section from the caller, I believe. That's the whole point of
> sections, after all (think using different sections for things like
> cold code - inline functions specialized for cold code functions
> should themselves also be cold). And it would also make the modpost
> warning go away.
>
> I realize that clang-13 isn't exactly cutting edge, but the warning is
> a bit annoying (even if not fatal - modpost wardnings are not compiler
> warnings affected by -Werror).

Thanks for the report; they are always appreciated.

I believe I fixed that individual warning via:
https://reviews.llvm.org/rG9697f93587f46300814f1c6c68af347441d6e05d
which is in clang-14.  It's probably not too late for us to request a
backport into the 13.1 release (but is for the 13.0 release).  Sorry I
did not have it fixed in time for the 13.0 release; we did know it was
an issue ASAP, but this issue is...nuanced.

The issue tracking this is
https://github.com/ClangBuiltLinux/linux/issues/1302.
It's a bit of a long read, and the issue is still not fully resolved;
if you do an allmodconfig, you'll find a few more modpost warnings for
numa_nodes_parsed and a few others.

LLVM's "New Pass Manager" became default-on for the clang-13 release
which significantly changed how passes are ordered in LLVM (for the
better, I think).  That tickled this particular issue.

It's not one pass that's "specializing" these functions, but 2.
"Intra-Proceedural Sparse Conditional Constant Propagation (IPSCCP)"
sinks the constants.  Then "Dead Argument Elimination" sees the
function arguments are now un-used and removes them (from frame record
setup in callers, too).

You can see https://reviews.llvm.org/D97971 (which never landed) where
I tried to encode some of the rules to limit IPSCCP.  At some point,
it starts to feel like we're hampering IPSCCP for rules specific to
the kernel regarding "thou shalt not reference .init.data from non
.init text" but perhaps that approach could be refined with more
nuance.  Perhaps "though shalt not IPSCCP constants with explicit
sections at all" though that also feels like perhaps overkill.

For the actual warnings though, I think there's at least 3 problems (I
haven't had enough time to focus on getting them all fixed, so there
may be more than 3).  Here's how I'd break them down.

Functions aren't getting inlined when perhaps they should be.  When we
have calls to "intrinsics" (how we represent calls to
__builtin_constant_p, __builtin_object_size, etc), these aren't
runtime calls (__builtin_object_size can be, now, as of recently, but
that depends on one of the parameters).  So when you have something
like:

if (__builtin_constant_p(...))
  five_instructions();
else
  seven_instructions();

The "cost to inline" such a function is either five or seven, but not
twelve.  LLVM doesn't know that the intrinsics for
__builtin_constant_p and __builtin_object_size aren't emitted at
runtime, so it thinks the cost of my example above is twelve.  So we
don't inline functions that appear large but later are optimized down.

https://reviews.llvm.org/rG9697f93587f46300814f1c6c68af347441d6e05d
addressed the intrinsic for __builtin_constant_p.
https://reviews.llvm.org/D111456 fixes the intrinsic for
__builtin_object_size (used extensively for -fsanitize=object-size,
part of ubsan).  But I need to revise https://reviews.llvm.org/D111456
to handle dynamic builtin object size.  I also have a patch that
revises both to more carefully answer the question more precisely
"would inlining foo into bar actually help foo?" It's unpublished and
needs more work.

The final issue is that when we turn on ever sanitizer under the sun
(via allmodconfig), some of our functions get so large that some basic
blocks are assumed to be "cold" so they are penalized for inline cost.
This smells like a bug where when we instrument code for the
sanitizers, we need to weight the edges to exception handling blocks
as unlikely.  But I haven't had time to look into this.

All that said, to proactively address "why isn't this a problem in
GCC?"  It is; just that GCC renames functions during constant
propagation that modpost doesn't warn about.  That smells like a
memory leak to me; potential gadgets left behind even.
https://github.com/ClangBuiltLinux/linux/commit/4a3893d069b788f3570c19c12d9e986e8e15870f

I think you also remarked on my modpost allowlist approach patch; that
was part of this saga.
https://lore.kernel.org/lkml/20210929225850.3889950-1-ndesaulniers@google.com/
(I agree with your feedback from that thread, and think we can fix
most of this in LLVM's inline cost model; just noting it "for the
record").

Also, Happy Thanksgiving!
-- 
Thanks,
~Nick Desaulniers
