Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD55BA37
	for <llvm@lists.linux.dev>; Wed, 26 Oct 2022 23:44:38 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id i127so21117527ybc.11
        for <llvm@lists.linux.dev>; Wed, 26 Oct 2022 16:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RJOCujJ2evlkTvyAJl3EjKV4NqTiwbMZQrb6USIy62A=;
        b=Ibbnmusa2j2keo9k/BIZ2Kw8UxuH3p6LSeIZSEhvhvS1nwnQz3G9IsQf8ev24p5fvh
         mtEdvIT5mrElwkrEAlTVhn1Y53OPyZ54PtzjyKgbsiQVwRVXFv31M1dDSJdLTq2Dphuz
         98UHtOjJkapvo/qYJXUpCGvMZd6d8PyYriyMK9W7V1AtO9jwQeiO6YHxtrOLLiGJojYn
         hrpjvuhc4YFZ1Y3Y5MEG1QS7uVwYipet8Z+bTGjlNc1S9crLYJO3BGoPvTdo/BlW0Uss
         zbdRwT+NL58yEJBiONH3t+dT/hNntnEkrb+DQ3wKKneWN9Iqsy/RSCf7BAII7PTAnjYv
         x8Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RJOCujJ2evlkTvyAJl3EjKV4NqTiwbMZQrb6USIy62A=;
        b=fsOc+zfAKM8jBvAnBYY6mpWGfJIuifoK13DsO5wx12zNESBjU3f8PBbXV4SNO6oOgW
         Mli4UYG/12yaLV+aewpPA0RQyBBfQQnx+gsayYyaEGteiCfqkl14545aLMyQ772hh0MA
         lqIC0xR6mbmveIkyR4aHjHY+X2SmQ1dZ3qfJxUO5wL7KrZTVPCxzPVosdoadY1U33kka
         zI89HC/asul5gtbynyiUXHwEitPvZbjcq8Z6McAJt+ap7yB3RHePKtUN2tyayNTH0wZn
         +1jld49Mpj5O3KopnSoDhzdwolIhoes364N66yBg61E40LQUfBTe+FyQqzyeNlb/FtBl
         CWNw==
X-Gm-Message-State: ACrzQf3qxY2A5ckoh1LkMVQNECthnJ6y4kuTN373LAHKLWICuubAY6b5
	V/EstFlqVf5aAJg3X3uLxawg8BZX8q6u+CkDo70w4w==
X-Google-Smtp-Source: AMsMyM4FMEt7dnZXMKYX06f26/Xmp1mxfg3pMUQ9uQUKKZasNn+azId8PZiWlAY19/eC3enkjOO5+NWfn5UHSfTnNRk=
X-Received: by 2002:a05:6902:1101:b0:6ca:c770:34a7 with SMTP id
 o1-20020a056902110100b006cac77034a7mr21659533ybu.431.1666827877257; Wed, 26
 Oct 2022 16:44:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202210260945.cCKjgJe3-lkp@intel.com> <Y1j8I2qf78jHfLWs@hirez.programming.kicks-ass.net>
 <CAJuCfpHBMKbxWkJG4YRYvmaFPiXO42iVPZxgwUeWnKQb4CtDDg@mail.gmail.com>
In-Reply-To: <CAJuCfpHBMKbxWkJG4YRYvmaFPiXO42iVPZxgwUeWnKQb4CtDDg@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 26 Oct 2022 16:44:26 -0700
Message-ID: <CAJuCfpHn45rzqAbNuz_Q9AUXcirEDN_PrzG-inGYiOyM9Tw8+A@mail.gmail.com>
Subject: Re: [peterz-queue:sched/core 16/18] kernel/sched/psi.c:983:35: error:
 too few arguments to function call, expected 3, have 2
To: Peter Zijlstra <peterz@infradead.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 26, 2022 at 11:28 AM Suren Baghdasaryan <surenb@google.com> wrote:
>
> On Wed, Oct 26, 2022 at 2:21 AM Peter Zijlstra <peterz@infradead.org> wrote:
> >
> > On Wed, Oct 26, 2022 at 09:58:58AM +0800, kernel test robot wrote:
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/core
> > > head:   7005e3c43be6b6297440e85cb7d8c12a94540b49
> > > commit: 95a70934458341dc43db09be8e7b88c98fba9b89 [16/18] psi: stop relying on timer_pending for poll_work rescheduling
> > > config: i386-randconfig-a004-20221024 (attached as .config)
> > > compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
> > > reproduce (this is a W=1 build):
> > >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> > >         chmod +x ~/bin/make.cross
> > >         # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=95a70934458341dc43db09be8e7b88c98fba9b89
> > >         git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
> > >         git fetch --no-tags peterz-queue sched/core
> > >         git checkout 95a70934458341dc43db09be8e7b88c98fba9b89
> > >         # save the config file
> > >         mkdir build_dir && cp config build_dir/.config
> > >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash
> > >
> > > If you fix the issue, kindly add following tag where applicable
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > >
> > > All errors (new ones prefixed by >>):
> > >
> > >    In file included from kernel/sched/build_utility.c:97:
> > > >> kernel/sched/psi.c:983:35: error: too few arguments to function call, expected 3, have 2
> > >                            psi_schedule_poll_work(group, 1);
> > >                            ~~~~~~~~~~~~~~~~~~~~~~         ^
> > >    kernel/sched/psi.c:568:13: note: 'psi_schedule_poll_work' declared here
> > >    static void psi_schedule_poll_work(struct psi_group *group, unsigned long delay,
> > >                ^
> > >    1 error generated.
> > >
> > >
> >
> > Droping for now; Suren could you fix up and repost please?
>
> Sorry, I missed the report. Will post a fix by EOD. Thanks!

Hi Peter,
I posted the new v5 patch with the one-line fix at
https://lore.kernel.org/all/20221026233839.1934419-1-surenb@google.com.
I didn't notice the issue because that path is only used when
CONFIG_IRQ_TIME_ACCOUNTING is enabled, which I haven't tested :(
Please try picking it now. I think nothing should fail this time
around (famous last words).
Thanks,
Suren.
