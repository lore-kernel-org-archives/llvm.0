Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03BFE2FAE
	for <llvm@lists.linux.dev>; Thu, 30 Sep 2021 18:54:32 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id m3so28868110lfu.2
        for <llvm@lists.linux.dev>; Thu, 30 Sep 2021 11:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5IZ/hLvOUSgpP0wYol2FuuiQb+HBe9aBEaCiGK4+fa4=;
        b=RS7k61yWDY7k3lLrpz1Swp2qdYm4uhh+IQmQn4jDiN9TysKG0ay3jy/ufrUGOKrfw9
         df0z/Wvx3KX2Ip2iU2QuWrEJOIHyyGZdotfqboUxby/doCtTLRAYGi/NyIXVL3JY8Yuy
         aYMJ7Bs++uYAqCpShvMpqWVXTEL6Bcu5WNE/c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5IZ/hLvOUSgpP0wYol2FuuiQb+HBe9aBEaCiGK4+fa4=;
        b=uoEZVlYX/f76Q81GfXSXMsKE9S9GjAK0yGSMvJlwQa//1LaBbA+fA46LTYUbC0U49y
         bfdQxdbtBwK83hLO+B3mfKJNvoZWnddEUatXwWPSlTwz4HSQ+5YdltnxhDNi6CjhbSJR
         C7etCuzxAWCg8plpfDS33PKkkUQ7WewJV2RA3W8o5e3AdDKAOCONPMQdYc4LJBmcibDr
         rxR6rc+MtLJGz2r8A7Q5W/KP83llwTKWznxKGSB4FJ5jVulJQ+HFNlzSdoSrr8xUqLBe
         oCI7J8/iBoa83oKUr9VtjfyuSM9a1h7NOg+553xe/3aMhO/YavWyFJ0C/Bgmsv7dxhMF
         q5OA==
X-Gm-Message-State: AOAM530UlYPBFF7m/mMIZWdCFWiq/IyksNPl+eDq0rhjQnqRrv9opEfc
	NPwXpX/rPA02GwUdaE2Y3PbMU1es2fSNE3bBfYI=
X-Google-Smtp-Source: ABdhPJwkT2yl3ck5lIQ7VTV9r6UbcRHtE1LPdrbZBD4qP2st3RkkaoJg5wGBPcMsbsNTFQZBkiGb4w==
X-Received: by 2002:a05:6512:4002:: with SMTP id br2mr725371lfb.599.1633028070601;
        Thu, 30 Sep 2021 11:54:30 -0700 (PDT)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com. [209.85.167.45])
        by smtp.gmail.com with ESMTPSA id f10sm422360ljp.55.2021.09.30.11.54.29
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Sep 2021 11:54:29 -0700 (PDT)
Received: by mail-lf1-f45.google.com with SMTP id m3so28867859lfu.2
        for <llvm@lists.linux.dev>; Thu, 30 Sep 2021 11:54:29 -0700 (PDT)
X-Received: by 2002:a19:ef01:: with SMTP id n1mr849824lfh.150.1633028069266;
 Thu, 30 Sep 2021 11:54:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210929225850.3889950-1-ndesaulniers@google.com>
 <CAHk-=wh0BNEDz+uOdJWG8iW=n0PeOEjZpHyuSN2g0pKSCj+6iQ@mail.gmail.com> <CAKwvOdn-Z1q99zZW4GQ2aNnVMQ_JYuczrResTG7tvcfv0WLJ-w@mail.gmail.com>
In-Reply-To: <CAKwvOdn-Z1q99zZW4GQ2aNnVMQ_JYuczrResTG7tvcfv0WLJ-w@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 30 Sep 2021 11:54:13 -0700
X-Gmail-Original-Message-ID: <CAHk-=wip2uVAaRtPNFF4+C2ZmkUZ+rs2-676syUR_kJ9+8hFNA@mail.gmail.com>
Message-ID: <CAHk-=wip2uVAaRtPNFF4+C2ZmkUZ+rs2-676syUR_kJ9+8hFNA@mail.gmail.com>
Subject: Re: [PATCH] modpost: add allow list for llvm IPSCCP
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Arnd Bergmann <arnd@kernel.org>, 
	Kees Cook <keescook@chromium.org>, Nathan Chancellor <nathan@kernel.org>, 
	Michal Marek <michal.lkml@markovi.net>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 29, 2021 at 5:19 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
> ...
> arch/x86/mm/amdtopology.c:110:7: remark: 'test_bit' not inlined into
> 'amd_numa_init' because too costly to inline (cost=115, threshold=45)
> [-Rpass-missed=inline]
>                 if (node_isset(nodeid, numa_nodes_parsed)) {

Yeah, I think that we should just do the __always_inline thing.

I'd rather have the stupid debug code overhead in the caller - that
may end up knowing that the pointer actually is so that the debug code
goes away - than have "test_bit()" uninlined because there's so much
crazy debug code in it.

I also happen to believe that we have too much crazy "instrumentation" crap.

Why is that test_bit() word read so magical that it merits a
"instrument_atomic_read()"?

But I absolutely detest how KCSAN and some other tooling seems to get
a free pass on doing stupid things, just because they generated bad
warnings so then they can freely generate these much more fundamental
problems because the result is a f*cking mess.

> Though for the defconfig case...somehow the cost is more than with the
> sanitizers...

Maybe the solution is that if you have some of the crazy sanitizers,
we just say "the end result is not worth even checking". And stop
checking all the section mismatches, and all the stack size things.

Because it looks like this is more of a real issue:

> arch/x86/mm/amdtopology.c:157:7: remark: '__nodes_weight' not inlined
> into 'amd_numa_init' because too costly to inline (cost=930,
> threshold=45) [-Rpass-missed=inline]
>         if (!nodes_weight(numa_nodes_parsed))
>              ^

Hmm. That's just a "bitmap_weight()", and that function in turn is
__always_inline.

And the *reason* it is __always_inline is that it really wants to act
as a macro, and look at the second argument and do special things if
it is a small constant value.

And it looks like clang messes things up by simply not doing enough
simplification before inlining decisions, so it all looks very
complicated to clang, even though when you actually generate code, you
have one (of two) very simple code sequences.

> > Wouldn't it be better to make
> > them always-inline?
>
> Perhaps, see what that might look like:
> https://github.com/ClangBuiltLinux/linux/issues/1302#issuecomment-807260475
> Does that look better?

I suspect that in this case, because of clang deficiencies, that
__always_inline actually is the right thing to do at least on
__nodes_weight.

Looking at your comment lower down

  https://github.com/ClangBuiltLinux/linux/issues/1302#issuecomment-807757878

I really think this is a clang bug, and that you need to do certain
simplifications both before _and_ after inlining.

Before, because of the inlining cost decisions particularly wrt
constant arguments.

After, because successful inlining changes things completely.

Marking __nodes_weight() be __always_inline just works around clang
being broken in this regard.

It is _possible_ that it might help to make bitmap_weight() be a macro
instead of an inline function, but it's a kind of sad state of affairs
if that is required.

And it might well fail - if you don't do the constant propagation
before making inlining decisions, you'll _still_ end up thinking that
bitmap_weight() is very costly because you don't do that
__builtin_constant_p() lowering.

And then you end up using the (much more expensive) generic function
instead of the cheap "look, for single words this is a trivial" thing.

> Part of me feels like modpost not warning on those is permitting a
> "memory leak," in so far as code that's only called from .init callers
> is never reclaimed. Or leaving behind gadgets...

I think we can just treat modpost as a "good heuristic".  If it
catches all the normal cases, it's fine - but it must not have false
positives.

That's basically true of all warnings. False positive warnings make a
warning worthless. That's just *basic*.

So the gcc thing is a "ok, we know compilers mess this up if they do
partial inlining with constant propagation, so we will suppress what
is quite likely a false positive for that case".

That clang patch, in comparison? That's just a hack enumerating random
cases. TRhere is no logic to it, and there is absolutely zero
maintainability. It will cause us to forever just add other random
cases to the list, making the whole tooling entirely pointless.

See the difference?

Maybe clang should just adopt the gcc naming convention, so that we
can just use the gcc heuristic.

> > clear case of "this inlining failed". This ad-hoc list has cases of
> > things that are clearly wrong in general ("test_bit()" must not use
> > initdata), and that "ok, the function just doesn't have the right
> > section marker.
>
> Sorry, what do you mean "test_bit() must not use initdata?" Because it
> can lead to problems like this? Or...?

No, I mean that it is completely unacceptable to add some crazy rule
like "you can access this init-data  from any context, as long as you
use test_bit to do so".

That's basically what your rule does. And it's a FUNDAMENTALLY invalid
rule. It's simply not true.  The rule is invalid, it's just that clang
has made such a mess of it that in one particular case it happens to
be true.

The gcc "rule" is much more reasonable: it's *not* saying "it's ok to
access this init-data from test_bit". The gcc rule says "we know gcc
messes up our heuristics when out-of-lining with constprop, so we just
won't warn because false positives are bad, bad, bad.

One rule is fundamentally garbage and wrong. The other rule is a
generic "we know this situation cannot be tested for". Very different.

                  Linus
