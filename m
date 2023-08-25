Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E732E1938B
	for <llvm@lists.linux.dev>; Fri, 25 Aug 2023 20:09:40 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-76d83954c40so82667685a.1
        for <llvm@lists.linux.dev>; Fri, 25 Aug 2023 13:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692994179; x=1693598979;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F743H///oAY0f4Y0oAJ801yTb/k/wv+BjxPHl3RvQhk=;
        b=Uq8rWD0YkZWtHmxiyoMaNHLUQCSm5Ck4B9j+kJqLaSYUS0VVqfBXLBMKP9HadIhoZv
         RU/z0k4EgKdU4HEOzK9bGRqjzYXEDU0tuJ5TMAu1aALGR1i9z8htv052n7k9Fl3fPSg3
         dlfDFuhSp6Hyk4mAUgoWTumrYsVrwG3KNXxYovKmaXMhvjGyp9RJkLI775VUJ7jYDU4b
         gKuH8d2nBH2RoaRGHHrUx/opkLUWIOVaWp+TrC2IjvP5Z8m367qD1qMaTZTYAgwrBl8S
         80hiE7/ixYrAZTsfCnjEjnluo0iCN2v7Cuegv99dbu3huxsBc9r81JM5lz6ZcomG5bUo
         hNng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692994179; x=1693598979;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F743H///oAY0f4Y0oAJ801yTb/k/wv+BjxPHl3RvQhk=;
        b=iSHfJL6AkbnbNE6dcYNI+cK8MadZtTFutWkPKTem+um2gX1gvace92UpRkFMo7TtWk
         Aw+tCt26c249tfBqnJOCL6pPDu3zQoH2BFx/jjPdRC/5ZTGkEdYTcQuWJPdfl/XHLh5G
         g1bEF9i21GkE/m7/c8iki8ioKt/t/oxFxyEBeIcX7JJRg4tKKJ0xv4TIeisKTkhbKgjf
         veHHzS1T3Tlkk/I00mgcV7cLcF3G71miWLcTZtmok3iMU/3eSfdVyTRLAtC3sWsuwSJI
         cb4dQrLWZbLrY2maQmRLbWojqMENqUDPnNWKRXA7P4tsEmKk526qbS3+6JkYGblb+fzj
         Z/qQ==
X-Gm-Message-State: AOJu0YxpHpkvu+5aD8ZAqwd/hJJ+Hn2tEcncj6Yyel3+hlkJJnnu6MHu
	p/scquFucBSwoWwxoD5dz+9xe2tRKlDnK8XYGmuucTeOJfchq9WkRrC/cw==
X-Google-Smtp-Source: AGHT+IGH/PLn2u6DX/uQfVHGH+TRn8b/22cHo8PqEU5+q3lDDMDR1dQWrocsXdEpy+Z0qDsqMv89Z3BFLw6SRWuM/6I=
X-Received: by 2002:a0c:a993:0:b0:64f:5b21:f162 with SMTP id
 a19-20020a0ca993000000b0064f5b21f162mr9264537qvb.61.1692994179359; Fri, 25
 Aug 2023 13:09:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202308260344.Vc4Giuk7-lkp@intel.com>
In-Reply-To: <202308260344.Vc4Giuk7-lkp@intel.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 25 Aug 2023 13:09:28 -0700
Message-ID: <CAKwvOdk=UvBxv7a2cV-Z_zK0CwzPSjBnQ0SQHaVAEUodA=hfQQ@mail.gmail.com>
Subject: Re: [linuxppc:next-test 85/129] arch/powerpc/xmon/xmon.c:489:12:
 error: stack frame size (2160) exceeds limit (2048) in 'xmon_core'
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Nathan Chancellor <nathan@kernel.org>, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 25, 2023 at 12:17=E2=80=AFPM kernel test robot <lkp@intel.com> =
wrote:
>
> tree:   https://github.com/linuxppc/linux next-test
> head:   c37b6908f7b2bd24dcaaf14a180e28c9132b9c58
> commit: 7f3c5d099b6f8452dc4dcfe4179ea48e6a13d0eb [85/129] Revert "powerpc=
/xmon: Relax frame size for clang"
> config: powerpc64-randconfig-r006-20230825 (https://download.01.org/0day-=
ci/archive/20230826/202308260344.Vc4Giuk7-lkp@intel.com/config)
> compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git =
f28c006a5895fc0e329fe15fead81e37457cb1d1)

Hi Michael,
Given this report and
https://github.com/ClangBuiltLinux/linux/issues/252#issuecomment-1690371256=
,
it seems that it's still possible to trigger this warning (and build
failure with CONFIG_WERROR). Is it possible to drop my patch at this
point?

I'll need to go back to the drawing board with these configs +
specific versions of clang to better understand what's going wrong
here.  Sorry for the trouble.

> reproduce: (https://download.01.org/0day-ci/archive/20230826/202308260344=
.Vc4Giuk7-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202308260344.Vc4Giuk7-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> arch/powerpc/xmon/xmon.c:489:12: error: stack frame size (2160) exceed=
s limit (2048) in 'xmon_core' [-Werror,-Wframe-larger-than]
>    static int xmon_core(struct pt_regs *regs, volatile int fromipi)
>               ^
>    1 error generated.
>
>
> vim +/xmon_core +489 arch/powerpc/xmon/xmon.c
>
> 5c699396f5f6cf arch/powerpc/xmon/xmon.c Anton Blanchard      2020-06-30  =
488
> a2305e3de81939 arch/powerpc/xmon/xmon.c Arnd Bergmann        2021-04-29 @=
489  static int xmon_core(struct pt_regs *regs, volatile int fromipi)
> ^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds       2005-04-16  =
490  {
> a2305e3de81939 arch/powerpc/xmon/xmon.c Arnd Bergmann        2021-04-29  =
491    volatile int cmd =3D 0;
> a2305e3de81939 arch/powerpc/xmon/xmon.c Arnd Bergmann        2021-04-29  =
492    struct bpt *volatile bp;
> ^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds       2005-04-16  =
493    long recurse_jmp[JMP_BUF_LEN];
> 69393cb03ccdf2 arch/powerpc/xmon/xmon.c Christopher M. Riedl 2019-09-07  =
494    bool locked_down;
> ^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds       2005-04-16  =
495    unsigned long offset;
> f13659e0b39075 arch/powerpc/xmon/xmon.c Anton Blanchard      2007-03-21  =
496    unsigned long flags;
> ^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds       2005-04-16  =
497  #ifdef CONFIG_SMP
> ^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds       2005-04-16  =
498    int cpu;
> ^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds       2005-04-16  =
499    int secondary;
> ^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds       2005-04-16  =
500  #endif
> ^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds       2005-04-16  =
501
> f13659e0b39075 arch/powerpc/xmon/xmon.c Anton Blanchard      2007-03-21  =
502    local_irq_save(flags);
> a71d64b4dc4067 arch/powerpc/xmon/xmon.c Anton Blanchard      2014-08-05  =
503    hard_irq_disable();
> ^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds       2005-04-16  =
504
> 69393cb03ccdf2 arch/powerpc/xmon/xmon.c Christopher M. Riedl 2019-09-07  =
505    locked_down =3D xmon_is_locked_down();
> 69393cb03ccdf2 arch/powerpc/xmon/xmon.c Christopher M. Riedl 2019-09-07  =
506
> aaf06665f7ea3e arch/powerpc/xmon/xmon.c Naveen N. Rao        2019-06-27  =
507    if (!fromipi) {
> ed49f7fd6438dc arch/powerpc/xmon/xmon.c Breno Leitao         2017-08-02  =
508            tracing_enabled =3D tracing_is_on();
> ed49f7fd6438dc arch/powerpc/xmon/xmon.c Breno Leitao         2017-08-02  =
509            tracing_off();
> aaf06665f7ea3e arch/powerpc/xmon/xmon.c Naveen N. Rao        2019-06-27  =
510    }
> ed49f7fd6438dc arch/powerpc/xmon/xmon.c Breno Leitao         2017-08-02  =
511
> ^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds       2005-04-16  =
512    bp =3D in_breakpoint_table(regs->nip, &offset);
> ^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds       2005-04-16  =
513    if (bp !=3D NULL) {
> 59dc5bfca0cb6a arch/powerpc/xmon/xmon.c Nicholas Piggin      2021-06-18  =
514            regs_set_return_ip(regs, bp->address + offset);
> ^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds       2005-04-16  =
515            atomic_dec(&bp->ref_count);
> ^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds       2005-04-16  =
516    }
> ^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds       2005-04-16  =
517
> ^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds       2005-04-16  =
518    remove_cpu_bpts();
> ^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds       2005-04-16  =
519
>
> :::::: The code at line 489 was first introduced by commit
> :::::: a2305e3de819394a7adf68078964a92d06f9db33 powerpc: mark local varia=
bles around longjmp as volatile
>
> :::::: TO: Arnd Bergmann <arnd@arndb.de>
> :::::: CC: Michael Ellerman <mpe@ellerman.id.au>
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki



--=20
Thanks,
~Nick Desaulniers
