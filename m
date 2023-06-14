Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF99B101DD
	for <llvm@lists.linux.dev>; Wed, 14 Jun 2023 20:27:59 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-3f9e9e9d06fso526651cf.0
        for <llvm@lists.linux.dev>; Wed, 14 Jun 2023 13:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686774478; x=1689366478;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kimLIYWPOvzs4k2x7Iocr5Znn/T70aABOYbrugGGfHk=;
        b=1Dp95kTjoBgw5soGCnXEj5PVJ6JaMLGi2nMWtU3y4lJXt/E0oBA57JOFvEur5abN9G
         /h1JgUgo4ExdPrbtD1+VINTEzbAsmENDcwvFunWnDCyWxHOOVP8Myu34ou4unGSmhQPG
         QIpKgJJHxQ/JFZGzff9JsQfURNfLROVmZv9gBDoLXr2bFf1BHB2CDsdNKFsH9XqHB9ig
         wPD4mqR+Bh2stXDXR9XGEVOoQJJpAgs76OvLjUNqtnV2Sl7c9Qyt+kx5eE0ZU28neurQ
         pMaksSioupfoOYZWx9pkzPP1AEK254YXDgmmvTSAbq8boRAuFjnuBC1ZY1NpwywDKJCv
         V9+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686774478; x=1689366478;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kimLIYWPOvzs4k2x7Iocr5Znn/T70aABOYbrugGGfHk=;
        b=SjMiFmZT8AYcmZivSP3K+VGwyI5RuAyDGDQ52Lt0XP6hWA72cjUOhDWACxE6sqLL3E
         h+rDdd50jhkqwu+61FLsOHYc+Ovk49IPW/lyNTqlGEKkp2EgHybCN7Hm6GhesUULTO2L
         JNgxUczwaDN80qCY8na5SdL8TBRpHcAh3Y2Wll9Aq7ayBPX7tJTHTxJQdq2D3u24wTPC
         s9FdKqVYM8/JTcZxdubD2MFqb+9ZeVMLhU+X2+kt577F+1sIpL94P5dDyL9BMXYNYJnE
         MRuPiidFkzM2er62p7x5ZUWUXGt1eClwB/r7zdxjRhGo6CDZWeDm1n9OYlYiawG+raLQ
         uAeg==
X-Gm-Message-State: AC+VfDwzP58I8yKfj4vw0Iq2lRJNjkf8X1BA1h8f6vyc1krTNbAnyYBu
	h4kYi0A1U3iPDQpA7v3nrbVmJe9pb42ckLKOU+yvug==
X-Google-Smtp-Source: ACHHUZ7ay8BwIAHN3FlqdH3RTUmegJtrBYKRwr5TaPYYT2JLfVoH8FJtYQ8A89LRAaOeARNe1NIR4/MB8+6wMGmCs0o=
X-Received: by 2002:ad4:5c81:0:b0:62d:e3d7:5b7a with SMTP id
 o1-20020ad45c81000000b0062de3d75b7amr3409806qvh.11.1686774478425; Wed, 14 Jun
 2023 13:27:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202306100035.VTusNhm4-lkp@intel.com> <202306131418.35B5D649DC@keescook>
In-Reply-To: <202306131418.35B5D649DC@keescook>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 14 Jun 2023 16:27:46 -0400
Message-ID: <CAKwvOdmZ7fMB1Kpat3wbcUxaVbWmjO30MzQcytUZ=2Yj-NLmTA@mail.gmail.com>
Subject: Re: [linux-next:master 3357/8413] drivers/scsi/FlashPoint.c:1712:12:
 warning: stack frame size (1056) exceeds limit (1024) in 'FlashPoint_HandleInterrupt'
To: Kees Cook <keescook@chromium.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 13, 2023 at 5:22=E2=80=AFPM Kees Cook <keescook@chromium.org> w=
rote:
>
> On Sat, Jun 10, 2023 at 12:58:23AM +0800, kernel test robot wrote:
> > First bad commit (maybe !=3D root cause):
> >
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git master
> > head:   53ab6975c12d1ad86c599a8927e8c698b144d669
> > commit: df8fc4e934c12b906d08050d7779f292b9c5c6b5 [3357/8413] kbuild: En=
able -fstrict-flex-arrays=3D3
> > config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/2=
0230610/202306100035.VTusNhm4-lkp@intel.com/config)

^ I just checked this config. CONFIG_KASAN=3Dy is not set, so this is
not a case of
https://github.com/ClangBuiltLinux/linux/issues/39

UBSAN is though (maybe a red herring) as well as GCOV and TSAN/KCSAN.

Disabling GCOV did not change the stack usage from allmodconfig.

Disable KCSAN dropped it down from 2272 to 2160.

Disabling UBSAN produced no warnings, and changed the inlining
behavior such that FlashPoint_HandleInterrupt only uses 656B rather
than 2272 via allmodconfig.

Seems specific to:
```
CONFIG_UBSAN=3Dy
CONFIG_CC_HAS_UBSAN_ARRAY_BOUNDS=3Dy
CONFIG_UBSAN_BOUNDS=3Dy
CONFIG_UBSAN_ARRAY_BOUNDS=3Dy
# CONFIG_UBSAN_SHIFT is not set
# CONFIG_UBSAN_UNREACHABLE is not set
# CONFIG_UBSAN_BOOL is not set
# CONFIG_UBSAN_ENUM is not set
CONFIG_UBSAN_SANITIZE_ALL=3Dy
```
but adding these on top of powernv_defconfig I couldn't reproduce.  So
perhaps we can do a config bisection between allmodconfig and
powernv_defconfig to see what combination of configs in allmodconfig
is causing this to blow up.

> > compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.gi=
t 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
> > reproduce (this is a W=3D1 build):
> >         mkdir -p ~/bin
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/s=
bin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # install powerpc cross compiling tool for clang build
> >         # apt-get install binutils-powerpc-linux-gnu
> >         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-ne=
xt.git/commit/?id=3Ddf8fc4e934c12b906d08050d7779f292b9c5c6b5
> >         git remote add linux-next https://git.kernel.org/pub/scm/linux/=
kernel/git/next/linux-next.git
> >         git fetch --no-tags linux-next master
> >         git checkout df8fc4e934c12b906d08050d7779f292b9c5c6b5
> >         # save the config file
> >         mkdir build_dir && cp config build_dir/.config
> >         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang ~/bin/make.=
cross W=3D1 O=3Dbuild_dir ARCH=3Dpowerpc olddefconfig
> >         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang ~/bin/make.=
cross W=3D1 O=3Dbuild_dir ARCH=3Dpowerpc SHELL=3D/bin/bash drivers/
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202306100035.VTusNhm4-l=
kp@intel.com/
> >
> > All warnings (new ones prefixed by >>):
> >
> >    In file included from drivers/scsi/BusLogic.c:51:
> > >> drivers/scsi/FlashPoint.c:1712:12: warning: stack frame size (1056) =
exceeds limit (1024) in 'FlashPoint_HandleInterrupt' [-Wframe-larger-than]
> >     1712 | static int FlashPoint_HandleInterrupt(void *pcard)
> >          |            ^
> >    1 warning generated.
>
> I wasn't able to generate the warning with my Clang, but it sure is
> close! Building with KCFLAGS=3D-Rpass-analysis=3Dstack-frame-layout I see=
:
>
>
> In file included from ../drivers/scsi/BusLogic.c:51:
> ../drivers/scsi/FlashPoint.c:1713:1: remark:
> Function: FlashPoint_HandleInterrupt
> Offset: [SP-4], Type: Protector, Align: 4, Size: 4
> Offset: [SP-8], Type: Spill, Align: 8, Size: 4
> Offset: [SP-12], Type: Spill, Align: 4, Size: 4
> Offset: [SP-16], Type: Spill, Align: 16, Size: 4

Perhaps alignment 16B for a 4B variable leads to excessive padding?
Perhaps this config changes the alignment of a type?  No, looks like
most spills are the 4B w/ 4B alignment and the 16B alignment spills
are insignificant.

> Offset: [SP-20], Type: Spill, Align: 4, Size: 4
> Offset: [SP-24], Type: Spill, Align: 8, Size: 4
> Offset: [SP-28], Type: Spill, Align: 4, Size: 4
> Offset: [SP-32], Type: Spill, Align: 16, Size: 4
> Offset: [SP-36], Type: Spill, Align: 4, Size: 4
> Offset: [SP-40], Type: Spill, Align: 8, Size: 4
> Offset: [SP-44], Type: Spill, Align: 4, Size: 4
> Offset: [SP-48], Type: Spill, Align: 16, Size: 4
> Offset: [SP-52], Type: Spill, Align: 4, Size: 4
> Offset: [SP-56], Type: Spill, Align: 8, Size: 4
> Offset: [SP-60], Type: Spill, Align: 4, Size: 4
> Offset: [SP-64], Type: Spill, Align: 16, Size: 4
> Offset: [SP-68], Type: Spill, Align: 4, Size: 4
> Offset: [SP-72], Type: Spill, Align: 8, Size: 4
> Offset: [SP-76], Type: Variable, Align: 4, Size: 4
> Offset: [SP-80], Type: Spill, Align: 4, Size: 4
> Offset: [SP-84], Type: Spill, Align: 4, Size: 4
> ...[4 byte spills]...
> Offset: [SP-1012], Type: Variable, Align: 4, Size: 4
> Offset: [SP-1016], Type: Variable, Align: 4, Size: 4
> [-Rpass-analysis=3Dstack-frame-layout]
>
> So something is very weird in FlashPoint_HandleInterrupt -- it has a
> single while loop with an internal if/else if/.../else chain. So I don't
> see why it would need such extensive spills...
>
> This seems like a missed optimization in Clang, maybe?
>
> --
> Kees Cook
>


--=20
Thanks,
~Nick Desaulniers
