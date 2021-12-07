Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3AA2CA6
	for <llvm@lists.linux.dev>; Tue,  7 Dec 2021 00:41:15 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id b1so29400350lfs.13
        for <llvm@lists.linux.dev>; Mon, 06 Dec 2021 16:41:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jIdEL53nOuAEWWraBxH2Sf1OMMrte3ZBjFe55W9HpZQ=;
        b=E3O5kgNkwKpGJAfYijYIis3nIYzqNI5uKUm+57c585pwv/tbe2hXRW79KARrf7k0uU
         xCa/ufxVvEanx8hkDRlRjTOItfQh71Y3IWsybe2U0IgNRLT7zbzouAZNHUOCtnRTEOfu
         MS5tJBOYoon2o6PHpiKdGvdmlPaXK6HPh09Pkh1MVb8Kw1NNrIQQsXKFJdhq6Om1x26y
         Yt3z+FOhW5Zu+exusnHVME0R4R3Cm/ynN0CDFHBVasJBLPzY/GhVvZhiZsjCwHTJ0BhF
         Mr16b/Q6pO+Va7Ws+IBcFgIWCIsRYPZGgd1/CPwtc7ocEtcSArSMpN/8G9kTC5uSyDjq
         mhkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jIdEL53nOuAEWWraBxH2Sf1OMMrte3ZBjFe55W9HpZQ=;
        b=G5Mm/hoJTXJjw4sImq4ei7dj76L1UaRlJlC/jbTkGMnRCSg6reQgrZBcdVe+Nln2nA
         G/vJwdSA2HA8+jkcqK0b5JZlvo4mKKMAlW/2IVyv4qCGkKL4j90YSNMPXk++PjNA4O8D
         3BW8KPa1GUw/megBDo4GYLEWNGrXLF6vYr9bpXGjeL3M7dAjJkCUhMFMnVJzvMrZ2B6y
         Y45gxi3ngDBTPRD+1/vg5MHXNIso02cJLv3KW9AC+RCPx1sSVo5ZRwL6d8ogftKrCin1
         6P12MBB9sjnBbxFrwdNs4/2Qi9TKqBULDg7aqcWUpTJqnZlpgnArCfyAoGoCBPVJCYfl
         L4TQ==
X-Gm-Message-State: AOAM5309kfLrkXVf+DqoqXB2VRLHtHR2AZItl5/1/5hpbs6tOksKlvjQ
	vZduaGIilvval+UQ13fIjy0u7KRjKWWln+ilcPJaHg==
X-Google-Smtp-Source: ABdhPJzhj5DNFAKr3BTQqYHXWFPODGzuEK9YDqY1brCLRpCiSW6jgBE1YVxRQOsGdhG3vbOnzYjUIgTsolXxUHeDZqg=
X-Received: by 2002:a05:6512:228c:: with SMTP id f12mr8230554lfu.550.1638837672966;
 Mon, 06 Dec 2021 16:41:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAKwvOdnoxaHHYMN-=fW6-W_bN+VrWvD32cidGa7qnYHmR=k2YA@mail.gmail.com>
In-Reply-To: <CAKwvOdnoxaHHYMN-=fW6-W_bN+VrWvD32cidGa7qnYHmR=k2YA@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 6 Dec 2021 16:41:00 -0800
Message-ID: <CAKwvOdkgHhOTKbb4vm9p7uDvvp7eXpTg2cb4rvr1jFgyAgSb-w@mail.gmail.com>
Subject: Re: [PATCH] numa: mark __next_node() as __always_inline to fix
 section mismatch
To: Alexander Lobakin <alexandr.lobakin@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Nathan Chancellor <nathan@kernel.org>, Zhen Lei <thunder.leizhen@huawei.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 6, 2021 at 12:57 PM Alexander Lobakin
<alexandr.lobakin@intel.com> wrote:
>
> From: Nick Desaulniers <ndesaulniers@google.com>
> Date: Mon, 6 Dec 2021 11:43:47 -0800
>
> > On Mon, Dec 6, 2021 at 8:19 AM Alexander Lobakin
> > <alexandr.lobakin@intel.com> wrote:
> > >
> > > Clang (13) uninlines __next_node() which emits the following warning
> > > due to that this function is used in init code (amd_numa_init(),
> > > sched_init_numa() etc.):
> > >
> > > WARNING: modpost: vmlinux.o(.text+0x927ee): Section mismatch
> > > in reference from the function __next_node() to the variable
> > > .init.data:numa_nodes_parsed
> > > The function __next_node() references
> > > the variable __initdata numa_nodes_parsed.
> > > This is often because __next_node lacks a __initdata
> > > annotation or the annotation of numa_nodes_parsed is wrong.
> > >
> > > Mark __next_node() as __always_inline() so it won't get uninlined.
> > > bloat-o-meter over x86_64 binaries says this:
> > >
> > > scripts/bloat-o-meter -c vmlinux.baseline vmlinux
> > > add/remove: 1/1 grow/shrink: 2/7 up/down: 446/-2166 (-1720)
> > > Function                                     old     new   delta
> > > apply_wqattrs_cleanup                          -     410    +410
> > > amd_numa_init                                814     842     +28
> > > sched_init_numa                             1338    1346      +8
> > > find_next_bit                                 38      19     -19
> > > __next_node                                   45       -     -45
> > > apply_wqattrs_prepare                       1069     799    -270
> > > wq_nice_store                                688     414    -274
> > > wq_numa_store                                805     433    -372
> > > wq_cpumask_store                             789     402    -387
> > > apply_workqueue_attrs                        538     147    -391
> > > workqueue_set_unbound_cpumask                947     539    -408
> > > Total: Before=14422603, After=14420883, chg -0.01%
> > >
> > > So it's both win-win in terms of resolving section mismatch and
> > > saving some text size (-1.7 Kb is quite nice).
> > >
> > > Signed-off-by: Alexander Lobakin <alexandr.lobakin@intel.com>
> >
> > Thanks for the patch.  See this thread:
> > https://github.com/ClangBuiltLinux/linux/issues/1302
> >
> > There's a lot more instances of these based on config.  Something like
> > https://github.com/ClangBuiltLinux/linux/issues/1302#issuecomment-807260475
> > would be more appropriate for fixing all instances, but I think this
> > is more so an issue with the inline cost model in LLVM.
> >
> > I need to finish off https://reviews.llvm.org/D111456, and request
> > that https://reviews.llvm.org/D111272 which landed in clang-14 get
> > backported to the 13.0.1 release which should also help.
>
> Oh I see. Sorry for redundant posting, non-applicable then.

No worries; it's a complex issue.  I appreciate that you took the time
to test with clang, understand the issue, and send a patch.
++beers_owed;

If you'd like, I can add you to our github org if you'd like to be
cc'ed on issues there; just ping me privately off thread with your
github account and I'll add you.
https://github.com/ClangBuiltLinux

> We'll wait for these Clang/LLVM works to be finised, thanks!
>
> >
> > > ---
> > >  include/linux/nodemask.h | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/include/linux/nodemask.h b/include/linux/nodemask.h
> > > index 567c3ddba2c4..55ba2c56f39b 100644
> > > --- a/include/linux/nodemask.h
> > > +++ b/include/linux/nodemask.h
> > > @@ -266,7 +266,7 @@ static inline int __first_node(const nodemask_t *srcp)
> > >  }
> > >
> > >  #define next_node(n, src) __next_node((n), &(src))
> > > -static inline int __next_node(int n, const nodemask_t *srcp)
> > > +static __always_inline int __next_node(int n, const nodemask_t *srcp)
> > >  {
> > >         return min_t(int,MAX_NUMNODES,find_next_bit(srcp->bits, MAX_NUMNODES, n+1));
> > >  }
> > > --
> > > 2.33.1
> > >
> >
> >
> > --
> > Thanks,
> > ~Nick Desaulniers
>
> Al
>


-- 
Thanks,
~Nick Desaulniers
