Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62F03FC2
	for <llvm@lists.linux.dev>; Sat, 28 Aug 2021 22:42:20 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id bq28so22561406lfb.7
        for <llvm@lists.linux.dev>; Sat, 28 Aug 2021 15:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tATFryy8IbVQ7zFRsdwauFI696FYi9bPAk8OEvLPFAQ=;
        b=e2yUHNCLuabPlCNeY9ehrLKMYpGadCXh77YnNNz66hN4IT1iw6LqJSAaRoR3fVaAGk
         858jt6rcxf/MJKgCpF1glRJOOpU6GfavbK4H54mNQLvCAsADZM4oU2UaQYqCx8U5qghQ
         uB6hIRxpG3daXJrCOh2moUDA9DK0o/dRSSRoM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tATFryy8IbVQ7zFRsdwauFI696FYi9bPAk8OEvLPFAQ=;
        b=EkjNq5JB61+5rdCGNA/bBkNe1dEG6xbC6yj4/5LkSVypd6DOzo+xXbZ+vt/Nkt2Jh1
         f+wsLl5u6+zS+RutuuSDeJwu8wDD0XIwsevIdQq2T8ElRBmR48avOZQt0vvTxB3sIrHe
         pwAIn6yyGiV/AhYrfeZVMyRj1DeN6HCiUWL2xIFlTWrMsZE08YWqaU7mXRUUaRpPTxI2
         vIKlR6BnFMphIsih0ltIWI4REe8AOxW6x+92MIQYBzgzmrwq6L19URx9iRKG6N3bLGE+
         4C0UM6qH78OwlYj3RnIiYgS+0MihrBjv8W9VGwSEGGwXSiYPqKexr2kscr2sd/WNFm2J
         lRAA==
X-Gm-Message-State: AOAM532rzsPYUD2SihIe+UhAPr+s2lNNufc2eFfnuHMlxbNZ3wR1DRiw
	UToHp/PUVxA/S1dnJrtBmTbFSQiRdX7LGCM7
X-Google-Smtp-Source: ABdhPJwboduv4lVst2s5FZng5JoM3ryirv6t3by7Rx7WQXThCLZrSO4xEDB5P/aTIIHtL5z97ffspA==
X-Received: by 2002:ac2:5fc5:: with SMTP id q5mr12007581lfg.629.1630190538446;
        Sat, 28 Aug 2021 15:42:18 -0700 (PDT)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id i12sm1218700ljm.116.2021.08.28.15.42.17
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Aug 2021 15:42:17 -0700 (PDT)
Received: by mail-lj1-f182.google.com with SMTP id p15so18437817ljn.3
        for <llvm@lists.linux.dev>; Sat, 28 Aug 2021 15:42:17 -0700 (PDT)
X-Received: by 2002:a05:651c:1144:: with SMTP id h4mr13508655ljo.48.1630190537443;
 Sat, 28 Aug 2021 15:42:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHk-=wiNHx_GpjoWt9VMffKunZZy5MaTe3pM+cpBgE7OyyrX5Q@mail.gmail.com>
 <CAKwvOdnbiLk4N6Qqdz=RT9nsjYQv41XnXK71azYte7h0JqoohQ@mail.gmail.com>
In-Reply-To: <CAKwvOdnbiLk4N6Qqdz=RT9nsjYQv41XnXK71azYte7h0JqoohQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 28 Aug 2021 15:42:01 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjVuxnqQXSP53zBtTN-o8k4tcvFtVi=AkYt+KAuc5KNOg@mail.gmail.com>
Message-ID: <CAHk-=wjVuxnqQXSP53zBtTN-o8k4tcvFtVi=AkYt+KAuc5KNOg@mail.gmail.com>
Subject: Re: Nasty clang loop unrolling..
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, 
	clang-built-linux <clang-built-linux@googlegroups.com>, llvm@lists.linux.dev, 
	craig.topper@sifive.com, Philip Reames <philip@switchbackcompilers.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, Aug 28, 2021 at 1:29 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> > So it turns out that s390 had a bug due to its own private 'strncpy()'
> > being broken and not doing the insane thing that strncpy() is defined
> > to do.
>
> Like continuing to zero the rest of the buffer up to n?

Right.

> > This is the whole function with #pragma nounroll (ie "sane"):
> > [ .. snip snip .. ]
> >
> > and honestly, that's perfectly fine. It's very much what the code
> > does. It's 44 bytes, it fits in one cacheline, it's not horrible. It's
> > not what I would have done by hand, and clang seems a bit too eager to
> > move the loop end test to the top of the loop, but whatever. I see
> > nothing that makes me go "that's horrible".
>
> For the loop test, I know that clang will "rotate" loops in an attempt
> to have one canonical loop form.

Yeah, I've seen it before. I think it makes the end result harder to
read and less intuitive, and it seems to generate more silly
branch-arounds, but I doubt that odd loop rotation behavior matters
much.

> > Now, admittedly it's not particularly *smart* either - you could turn
> > the conditional "branch over a single constant add" into a computed
> > add instead

Note that the loop rotation and the lack of turning a conditional into
a computed add are just small details - suggestions on how the code
generation could _actually_ have been improved, instead of how clang
instead actively made it worse.

And note how this function *really* doesn't matter from a performance
standpoint on its own. So again, the "arithmetic vs conditional" is
just a comment on the basic code generation, but the worry is just
that the kernel really doesn't want a compiler that blows up functions
by this kind of big factor for no gain.

Because the real question is how to turn off the bad behavior:

> > What clang actually generates bears very little resemblance to either
> > the above simple and short, or the "clever and one conditional branch
> > shorter" version.
> >
> > What clang actually generates is this horror:

because while it doesn't matter if it were just this one case, I
suspect that one case is just the one I happened to look at.

Because I can find "-fno-unroll-loops" as an option, and it does fix
the problem.

But I am surprised that clang did this bogus thing at -O2, and I get
the feeling that there is some actual problem going on.

You say:

> For clang, we will do limited unrolling at -O2, and very aggressive
> unrolling at -O3; if a loop can be fully unrolled, we're likely to do
> so at -O3, with a much smaller or more conservative unroll at -O2.

so clearly there are different heuristics for unrolling than just
"don't unroll at all". And I wouldn't want to disable the *sane* kind
of unrolling of small constant loop counts.

I tried compiling the whole kernel with -fno-unroll-loops, and I do
see a number of functions that change in size quite noticeably.

I may have done something wrong, but "do_check" (the bpf verifier)
went from 45002 bytes to 33632 bytes when I asked clang not to unroll
loops.

A few functions grew, so there may be some other code generation issue
going on (ie maybe it then inlines differently too).

My comparison was truly stupid:

  #generate the 'size' file
   objdump -j .text --syms ~/vmlinux |
       grep '^fff' | cut -c32- |
       while read i name; do echo $name $((0x0$i)); done > size

   # then, using 'size' and 'newsize' files, show
   # the function size differences
   join size newsize | while read name old new;
         do echo $((new-old)) $name; done | sort -n | less -S

so it's not like I did any real analysis. I checked a few surprising
cases, and to pick another example, "__mmdrop()" has this code:

        for (i = 0; i < NR_MM_COUNTERS; i++) {
                long x = atomic_long_read(&mm->rss_stat.count[i]);

                if (unlikely(x))
                        pr_alert("BUG: Bad rss-counter state mm:%p
type:%s val:%ld\n",
                                 mm, resident_page_types[i], x);
        }

and clang will just duplicate the code NR_MM_COUNTERS (four) times.
Which is what I'd _ask_ for, if the loop body was just one or two
instructions, but when it's a debug function with a function call...

So it does look like loop unrolling can make a noticeable size
difference, and I suspect it's all basically a complete waste.

How bad is -fno-unroll-loops? Is there some subtler way to avoid the
bad cases? I can find the option when I google for it, but nothing
actually useful about when it's enabled, or what the different
optimization level heuristics are.

Is there some way to do it only for the loop unrolling for the truly
obvious "this doesn't actually expand the code, because the loop body
is pretty much the same size as the conditional"

         Linus
