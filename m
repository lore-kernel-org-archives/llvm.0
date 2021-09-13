Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265963FC5
	for <llvm@lists.linux.dev>; Mon, 13 Sep 2021 17:00:16 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id f2so18517610ljn.1
        for <llvm@lists.linux.dev>; Mon, 13 Sep 2021 10:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QrGAcwwTUwAfpY/24fWLxW114H7zq5jNLexfHma71jY=;
        b=mHAp4peCIYAwNG5WNuKgb3pHkoOfCgtS1Yiu+1wpKhX5XhhvReydT9+OXRhmkBWTVt
         Ue/G6xc2TPg0aRNhhexVlIDCBI1s9BxJ9GN8GuRjRfdr5WqNT0mBbZVLTprD4aVrECxm
         RvtGqmfK8DbTM6d/EU9EFSB+gtN37H84ocYYCsUNXY9gSEzR5Q2q33Gw3d9WNURu36dY
         dfdYnVf6O4c6eWtUYg02qPBEUAUMsne4IQQQl3NkLdn4uAMDpfq26547HRtDEsbJF1Ag
         /nmszn7VajgH9HHZhUKZ98eirDph23GHXV2Bgiau2c6j+pacusJ2syJlheoQnEux+20c
         Hqog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QrGAcwwTUwAfpY/24fWLxW114H7zq5jNLexfHma71jY=;
        b=e7Cq6b66GuzC8lld9dVXaA/VjgE0uCKWPaYbD0Q7UeCthWu2gPOdRNMeiOw+Gxi0AG
         kvuGf3S68fP/7N3GvU60R07W+ElQYe79OoGfmQOC3TZ8R38cK2pElaaA0SeE4L1Fr9IX
         H55Gg98pztj6+BDsRvLy19V+2vAuInp/XllTm/hrF+w0op5CMNWXM6L/S1MUCCnK+Tfj
         lkq8FR+XjCKffzyXJiW280h6faV+wjMoZd9gL7d2Wsmq0JQ1UiQOpxHnM487nnhd74qg
         K65dwx+gtEgpM5QbgMTBJZdrcmqpPdinA6ukm1rDedAmp0SKjjGOh96C6GOwl3lGDYmv
         er+Q==
X-Gm-Message-State: AOAM532Puhwt1aUf/K6Hlfa5UrS4g8jFy87MuawaUjNRez78s3zwtat3
	QiW3ox2LSCyfF74Nv4XYw27NR2qCpeP3ej/0Bmiobg==
X-Google-Smtp-Source: ABdhPJzoiNYIDIZade21ErQ+cWwkQb5QbnppgTRQJiF/5A71DI6icZ4c9Fh8syGhQUQvbgecet9vm7FdrolvNg/ovAc=
X-Received: by 2002:a2e:99da:: with SMTP id l26mr10864789ljj.339.1631552413892;
 Mon, 13 Sep 2021 10:00:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202109112002.NZceUwiC-lkp@intel.com> <20210913165317.GX2505917@nvidia.com>
In-Reply-To: <20210913165317.GX2505917@nvidia.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 13 Sep 2021 10:00:02 -0700
Message-ID: <CAKwvOdnGaVb1XGwYpNK_3zAEyZ0JC1SDjC1UzzFEH=d_Mdi7Fw@mail.gmail.com>
Subject: Re: drivers/infiniband/hw/qib/qib_sysfs.c:413:1: error: static_assert
 expression is not an integral constant expression
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: kernel test robot <lkp@intel.com>, Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev, 
	kbuild-all@lists.01.org, linux-kernel@vger.kernel.org, 
	clang-built-linux@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 13, 2021 at 9:53 AM Jason Gunthorpe <jgg@nvidia.com> wrote:
>
> On Sat, Sep 11, 2021 at 08:17:08PM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   926de8c4326c14fcf35f1de142019043597a4fac
> > commit: 84f969e1c48ed3825986e91a0786e363d57f69d1 IB/qib: Fix null pointer subtraction compiler warning
> > date:   3 days ago
> > config: x86_64-randconfig-a014-20210911 (attached as .config)
> > compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 261cbe98c38f8c1ee1a482fe76511110e790f58a)
> > reproduce (this is a W=1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=84f969e1c48ed3825986e91a0786e363d57f69d1
> >         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> >         git fetch --no-tags linus master
> >         git checkout 84f969e1c48ed3825986e91a0786e363d57f69d1
> >         # save the attached .config to linux build tree
> >         mkdir build_dir
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross O=build_dir ARCH=x86_64 SHELL=/bin/bash
> >
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> >
> > All errors (new ones prefixed by >>):
> >
> > >> drivers/infiniband/hw/qib/qib_sysfs.c:413:1: error: static_assert expression is not an integral constant expression
> >    QIB_DIAGC_ATTR(rc_resends);
> >    ^~~~~~~~~~~~~~~~~~~~~~~~~~
> >    drivers/infiniband/hw/qib/qib_sysfs.c:406:16: note: expanded from macro 'QIB_DIAGC_ATTR'
> >            static_assert(&((struct qib_ibport *)0)->rvp.n_##N != (u64 *)NULL);    \
> >            ~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >    include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
> >    #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
> >                                     ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
> >    include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
> >    #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
> >                                                           ^~~~
> >    drivers/infiniband/hw/qib/qib_sysfs.c:413:1: note: cannot access field of null pointer
> >    drivers/infiniband/hw/qib/qib_sysfs.c:406:43: note: expanded from macro 'QIB_DIAGC_ATTR'
> >            static_assert(&((struct qib_ibport *)0)->rvp.n_##N != (u64 *)NULL);    \
> >                                                     ^
> >    drivers/infiniband/hw/qib/qib_sysfs.c:414:1: error: static_assert expression is not an integral constant expression
> >    QIB_DIAGC_ATTR(seq_naks);
> >    ^~~~~~~~~~~~~~~~~~~~~~~~
>
> Nick/Nathan
>
> Clang is being a real PITA here - do you know of a solution?

Hi Jason,
Thanks for wrestling with this.  We filed a quick thread last week to
track this:
https://github.com/ClangBuiltLinux/linux/issues/1452
With conferences this and next week, and -Werror fallout, there's a
lot of fire right now and not a lot of time to triage.

I guess I'm curious, what is the intent of what this code is trying to
do, and can this be replaced with BUILD_BUG_ON?

>
> This macro would like to know that the passed in member name has a u64
> type, all the things I've come up with fail on clang - but many work
> fine on gcc. Frankly I think this case is a clang bug myself..

Perhaps, though this assertion looks a bit like offsetof() to me. I
wonder if that can help here?
-- 
Thanks,
~Nick Desaulniers
