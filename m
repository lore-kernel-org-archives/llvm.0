Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F3B4683
	for <llvm@lists.linux.dev>; Tue,  4 Oct 2022 23:25:06 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id i6so14440955pfb.2
        for <llvm@lists.linux.dev>; Tue, 04 Oct 2022 16:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=1SR11w2k/B9xoBwpvZGf3uCZd3F3Lb/iGIIfd8Lx/nc=;
        b=cQ90SQaqi7G3Q0Kg9JLLaPEkuEVVB7d/HE1wF6HCDhI5xV1dsQACBjgMJH26APw3B4
         biHWUcJgPBRnRXdP8SBBRPYxj1IlBF3jHP+qFMuT2kifoFqm2t40xKpStqdWPuSypIDI
         H2IkuXT8EyjrjBseuyEv/3ubHVp0MDv/ton9thz3Pxi9bExJ/k8xKTJb1uyNf5lZmyDr
         vSm0ApF+HIUsi3yneyA9GVmmKyV8522GOcUoJ6XrsjV1+XeBZURyJ9Lea5ug6OsIu5NG
         0lY8XbYuiEk+y8yGXSP6sqwbneenX4qGsN5CBHjLvbaMcPurrr+jLmbs1xf/iOSOTzLQ
         ziMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=1SR11w2k/B9xoBwpvZGf3uCZd3F3Lb/iGIIfd8Lx/nc=;
        b=Dsfs1luf+tLgCW0H90qtehqPjwp1swZibjb1e0aUqDL/K+7kYM7HrETNK6yZ55gcFM
         fspB5i8gtDrSecZiG67FD9Bzg86NIeO5hIqpBThXuKJ8O9pnjUgFVdxEsVixvCQ+dG09
         BUQVo2fYWCu6jBXWNJRoYcJKfruhnhslkEoBNyAKxxhURzp/bYclqkl4BZsD4jMuhmUS
         q9QB7YIXR5Y3j7dPogjCsZr4XfDXSBivIvcuVQlt75ldVoyam2UgqfFfm5gG7ZsCABbQ
         rLEDsDN3qF9A1Bz/oAtgLNBMp2iefPeFR75SuwJMYUgm0l7tFH9XoRt1sgCOGwLkyXlL
         gwPQ==
X-Gm-Message-State: ACrzQf2Qub95dfLOrgnijDpk5EPpBgm84LBuJWi8yMDOwSH4EAoEvb2i
	HBdhdzWaixW/yII4BoGsGrsJhn2LgI08lokYFx7K7Q==
X-Google-Smtp-Source: AMsMyM7YnEIWRIzeEdUNip8/tmKH5SfQZ4z1O+o04zFE2uJfPwDL1ty7x5Uyfuy8alWhEGanEeMpcgssbhEpYK2NXKw=
X-Received: by 2002:a63:2cd2:0:b0:41c:5901:67d8 with SMTP id
 s201-20020a632cd2000000b0041c590167d8mr25033288pgs.365.1664925906003; Tue, 04
 Oct 2022 16:25:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202210050509.cZtMcazl-lkp@intel.com> <Yzy/VbCd0e+K3ptN@iweiny-mobl>
In-Reply-To: <Yzy/VbCd0e+K3ptN@iweiny-mobl>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 4 Oct 2022 16:24:54 -0700
Message-ID: <CAKwvOdkWLE2ONDbHpSgAbFSwMZUN=KF0yeLjncS2TVVh=Wrk+A@mail.gmail.com>
Subject: Re: [linux-next:master 5475/12409] s390x-linux-ld:
 kernel/kexec_core.c:822: undefined reference to `__tsan_memcpy'
To: Ira Weiny <ira.weiny@intel.com>
Cc: kernel test robot <lkp@intel.com>, "Fabio M. De Francesco" <fmdefrancesco@gmail.com>, llvm@lists.linux.dev, 
	kbuild-all@lists.01.org, Linux Memory Management List <linux-mm@kvack.org>, 
	Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"

Sorry for the noise, please see:
https://lore.kernel.org/all/Yx3HnuEDyFG0+G62@dev-arch.thelio-3990X/
EOM

On Tue, Oct 4, 2022 at 4:18 PM Ira Weiny <ira.weiny@intel.com> wrote:
>
> On Wed, Oct 05, 2022 at 05:05:12AM +0800, kernel test robot wrote:
> > Hi Fabio,
> >
> > FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.
>
> I don't think this is relevant.
>
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   4d80748d16c82a9c2c4ea5feea96e476de3cd876
> > commit: 948084f0f6959f602f89f679522b706a72da0285 [5475/12409] kexec: replace kmap() with kmap_local_page()
> > config: s390-randconfig-r035-20221003
> > compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 791a7ae1ba3efd6bca96338e10ffde557ba83920)
> > reproduce (this is a W=1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # install s390 cross compiling tool for clang build
> >         # apt-get install binutils-s390x-linux-gnu
> >         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=948084f0f6959f602f89f679522b706a72da0285
> >         git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> >         git fetch --no-tags linux-next master
> >         git checkout 948084f0f6959f602f89f679522b706a72da0285
> >         # save the config file
> >         mkdir build_dir && cp config build_dir/.config
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash
> >
> > If you fix the issue, kindly add following tag where applicable
> > | Reported-by: kernel test robot <lkp@intel.com>
> >
> > Note: the linux-next/master HEAD 4d80748d16c82a9c2c4ea5feea96e476de3cd876 builds fine.
> >       It may have been fixed somewhere.
> >
> > All errors (new ones prefixed by >>):
> >
>
> [snip]
>
> >    s390x-linux-ld: kernel/kexec_core.o: in function `kimage_load_normal_segment':
> >    kernel/kexec_core.c:814: undefined reference to `__tsan_memset'
> > >> s390x-linux-ld: kernel/kexec_core.c:822: undefined reference to `__tsan_memcpy'
> >    s390x-linux-ld: kernel/kexec_core.o: in function `_copy_from_user':
>
> I don't see __tsan_memcpy anywhere in the current linux-next tree?
>
> Ira
>


-- 
Thanks,
~Nick Desaulniers
