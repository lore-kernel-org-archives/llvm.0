Received: from condef-07.nifty.com (condef-07.nifty.com [202.248.20.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5C62F25
	for <llvm@lists.linux.dev>; Sat, 26 Mar 2022 03:41:28 +0000 (UTC)
Received: from conssluserg-01.nifty.com ([10.126.8.80])by condef-07.nifty.com with ESMTP id 22Q3V7gF029707
	for <llvm@lists.linux.dev>; Sat, 26 Mar 2022 12:31:07 +0900
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41]) (authenticated)
	by conssluserg-01.nifty.com with ESMTP id 22Q3Ud8N013789
	for <llvm@lists.linux.dev>; Sat, 26 Mar 2022 12:30:40 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 22Q3Ud8N013789
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1648265440;
	bh=hcWzCSwwaaOnPjwZuCSlVECdBgJ7xvG53geI2HQp454=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=oPxsG49jJG5r9cpWFszCpbw2wYbZFh/HwJ4DMktg6h4gXblIoH+XhO/Q8ZfTLqAG6
	 A2KIHTFNlayKz+I2Keoaan5mzN6cnmb+xsa5uoEmDWqa8gTPhqNUkGeag6784h5O10
	 bSG/5vqCLEdqLaX3eRClwdQ6eY+7epoRnj++yxO5Z/w9EUZzP4+vXm2QuhWJdnKwJW
	 sS7HX/bPa/3MOXFjt5CvNPTPhA3TcLPNB7HjRmuK2dFNTF01ihGXnxo9VBn+fAJ2/X
	 4aYlPWliXoXDi0Un8J0ftB+7f0aDbfp0iuxS3lUElu/pyts7WN/r5EWwqNfY5hQ0wc
	 cDZ/SJjIRL+hQ==
X-Nifty-SrcIP: [209.85.216.41]
Received: by mail-pj1-f41.google.com with SMTP id n7-20020a17090aab8700b001c6aa871860so10309327pjq.2
        for <llvm@lists.linux.dev>; Fri, 25 Mar 2022 20:30:40 -0700 (PDT)
X-Gm-Message-State: AOAM530vhghnt+sIwgDw1jV/4/sNUPLfUV9C1agRPZxzpxn7CYTaz21/
	qfoMOrwq01d8Qra7Y5DOy4nSmnZZPrgkZEfxGzI=
X-Google-Smtp-Source: ABdhPJzPiJ4wuq5I5vyWDDF4VazaFgz2oC0/yz1qrcvL5oYYIMrDwPI9TS+4dEALJynnf23/xwJ3hzO02Sl/05U1NWU=
X-Received: by 2002:a17:902:b183:b0:14f:c266:20d5 with SMTP id
 s3-20020a170902b18300b0014fc26620d5mr15102742plr.136.1648265439319; Fri, 25
 Mar 2022 20:30:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220322173547.677760-1-nathan@kernel.org>
In-Reply-To: <20220322173547.677760-1-nathan@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 26 Mar 2022 12:29:55 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT8TcDy=iKaWZ7_+MbT84vOVEBzHxJY8Bx54Ju5fur8-w@mail.gmail.com>
Message-ID: <CAK7LNAT8TcDy=iKaWZ7_+MbT84vOVEBzHxJY8Bx54Ju5fur8-w@mail.gmail.com>
Subject: Re: [PATCH] um: Fix filtering '-mno-global-merge'
To: Nathan Chancellor <nathan@kernel.org>
Cc: Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        David Gow <davidgow@google.com>, linux-um@lists.infradead.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 23, 2022 at 2:39 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> When booting a clang compiled UML kernel, the kernel panics when trying
> to run init:
>
>   wait_stub_done : failed to wait for SIGTRAP, pid = 651294, n = 651294, errno = 0, status = 0xb7f
>   Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
>
> After the commit in Fixes, many flags from KBUILD_CFLAGS do not appear
> in USER_CFLAGS, likely due to USER_CFLAGS initially being a recursive
> variable ("VAR =") then being switched to a simple ("VAR :=") variable.
> For example, diffing arch/x86/um/.ptrace_user.o.cmd shows flags such as
> '-Os' and '-fno-delete-null-pointer-checks' getting dropped, which both
> impact code generation.
>
> Rework the filtering to use filter-out instead of patsubst, which allows
> all the patterns that USER_CFLAGS cares about to be excluded in one
> command and ensures all flags from KBUILD_CFLAGS are transferred over to
> USER_CFLAGS properly, which resolves the boot issue noted above.
>
> Fixes: 6580c5c18fb3 ("um: clang: Strip out -mno-global-merge from USER_CFLAGS")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>



Can we remove -mno-global-merge entirely?


61163efae02040f66a95 was a very old commit,
without enough explanation.

Shall we remove  -mno-global-merge, and do compile-tests.
If we are hit by problems for arm/arm64, we can re-add it.









> ---
>  arch/um/Makefile | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/arch/um/Makefile b/arch/um/Makefile
> index 320b09cd513c..d202f501e9e1 100644
> --- a/arch/um/Makefile
> +++ b/arch/um/Makefile
> @@ -70,15 +70,11 @@ KBUILD_CFLAGS += $(CFLAGS) $(CFLAGS-y) -D__arch_um__ \
>
>  KBUILD_AFLAGS += $(ARCH_INCLUDE)
>
> -USER_CFLAGS = $(patsubst $(KERNEL_DEFINES),,$(patsubst -I%,,$(KBUILD_CFLAGS))) \
> +USER_CFLAGS = $(filter-out $(KERNEL_DEFINES) -I% -mno-global-merge,$(KBUILD_CFLAGS)) \
>                 $(ARCH_INCLUDE) $(MODE_INCLUDE) $(filter -I%,$(CFLAGS)) \
>                 -D_FILE_OFFSET_BITS=64 -idirafter $(srctree)/include \
>                 -idirafter $(objtree)/include -D__KERNEL__ -D__UM_HOST__
>
> -ifdef CONFIG_CC_IS_CLANG
> -USER_CFLAGS := $(patsubst -mno-global-merge,,$(USER_CFLAGS))
> -endif
> -
>  #This will adjust *FLAGS accordingly to the platform.
>  include $(srctree)/$(ARCH_DIR)/Makefile-os-$(OS)
>
>
> base-commit: 82017457957a550d7d00dde419435dd74a890887
> --
> 2.35.1
>


-- 
Best Regards
Masahiro Yamada
