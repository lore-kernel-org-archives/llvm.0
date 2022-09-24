Received: from conssluserg-04.nifty.com (conssluserg-04.nifty.com [210.131.2.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0AF917D3
	for <llvm@lists.linux.dev>; Sat, 24 Sep 2022 14:29:28 +0000 (UTC)
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53]) (authenticated)
	by conssluserg-04.nifty.com with ESMTP id 28OETFmo018022
	for <llvm@lists.linux.dev>; Sat, 24 Sep 2022 23:29:16 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 28OETFmo018022
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1664029756;
	bh=WN5SfVJRQHxQx5Ik0fOFCLRbmFwj2uxRFSBKG7Z/Rzs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VZo0vTzCf24dRdtmm0jZzwU4gNcp9x/69MQPbP1sJCOw/6I/fyH25PSJphc8FSRzd
	 ZT2WGyPMDPhddAUwJYdL1OO13zEfBTt0AJOGOLXjVupiMMGPKG/3DYgIuVFvlZyZY9
	 r20OmYjwyzBwdTU1CeixMut6r19kHgVfeGKHr0WBX0eAdRKhw/S8/9VmGF5KpOr8bY
	 VyzJzb+QFM5cFyZ5Pv4iMf7mH6w8nYuWbtsm1k3geSLQLUpPGDAA44zRaj7l00PLf/
	 AzE0bh3OVrYYdZoSqsDma1IeNXWZ3pV9GU2pbb2iMPIRd+Piddit+n4dnLLDmH0BrI
	 m9ishjlgum9zA==
X-Nifty-SrcIP: [209.85.161.53]
Received: by mail-oo1-f53.google.com with SMTP id k11-20020a4ab28b000000b0047659ccfc28so464238ooo.8
        for <llvm@lists.linux.dev>; Sat, 24 Sep 2022 07:29:15 -0700 (PDT)
X-Gm-Message-State: ACrzQf0uKfL6O1Roq8nc7RY7+UMCRJZUxDXji9uG6xqyGbjkdSezBA7j
	EWFTcAH7RnltMN2c23eLykDboN759ZDB0HEy8M4=
X-Google-Smtp-Source: AMsMyM6KFBSh96Q9GRcRytcg/VzsIS3c2e+G514oSoFzPGXc17TWuaO1TCBtHpxAP+/qarm347cvjiTENqpPBCt+iAE=
X-Received: by 2002:a05:6820:1992:b0:475:c2c0:3f92 with SMTP id
 bp18-20020a056820199200b00475c2c03f92mr5517770oob.96.1664029754974; Sat, 24
 Sep 2022 07:29:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAK7LNAT_cMLGLBz7ugaLpJD3QmZmY8FK56x9nihvWeYhJpi2ag@mail.gmail.com>
 <20220919170828.3718437-1-ndesaulniers@google.com> <CAK7LNARk74U8AWzOVHP1pPVy2PNSMsNiyPL8bmFcYs6DkheorA@mail.gmail.com>
In-Reply-To: <CAK7LNARk74U8AWzOVHP1pPVy2PNSMsNiyPL8bmFcYs6DkheorA@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 24 Sep 2022 23:28:38 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQRV_Z+0V9gB0=KWKpQE=sH-Y4QVhgSjxc==412U=_LBw@mail.gmail.com>
Message-ID: <CAK7LNAQRV_Z+0V9gB0=KWKpQE=sH-Y4QVhgSjxc==412U=_LBw@mail.gmail.com>
Subject: Re: [PATCH v4] Makefile.compiler: replace cc-ifversion with
 compiler-specific macros
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <llvm@lists.linux.dev>,
        Bill Wendling <morbo@google.com>,
        Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, Sep 24, 2022 at 4:44 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Tue, Sep 20, 2022 at 2:08 AM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > cc-ifversion is GCC specific. Replace it with compiler specific
> > variants. Update the users of cc-ifversion to use these new macros.
> >
> > Link: https://github.com/ClangBuiltLinux/linux/issues/350
> > Link: https://lore.kernel.org/llvm/CAGG=3QWSAUakO42kubrCap8fp-gm1ERJJAYXTnP1iHk_wrH=BQ@mail.gmail.com/
> > Suggested-by: Bill Wendling <morbo@google.com>
> > Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> > ---
> > Changes v3 -> v4:
> > * Split into its own patch again from series, as per Masahiro.
> > * Rebase on top of b0839b281c427e844143dba3893e25c83cdd6c17 and update
> >   clang -Wformat logic in scripts/Makefile.extrawarn, as per Masahiro.
>
>
> Applied to linux-kbuild.
> Thanks.
>
>
>
> --
> Best Regards
> Masahiro Yamada






I noticed a small flaw now.



$ make mrproper; make
/bin/sh: 1: [: -ge: unexpected operator
***
*** Configuration file ".config" not found!
***
*** Please run some configurator (e.g. "make oldconfig" or
*** "make menuconfig" or "make xconfig").
***
Makefile:711: include/config/auto.conf.cmd: No such file or directory
make: *** [Makefile:720: .config] Error 1








This fails anyway, but it shows annoying

   /bin/sh: 1: [: -ge: unexpected operator



It is emit by this line:

  KBUILD_CFLAGS-$(call gcc-min-version, 90100) += -Wno-alloc-size-larger-than




When $(CONFIG_GCC_VERSION) is empty, it becomes invalid shell code:

     [ -ge $(1) ] && echo y





Now I just recalled why I wrote the original code like this:


  cc-ifversion = $(shell [ $(CONFIG_GCC_VERSION)0 $(1) $(2)000 ]  ...




-- 
Best Regards
Masahiro Yamada
