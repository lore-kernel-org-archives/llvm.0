Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6486772
	for <llvm@lists.linux.dev>; Sun, 29 Aug 2021 17:08:29 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id b4so26137089lfo.13
        for <llvm@lists.linux.dev>; Sun, 29 Aug 2021 10:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zVDLa4dAhB4ogAfKSWX0LylxNqUVw8O1PoFKqltpAWg=;
        b=FHRuADfKE3s0LJ/LX6yVoQ5i0KaOyUcKW1glHy2BmBFvFIQaodWGLZG78bzzFeM4Q/
         XzYmkCT6BGDYBe6tXBR+HXvTb90fsW5I3D6NZBAx2n9TmWvWOLMTFZ1wxU6t7qgXTnY8
         H2lS8aUyb4kb8ynuvYM4RgUTrWdra1jWXLc6Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zVDLa4dAhB4ogAfKSWX0LylxNqUVw8O1PoFKqltpAWg=;
        b=p4bckZ6uhImYKdBf4wyqVmyJZ2MG0F799yzqY9OaabICs+z/IAXnc8Y36nWyV369Ny
         byAgo0hunia1lnFiNy/X4dAYNXn6UzSUlNFd5o4jDHU2Qrgf1TGjEEAneAzgYrz6sIOq
         5vZmVvlxFsHQDRBz169qyVUBM9dNSMzKLZHA+0/rEsWFUnk57faerylmteaKsXbohgwy
         jblWy+tXJ7Hd7lgXcpI+GV9nBNjLhSgNflv5D1aBPl324OVckqQGNvVFnweviEGajOe+
         9nV0UurROxYew569thHD6q1eWZqD+KNDS6nQ3PyyzoSfnsEVC6/bybIMrNiZIVIaukpz
         36Rg==
X-Gm-Message-State: AOAM530FoskF6m5gVhRJj1kDe2wrIq0jL8+WVbAHCjmidVVkmEaLNqL+
	THZSAKgwRHnG3LzSec8oHe4dOVy+oG82oUu2
X-Google-Smtp-Source: ABdhPJwpVGvBWFxJ0cEOA7GRo6O5znGHIghWfjtqFMIdxNWLJMYSawwz5UJuNFM06E2Y3SgazDHiPg==
X-Received: by 2002:ac2:4906:: with SMTP id n6mr3920529lfi.381.1630256907079;
        Sun, 29 Aug 2021 10:08:27 -0700 (PDT)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com. [209.85.167.43])
        by smtp.gmail.com with ESMTPSA id p16sm813603lfo.181.2021.08.29.10.08.26
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Aug 2021 10:08:26 -0700 (PDT)
Received: by mail-lf1-f43.google.com with SMTP id bq28so26176026lfb.7
        for <llvm@lists.linux.dev>; Sun, 29 Aug 2021 10:08:26 -0700 (PDT)
X-Received: by 2002:ac2:4da5:: with SMTP id h5mr14002627lfe.40.1630256905942;
 Sun, 29 Aug 2021 10:08:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHk-=wiNHx_GpjoWt9VMffKunZZy5MaTe3pM+cpBgE7OyyrX5Q@mail.gmail.com>
 <CAKwvOdnbiLk4N6Qqdz=RT9nsjYQv41XnXK71azYte7h0JqoohQ@mail.gmail.com>
 <37453471-1498-4C1C-8022-93697D8C2DD4@sifive.com> <9e517b5d-f0e5-240a-2e3c-5cc24eda601e@switchbackcompilers.com>
In-Reply-To: <9e517b5d-f0e5-240a-2e3c-5cc24eda601e@switchbackcompilers.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 29 Aug 2021 10:08:09 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj+BdSAGfiJO2G8QzwLbg98mzCXF95s=-5k_gLR4evdnw@mail.gmail.com>
Message-ID: <CAHk-=wj+BdSAGfiJO2G8QzwLbg98mzCXF95s=-5k_gLR4evdnw@mail.gmail.com>
Subject: Re: Nasty clang loop unrolling..
To: Philip Reames <philip@switchbackcompilers.com>
Cc: Craig Topper <craig.topper@sifive.com>, Nick Desaulniers <ndesaulniers@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, clang-built-linux <clang-built-linux@googlegroups.com>, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sat, Aug 28, 2021 at 6:50 PM Philip Reames
<philip@switchbackcompilers.com> wrote:
>
> Here's the IR resulting the generic implementation from lib/string.c.

[ Again, note that this isn't really a function we care about in the
kernel. It came up mainly because I wanted to make sure it wasn't a
_total_ disaster, and the kernel ends up actually generally wanting
"small and simple" code because I$ misses is often one of the more
noticeable things.

  We have _very_ few loops with big loop counts in the kernel outside
of basically just some memory copies, and most of those are
handcrafted (often handcrafted C, but asm isn't unheard of). Most of
the time, the loops are all in user space, and then user space does a
system call that does something a small handful of times,

  So things like "loop over pathname lookup" is common, but the "loop"
is often just a couple of path components.

  And code size matters, often because the L1 I$ has been flushed by
the "real work" in user space, and so the kernel often has somewhat
cold caches (except for microbenchmarks, which lie). ]

That said:

> To me, the most interesting piece of this is not that we unrolled - it is the lowering of the select (e.g. the address manipulation).

Ok, so clang *can* turn the address generation into arithmetic (and
yes, I guess "cmp+sbb" is the much more idiomatic x86 generation, not
my odd "addb+adc"). Interesting.

It probably can go either way. The data dependency chain is likely
much worse than a well-predicted branch.

So for the kernel, I suspect that the main issue is just that "one I$
line vs three I$ lines for the unrolled case".

Having looked at all the other cases where clang makes for bigger code
with loop unrolling, I'm getting the feelign that I just need to test
"-fno-unroll-loops" more.

We actually tried to use "-Os" with gcc because of the code size
issues. But it generated so much truly horribly expensive code (using
"rep movs" for small constant-sized copies, using divide instructions
because they were smaller than multiplies with reciprocals etc) that I
gave up on that.

In general, for the kernel, we tend to aim for "do all the serious
optimizations, but avoid stuff that blows up code size". Turning the
occasional constant divide (common for things like pointer differences
in C) into a reciprocal multiply is a good optimization: it makes the
code a few bytes bigger but easily much faster. But unrolling loops is
almost always a loss, because the loop counts are small, and the
overhead of the unrolling is simply bigger than the win.

                  Linus
