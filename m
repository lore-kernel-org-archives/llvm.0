Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A45A2C87
	for <llvm@lists.linux.dev>; Thu, 28 Oct 2021 23:28:09 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id f3so8795734lfu.12
        for <llvm@lists.linux.dev>; Thu, 28 Oct 2021 16:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=v2NZVqDWdoVucsv8uhkHaXgoKbQvyvz0JI/8C3axFj0=;
        b=RnCAwZVxy7QKt+LZUrPTZt2C46+fJhrIILG0woPvFNPB0ITXfELJIWLn+ekVwQeW6u
         NCUfuuIOawzPAVWuS4eFW2z+Ey3R04FKVosZU3vLihK/dPK0PE8pd22bYLucsVQSCSfG
         n8FlDzunt6v0xBsXM+bJYA3cC4SduIDEpYPYOj3TJy1wlbGERNyv7Y7x1VmlOXbA42AB
         XqfHIlVO9v/aUkppqMqU2ILMDDmXLof3+lnI4neUiQ0QfcfGY8D8Bbi6WeXes7AKMw6/
         Hbp3Cxr7TynW0ezKPi/rZ3ZcU7CSG+ad/tG/zjWZsv6InOUSwfYFG3r1bPvWowatc2Fd
         FkWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=v2NZVqDWdoVucsv8uhkHaXgoKbQvyvz0JI/8C3axFj0=;
        b=cI57dC3z+b8w9w0ej0IJdEorZI0cKr15yE7Ontqu67vsEPYN6UmR13nHkjKejosYGn
         8FzEKx5oPRrD3uRBW1g4z9QwquFlcKl2zL+00DeA5mjPL5rTtGERpCq6afBpHCLgy13D
         Gvj4PFVQpvWLBuYBPruT6vmJM83wTCdqOi/lAbG11jhSAWqYClSMM3YHns1Lmgbhwph8
         32g/B5zkSvSNLLb1AdyVxhpSkl9xYaG04elizepJ5HmNKjQVN6afGz2pOVg29oKgtSH7
         d7R+EcIn6iWtmwgSq2bBZMHgvehjaPJDkUUig5DdPyQ1Mf5xVdib/fGpnxed+Y8d1aAf
         LFTg==
X-Gm-Message-State: AOAM533ZqRdzM+mBGXIihiUxvYHmTbJC8+FLB2vFzyojTSnNXuHuPpfU
	CE17QzmKwmnA5wx5Bv9wL0pazZO+iH83Alw33B3bcQ==
X-Google-Smtp-Source: ABdhPJxyPCMzLSMX6BMpvUfaQg/tFqyUsmyDB2tZULGDfZBfJ9oA5/75vCUWsEtI+hqFXwHppll/S/RkQLTZUTmyHkw=
X-Received: by 2002:a05:6512:228a:: with SMTP id f10mr6932000lfu.489.1635463686807;
 Thu, 28 Oct 2021 16:28:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YXqpFHeY26sEbort@hirez.programming.kicks-ass.net>
 <CAK7LNATUpgfKJvjp0+8H6VfMLMio9+BCoyj00mAO8FcaVGCqjg@mail.gmail.com>
 <YXqwZq53WUiTeqI7@hirez.programming.kicks-ass.net> <YXqyHhWGJfDkuxjP@hirez.programming.kicks-ass.net>
 <YXq72/yPe76DhDLu@hirez.programming.kicks-ass.net> <YXrhZoOgv5dtFMTs@archlinux-ax161>
 <20211028204855.GP174703@worktop.programming.kicks-ass.net>
In-Reply-To: <20211028204855.GP174703@worktop.programming.kicks-ass.net>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 28 Oct 2021 16:27:55 -0700
Message-ID: <CAKwvOd=x9E=7WcCiieso-CDiiU-wMFcXL4W3V5j8dq7BL5QT+w@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Support clang-$ver builds
To: Peter Zijlstra <peterz@infradead.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Michal Marek <michal.lkml@markovi.net>, X86 ML <x86@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 28, 2021 at 1:49 PM Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Thu, Oct 28, 2021 at 10:44:06AM -0700, Nathan Chancellor wrote:
>
> > I like the first iteration of this idea most, as CC=clang does not
> > currently imply using all LLVM tools. There are some architectures that
> > work with CC=clang but not LLVM=1 so I am not sure we want that meaning
> > to change.
>
> Could such architecture set a CONFIG symbol to indicate they're
> handicapped and have that make the Makefile not use the full LLVM suite?

At this point, it's just powerpc and s390 where the assembler in llvm
needs more work. Every other arch we can compile we generally can
generally link. (modulo some long tail configs).

> > 2. Update the documentation to describe using the
> >
> >    $ PATH=/usr/lib/llvm-#/bin:$PATH make LLVM=1 ...
> >
> >    trick. This has been the preferred method for using different
> >    versions of LLVM but it has never been documented anywhere. This
> >    would allow us to keep the current build infrastructure while giving
> >    people clear instructions for how to handle different versions of
> >    clang. As Peter has noted, this would require people who are not
> >    familiar with building with LLVM to be constantly looking at the
> >    documentation to remember the command to invoke, whereas with
> >    LLVM=-#, it is easy to remember.
>
> Right, this is no more than a crude hack and is super unfriendly. It
> should never have been accepted.

Lots of tools modify PATH in your `.bashrc` or `.zshrc` etc.  I don't
see how that's any different, other than one off commands in which you
actually intend to use a specific version.

> So how about we do the below instead? Then the normal way of things will
> be:
>
>  $ make CC=clang-12
>
> and it will all *just*work*. The incomplete LLVM archs can revert back
> to the old hybrid (clang+binutils) way of things by doing:
>
>  $ make CC=clang LLVM=0
>
> Which explicitly states, use clang but don't use the full llvm suite. Or
> they can do that CONFIG_LLVM_BROKEN (or whatever) to have them default
> to LLVM=0
>
> ifdef CONFIG_LLVM_BROKEN
> LLVM ?= 0
> endif
>
> in front of the CC magic in the below patch should take care of that.

I don't think setting CC should affect LD and friends (if you were
suggesting that CC=clang-12 replace LLVM=1).  Like Nathan, I'm
sympathetic and think that your first patch is probably closer to what
I'd accept, but it needs to handle non-suffixed versions (looks like
it should) and add this info to Documentations/kbuild/llvm.rst.
-- 
Thanks,
~Nick Desaulniers
