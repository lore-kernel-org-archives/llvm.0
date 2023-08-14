Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D1C100AA
	for <llvm@lists.linux.dev>; Mon, 14 Aug 2023 22:13:37 +0000 (UTC)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-64723bb9e25so5319036d6.0
        for <llvm@lists.linux.dev>; Mon, 14 Aug 2023 15:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692051216; x=1692656016;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BWR92NMLKFIonzwAykGWVN4HTMfWfyQosEFE/Od71EM=;
        b=XZUYwHHDr86bXJT3oLOwvUmkwAoC7RcjQdvwJf3pcjwnVr+26pL0EjxTZHnGAaO2Qh
         a5r0XLPQlrUr8sXlb3LQ7wJ2LMQqbd2kmmYB+UhmVEPlyrAi6c/L/cDhmIDMCPqcFiFn
         +qslXJpCAuSnF18RNwfE1BwLJjbiivXqFI7TUjzI8wp5lehdrGvV5EcEnxYRcZWikZHh
         nhPULTGgljV9+y4tA1Qw8E06GYDevX+7v1CroaLrU3Q22wZYEEVYUPH4FVe8NAMcZ6KI
         enevvMjlVyd4Rr3eI8UvaVkyFE2/s418d2p7XZwbDj7Rc/t0iPYMudQQVbpoWKLLmkz3
         6NbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692051216; x=1692656016;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BWR92NMLKFIonzwAykGWVN4HTMfWfyQosEFE/Od71EM=;
        b=IPoPgeX6nm6npNU0dGz/82jetcNMVxVwE5pnt067BTnUQtADiPrGqQfxdmJ5wnbX/Q
         OSdbgdwKGd8ySQpHeZ/7g0rX4TJOJhtZVxcOu5oylMUqIiXcOObfq2lbaJ2U4GVOIjb6
         a273ga74TAi27tOvIjvDBxetamKsZ8YM4S7ndAwmqJgvlVih+G5nYU6tf9ENuTSSK7WY
         M72QoELhS7w8mujFjFS9BCYAgRKDjknY6JvU67RklMlDtPWD4EedovQ2/kMUOu6UjVWj
         WCy4kFHLpEMS7A6AIhtEjrkskLRFFMJAMH0gSpYjigowJYYyC1T7Goz433AR4WPJj+zi
         ncoQ==
X-Gm-Message-State: AOJu0YwQg2ICHn/+Tes63DZpoGmZfThlBxM7n2qt20yEzdluOUWBSppE
	lF1C18/isSoXkh1kzsjh7f9D22DbWuVg+IcGpaRjLw==
X-Google-Smtp-Source: AGHT+IGVqigk1DqQrF/cP0IKDfGG1Y12PPhuKBWQwem6mCRw3c/TxJoXVvUwwHTIhchOutIX2ZCr1TkM5X73fQqFXDQ=
X-Received: by 2002:a05:6214:494:b0:642:ee8b:88b1 with SMTP id
 pt20-20020a056214049400b00642ee8b88b1mr488600qvb.13.1692051215946; Mon, 14
 Aug 2023 15:13:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202308090204.9yZffBWo-lkp@intel.com> <CAKwvOd=c94gknBq7TUsQEyC095+1iRW540=xD3zRkf3+Q4vn5Q@mail.gmail.com>
 <ZNSWMgFF529bGy14@yujie-X299>
In-Reply-To: <ZNSWMgFF529bGy14@yujie-X299>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 14 Aug 2023 15:13:25 -0700
Message-ID: <CAKwvOd=DC9Ws0+77=6d2M5TqnU=ygCV8HonHKMF7LzzL67z8VQ@mail.gmail.com>
Subject: Re: error: A dwo section may not contain relocations
To: Yujie Liu <yujie.liu@intel.com>
Cc: kernel test robot <lkp@intel.com>, Kees Cook <keescook@chromium.org>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Linux Memory Management List <linux-mm@kvack.org>, Conor Dooley <conor@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 10, 2023 at 1:04=E2=80=AFAM Yujie Liu <yujie.liu@intel.com> wro=
te:
>
> Hi Nick,
>
> On Tue, Aug 08, 2023 at 12:46:00PM -0700, Nick Desaulniers wrote:
> > On Tue, Aug 8, 2023 at 12:02=E2=80=AFPM kernel test robot <lkp@intel.co=
m> wrote:
> > >
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linu=
x.git master
> > > head:   02aee814d37c563e24b73bcd0f9cb608fbd403d4
> > > commit: f9b3cd24578401e7a392974b3353277286e49cee Kconfig.debug: make =
DEBUG_INFO selectable from a choice
> > > date:   1 year, 5 months ago
> > > config: riscv-randconfig-r001-20230808 (https://download.01.org/0day-=
ci/archive/20230809/202308090204.9yZffBWo-lkp@intel.com/config)
> > > compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.=
git f28c006a5895fc0e329fe15fead81e37457cb1d1)
> >
> > FWIW, I wasn't able to reproduce with the provided config and
> > clang-17.  Perhaps this is a bug for older clang releases (the bot
> > tested with clang-14).
>
> Thanks for this info. We re-tested with various versions of clang.
> clang-14 throws this error, while clang-15/16/17 have no problem in this

Oh, interesting data point.

Ok, I've filed https://github.com/ClangBuiltLinux/linux/issues/1914 to
track this.

Will bisect llvm to find when this was fixed.

Then we will fix kconfig for the split debug info.

> case. We will consider adjusting our compiler coverage and remove the old
> clang-14.

Documentation/process/changes.rst lists our minimal support for
clang-11+.  It's still useful to have clang-14 builds.

>
> Best Regards,
> Yujie
>
> > > reproduce: (https://download.01.org/0day-ci/archive/20230809/20230809=
0204.9yZffBWo-lkp@intel.com/reproduce)
> > >
> > > If you fix the issue in a separate patch/commit (i.e. not just a new =
version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202308090204.9yZffBWo=
-lkp@intel.com/
> > >
> > > All errors (new ones prefixed by >>):
> > >
> > > >> error: A dwo section may not contain relocations
> > > >> error: A dwo section may not contain relocations
> > > >> error: A dwo section may not contain relocations
> > > >> error: A dwo section may not contain relocations
> > > >> error: A dwo section may not contain relocations
> > > >> error: A dwo section may not contain relocations
> > > >> error: A dwo section may not contain relocations
> > > >> error: A dwo section may not contain relocations
> > > >> error: A dwo section may not contain relocations
> > > >> error: A dwo section may not contain relocations
> > > >> error: A dwo section may not contain relocations
> > > >> error: A dwo section may not contain relocations
> > > >> error: A dwo section may not contain relocations
> > > >> error: A dwo section may not contain relocations
> > > >> error: A dwo section may not contain relocations
> > > >> error: A dwo section may not contain relocations
> > > >> error: A dwo section may not contain relocations
> > > >> error: A dwo section may not contain relocations
> > > >> error: A dwo section may not contain relocations
> > >    fatal error: too many errors emitted, stopping now [-ferror-limit=
=3D]
> > >    20 errors generated.
> > >    make[2]: *** [scripts/Makefile.build:288: arch/riscv/kernel/vdso/v=
gettimeofday.o] Error 1 shuffle=3D3686795728
> > >    make[2]: Target 'include/generated/vdso-offsets.h' not remade beca=
use of errors.
> > >    make[1]: *** [arch/riscv/Makefile:120: vdso_prepare] Error 2 shuff=
le=3D3686795728
> > >    make[1]: Target 'prepare' not remade because of errors.
> > >    make: *** [Makefile:219: __sub-make] Error 2 shuffle=3D3686795728
> > >    make: Target 'prepare' not remade because of errors.
> > >
> > > --
> > > 0-DAY CI Kernel Test Service
> > > https://github.com/intel/lkp-tests/wiki
> >
> >
> >
> > --
> > Thanks,
> > ~Nick Desaulniers
> >



--=20
Thanks,
~Nick Desaulniers
